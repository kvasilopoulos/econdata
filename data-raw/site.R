# Build docs/ for GitHub Pages (branch master, folder /docs):
#   docs/data/<key>.csv + index.json + catalog/papers/sources/variables.csv  (static API)
#   docs/index.html, docs/variables.html                                      (Bootstrap 5 from CDN)
#   docs/articles/*.html                                                      (vignettes, self-contained)
# No site generator: plain string templating below. Run after catalog.R.
unlink("docs", recursive = TRUE)
dir.create("docs/data", recursive = TRUE)
dir.create("docs/articles")
file.create("docs/.nojekyll")

base <- "https://kvasilopoulos.github.io/econdata/"
for (f in list.files("data", full.names = TRUE)) load(f)

# CSV API ------------------------------------------------------------------

write_csv <- function(x, name) {
  x[] <- lapply(x, function(v) if (is.list(v)) vapply(v, paste, "", collapse = " and ") else v)
  utils::write.csv(x, file.path("docs/data", paste0(name, ".csv")), row.names = FALSE, na = "")
}
for (key in sub("\\.rda$", "", list.files("data"))) write_csv(get(key), key)
file.copy("data-raw/bib/papers.bib", "docs/data/papers.bib")

index <- transform(catalog, csv = paste0(base, "data/", key, ".csv"))
index$tags <- strsplit(index$tags, "|", fixed = TRUE)
jsonlite::write_json(index, "docs/data/index.json", pretty = TRUE, auto_unbox = TRUE, na = "null")

# HTML helpers ------------------------------------------------------------

esc <- function(x) {
  x <- ifelse(is.na(x), "", as.character(x))
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  gsub(">", "&gt;", x, fixed = TRUE)
}
a <- function(text, href, class = "") sprintf('<a href="%s" class="%s">%s</a>', href, class, text)
ref <- function(key) papers$REFERENCE[match(key, papers$BIBTEXKEY)]
authoryear <- function(key) papers$AUTHORYEAR[match(key, papers$BIBTEXKEY)]
# turn "_Journal_" and <url> in RefManageR text into HTML
ref_html <- function(x) {
  x <- esc(x)
  x <- gsub("_([^_]+)_", "<em>\\1</em>", x)
  gsub("&lt;(https?://[^&]+)&gt;", '<a href="\\1">\\1</a>', x)
}

css <- '
:root { --ink: #1b2a49; --accent: #c0334d; --rule: #dfe3ea; --muted: #5d6b7e; --paper: #fbfbfa; }
body { background: var(--paper); color: #1f2937; font-feature-settings: "kern", "liga"; }
h1, h2, h3 { font-family: "Newsreader", Georgia, "Times New Roman", serif; color: var(--ink); font-weight: 500; letter-spacing: -0.01em; }
h1 { font-size: clamp(2.4rem, 5vw, 3.6rem); line-height: 1.05; }
h2 { font-size: 1.75rem; margin-top: 3.5rem; margin-bottom: 1rem; }
h3 { font-size: 1.2rem; margin-top: 2rem; }
.navbar { background: var(--ink); }
.navbar .navbar-brand { font-family: "Newsreader", Georgia, serif; font-size: 1.4rem; }
.navbar .nav-link { color: rgba(255,255,255,.78); }
.navbar .nav-link:hover, .navbar .nav-link:focus { color: #fff; }
.lead { color: var(--muted); max-width: 40rem; }
a { color: var(--accent); }
code, .key { font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: .92em; }
.key { color: var(--ink); font-weight: 600; }
pre { background: #fff; border: 1px solid var(--rule); border-top: 0; border-radius: 0 0 .375rem .375rem; padding: 1rem; font-size: .85rem; margin: 0; white-space: pre-wrap; word-break: break-all; }
.nav-tabs .nav-link { color: var(--muted); }
.nav-tabs .nav-link.active { color: var(--ink); font-weight: 600; }
.chart { display: block; width: 100%; height: auto; }
.chart-caption { color: var(--muted); font-size: .85rem; }
.filters .btn-outline-secondary { --bs-btn-color: var(--ink); --bs-btn-border-color: var(--rule); --bs-btn-hover-bg: var(--ink); --bs-btn-hover-border-color: var(--ink); --bs-btn-active-bg: var(--ink); --bs-btn-active-border-color: var(--ink); }
.table { --bs-table-bg: transparent; border-color: var(--rule); }
.table th { color: var(--muted); font-weight: 500; font-size: .85rem; border-bottom: 2px solid var(--ink); white-space: nowrap; }
.table td { vertical-align: top; }
.table .title { max-width: 22rem; }
.table .paper { font-size: .85rem; color: var(--muted); }
.tag { display: inline-block; font-size: .72rem; padding: .1rem .45rem; margin: 0 .2rem .2rem 0; border: 1px solid var(--rule); border-radius: 1rem; color: var(--muted); background: #fff; white-space: nowrap; }
.btn-csv { --bs-btn-color: var(--accent); --bs-btn-border-color: var(--accent); --bs-btn-hover-bg: var(--accent); --bs-btn-hover-border-color: var(--accent); --bs-btn-hover-color: #fff; --bs-btn-padding-y: .15rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .8rem; }
.count { color: var(--muted); font-size: .9rem; }
.papers li { margin-bottom: .6rem; max-width: 60rem; }
.accordion { --bs-accordion-border-color: var(--rule); --bs-accordion-active-bg: #fff; --bs-accordion-active-color: var(--ink); --bs-accordion-btn-focus-box-shadow: 0 0 0 .2rem rgba(27,42,73,.2); }
.source { padding: .75rem 0; border-top: 1px solid var(--rule); }
.source:first-child { border-top: 0; }
.source small { color: var(--muted); }
footer { border-top: 1px solid var(--rule); color: var(--muted); font-size: .9rem; margin-top: 4rem; padding: 2rem 0; }
.side-nav { position: sticky; top: 1.5rem; font-size: .9rem; }
.side-nav a { display: block; color: var(--muted); padding: .15rem 0; text-decoration: none; }
.side-nav a:hover { color: var(--ink); }
@media (prefers-reduced-motion: reduce) { * { transition: none !important; } }
'

page <- function(title, body, active) {
  nav <- function(text, href, id) sprintf('<li class="nav-item"><a class="nav-link%s" href="%s">%s</a></li>',
                                          if (identical(id, active)) " active" else "", href, text)
  c('<!doctype html>', '<html lang="en">', '<head>',
    '<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">',
    sprintf('<title>%s</title>', title),
    '<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>',
    '<link href="https://fonts.googleapis.com/css2?family=Newsreader:opsz,wght@6..72,400;6..72,500&display=swap" rel="stylesheet">',
    '<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">',
    '<style>', css, '</style>', '</head>', '<body>',
    '<nav class="navbar navbar-expand-md navbar-dark"><div class="container">',
    '<a class="navbar-brand" href="index.html">econdata</a>',
    '<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>',
    '<div class="collapse navbar-collapse" id="nav"><ul class="navbar-nav ms-auto">',
    nav("Datasets", "index.html#datasets", "datasets"),
    nav("Variables", "variables.html", "variables"),
    nav("Papers", "index.html#papers", "papers"),
    nav("Find data", "index.html#sources", "sources"),
    nav("GitHub", "https://github.com/kvasilopoulos/econdata", "github"),
    '</ul></div></div></nav>',
    '<main class="container">', body, '</main>',
    '<footer><div class="container">',
    sprintf('econdata %s, MIT licence. Each dataset remains the property of its authors; cite the paper, not the package.', read.dcf("DESCRIPTION", "Version")),
    ' Missing something? <a href="https://github.com/kvasilopoulos/econdata/issues">Open an issue</a> or edit <code>data-raw/catalog.csv</code> / <code>data-raw/sources.csv</code> and send a pull request.',
    '</div></footer>',
    '<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>',
    '</body></html>')
}

# Hero chart: unemployment 1890-2015 (rz2018) with NBER recession bands ---

hero_chart <- function() {
  d <- rz2018[!is.na(rz2018$unemp), c("date", "unemp")]
  W <- 1000; H <- 220; pad <- c(t = 8, r = 8, b = 24, l = 34)
  x <- function(dt) pad[["l"]] + (W - pad[["l"]] - pad[["r"]]) * as.numeric(dt - min(d$date)) / as.numeric(diff(range(d$date)))
  ymax <- ceiling(max(d$unemp) / 5) * 5
  y <- function(v) pad[["t"]] + (H - pad[["t"]] - pad[["b"]]) * (1 - v / ymax)
  rec <- subset(nber_rec, !is.na(Peak) & Trough >= min(d$date) & Peak <= max(d$date))
  x0 <- x(pmax(rec$Peak, min(d$date))); x1 <- x(pmin(rec$Trough, max(d$date)))
  rects <- sprintf('<rect x="%.1f" y="%.1f" width="%.1f" height="%.1f"/>', x0, y(ymax), x1 - x0, y(0) - y(ymax))
  path <- paste0("M", paste(sprintf("%.1f %.1f", x(d$date), y(d$unemp)), collapse = " L"))
  yrs <- seq(1900, 2010, 20)
  xt <- sprintf('<text x="%.1f" y="%d" text-anchor="middle">%d</text>', x(as.Date(paste0(yrs, "-01-01"))), H - 6, yrs)
  yt <- sprintf('<text x="%d" y="%.1f">%d</text>', 2, y(seq(0, ymax, 5)) + 4, seq(0, ymax, 5))
  grid <- sprintf('<line x1="%d" x2="%d" y1="%.1f" y2="%.1f"/>', pad[["l"]], W - pad[["r"]], y(seq(5, ymax, 5)), y(seq(5, ymax, 5)))
  c(sprintf('<svg class="chart" viewBox="0 0 %d %d" role="img" aria-label="US unemployment rate 1890 to 2015 with NBER recessions shaded">', W, H),
    '<g fill="#e4e7ee">', rects, '</g>',
    '<g stroke="#dfe3ea" stroke-width="1">', grid, '</g>',
    sprintf('<path d="%s" fill="none" stroke="#1b2a49" stroke-width="1.6" stroke-linejoin="round"/>', path),
    '<g font-size="11" fill="#5d6b7e" font-family="system-ui, sans-serif">', xt, yt, '</g>',
    '</svg>')
}

# index.html --------------------------------------------------------------

cat_order <- c("Monetary policy", "Fiscal policy", "Business cycles", "Financial conditions",
               "Uncertainty", "Productivity", "Asset prices", "Oil and energy", "Crises", "Trade",
               "Labour", "Education", "Health", "Development and growth", "Inequality")
stopifnot(all(catalog$category %in% cat_order))

tag_html <- function(tags) vapply(strsplit(tags, "|", fixed = TRUE),
                                  function(t) paste(sprintf('<span class="tag">%s</span>', t), collapse = ""), "")
rows <- with(catalog, sprintf(
  '<tr data-cat="%s" data-text="%s">
<td><span class="key">%s</span></td>
<td class="title">%s<div class="paper">%s</div></td>
<td>%s</td><td class="text-nowrap">%s<br><span class="paper">%s</span></td><td class="text-nowrap">%s &times; %s</td>
<td>%s</td>
<td><a class="btn btn-outline-secondary btn-csv" href="data/%s.csv" download>csv</a></td>
</tr>',
  esc(category), tolower(esc(paste(key, title, category, gsub("|", " ", tags, fixed = TRUE), variables))),
  key, esc(title), ifelse(is.na(paper), "", a(esc(authoryear(paper)), source_url, "link-secondary")),
  esc(category), frequency, ifelse(is.na(start), "", paste(format(start, "%Y"), "to", format(end, "%Y"))), nrow, ncol,
  tag_html(tags), key))

cat_buttons <- c('<button type="button" class="btn btn-outline-secondary btn-sm active" data-cat="">All</button>',
                 sprintf('<button type="button" class="btn btn-outline-secondary btn-sm" data-cat="%s">%s</button>',
                         esc(cat_order), esc(cat_order)))

snippet <- function(id, lang, code, active = FALSE)
  sprintf('<div class="tab-pane%s" id="%s" role="tabpanel"><pre><code class="language-%s">%s</code></pre></div>',
          if (active) " show active" else "", id, lang, esc(code))
snippets <- c(
  '<ul class="nav nav-tabs" role="tablist">',
  sprintf('<li class="nav-item" role="presentation"><button class="nav-link%s" data-bs-toggle="tab" data-bs-target="#%s" type="button" role="tab">%s</button></li>',
          c(" active", "", "", ""), c("r", "py", "stata", "pkg"), c("R", "Python", "Stata", "R package")),
  '</ul><div class="tab-content">',
  snippet("r", "r", sprintf('sw2001 <- read.csv("%sdata/sw2001.csv")\nsw2001$date <- as.Date(sw2001$date)', base), TRUE),
  snippet("py", "python", sprintf('import pandas as pd\ngk2015 = pd.read_csv("%sdata/gk2015.csv", parse_dates=["date"])', base)),
  snippet("stata", "stata", sprintf('import delimited "%sdata/rz2018.csv", clear', base)),
  snippet("pkg", "r", 'pak::pak("kvasilopoulos/econdata")\nlibrary(econdata)\ncatalog      # what is in the package\nsw2001       # Stock and Watson (2001)'),
  '</div>')

api <- rbind(
  c("data/index.json", "this catalog as JSON, tags as arrays, with csv URLs"),
  c("data/catalog.csv", "the same table as CSV"),
  c("data/variables.csv", "column definitions for the wide panels"),
  c("data/papers.csv", "bibliography as a table"),
  c("data/papers.bib", "bibliography as BibTeX"),
  c("data/sources.csv", "external replication data sources"))

src_cats <- unique(sources$category)
sources_html <- unlist(lapply(seq_along(src_cats), function(i) {
  s <- sources[sources$category == src_cats[i], ]
  items <- sprintf('<div class="source">%s &mdash; %s<br><small>Used in: %s. %s, %s.</small></div>',
                   a(paste0("<strong>", esc(s$name), "</strong>"), s$url, "link-body-emphasis"),
                   esc(s$notes), esc(s$used_in), esc(s$frequency), esc(s$coverage))
  c(sprintf('<div class="accordion-item"><h3 class="accordion-header mt-0"><button class="accordion-button%s" type="button" data-bs-toggle="collapse" data-bs-target="#src%d">%s <span class="count ms-2">%d</span></button></h3>',
            if (i == 1) "" else " collapsed", i, esc(src_cats[i]), nrow(s)),
    sprintf('<div id="src%d" class="accordion-collapse collapse%s" data-bs-parent="#sources-acc"><div class="accordion-body">', i, if (i == 1) " show" else ""),
    items, '</div></div></div>')
}))

body <- c(
  '<section class="row align-items-end gy-4 mt-4">',
  '<div class="col-lg-6">',
  '<h1>The data behind the papers, ready to load.</h1>',
  sprintf('<p class="lead mt-3">%d datasets from influential empirical macro papers, curated as an R package and published as plain CSV so they work from any language. Each one keeps the sample and variables the authors used.</p>', nrow(catalog)),
  '</div>',
  '<div class="col-lg-6">', snippets, '</div>',
  '</section>',
  '<section class="mt-5">', hero_chart(),
  '<p class="chart-caption">US civilian unemployment rate, 1890&ndash;2015, from <span class="key">rz2018</span> (Ramey and Zubairy 2018), with NBER recessions from <span class="key">nber_rec</span>. Drawn from the CSVs on this page.</p>',
  '</section>',

  '<h2 id="datasets">Datasets</h2>',
  '<div class="filters d-flex flex-wrap gap-2 align-items-center mb-3">',
  '<input id="q" type="search" class="form-control form-control-sm" style="max-width:18rem" placeholder="Search key, title, tag or variable" aria-label="Search datasets">',
  '<div class="btn-group flex-wrap" role="group" aria-label="Filter by category">', cat_buttons, '</div>',
  '<span id="n" class="count ms-auto"></span>',
  '</div>',
  '<div class="table-responsive"><table class="table table-sm" id="catalog">',
  '<thead><tr><th>Key</th><th>Dataset</th><th>Category</th><th>Frequency</th><th>Rows &times; cols</th><th>Tags</th><th></th></tr></thead>',
  '<tbody>', rows, '</tbody></table></div>',
  '<p class="count">Column definitions for the wide panels are on the <a href="variables.html">variables</a> page. Dates are ISO <code>YYYY-MM-DD</code>; missing values are empty cells.</p>',

  '<h2 id="api">Static API</h2>',
  '<p class="lead">Everything on this page is a file you can fetch. There is no server and nothing to authenticate; pin a commit on GitHub if you need a frozen copy.</p>',
  '<table class="table table-sm" style="max-width:48rem"><tbody>',
  sprintf('<tr><td><a href="%s"><code>%s</code></a></td><td>%s</td></tr>', api[, 1], api[, 1], api[, 2]),
  '<tr><td><code>data/&lt;key&gt;.csv</code></td><td>one file per dataset</td></tr>',
  '</tbody></table>',

  '<h2 id="replications">Replications</h2>',
  '<p>Notebooks that reproduce a figure from the paper with the bundled data.</p>',
  '<ul><li><a href="articles/replication-sw2001.html">Stock and Watson (2001)</a>, the three-variable VAR</li>',
  '<li><a href="articles/replication-bbe2005.html">Bernanke, Boivin and Eliasz (2005)</a>, the 120-series FAVAR panel</li></ul>',

  '<h2 id="papers">Papers</h2>',
  '<ol class="papers">', sprintf('<li id="p-%s">%s<br><span class="count">key <span class="key">%s</span></span></li>', papers$BIBTEXKEY, ref_html(papers$REFERENCE), papers$BIBTEXKEY), '</ol>',

  '<h2 id="sources">Find other replication data</h2>',
  '<p class="lead">Freely available datasets behind commonly replicated papers that are not bundled here: too large, updated regularly, or restrictively licensed. Author websites are the best source for shock series because authors keep extending them.</p>',
  '<div class="accordion" id="sources-acc">', sources_html, '</div>',

  '<script>
(function () {
  var rows = Array.from(document.querySelectorAll("#catalog tbody tr"));
  var q = document.getElementById("q"), n = document.getElementById("n"), cat = "";
  function apply() {
    var s = q.value.trim().toLowerCase(), k = 0;
    rows.forEach(function (r) {
      var ok = (!cat || r.dataset.cat === cat) && (!s || r.dataset.text.indexOf(s) >= 0);
      r.hidden = !ok; if (ok) k++;
    });
    n.textContent = k === rows.length ? rows.length + " datasets" : k + " of " + rows.length;
  }
  q.addEventListener("input", apply);
  document.querySelectorAll(".filters [data-cat]").forEach(function (b) {
    b.addEventListener("click", function () {
      document.querySelectorAll(".filters [data-cat]").forEach(function (x) { x.classList.remove("active"); });
      b.classList.add("active"); cat = b.dataset.cat; apply();
    });
  });
  apply();
})();
</script>')

writeLines(page("econdata: macro datasets from the papers", body, "datasets"), "docs/index.html")

# variables.html ----------------------------------------------------------

keys <- unique(variables$dataset)
side <- c('<nav class="side-nav" aria-label="Datasets">',
          sprintf('<a href="#%s"><span class="key">%s</span></a>', keys, keys), '</nav>')
tables <- unlist(lapply(keys, function(key) {
  v <- variables[variables$dataset == key, ]
  c(sprintf('<h2 id="%s"><span class="key">%s</span> <span class="count">%d variables</span></h2>', key, key, nrow(v)),
    sprintf('<p class="count">%s <a href="data/%s.csv" class="btn btn-outline-secondary btn-csv ms-2" download>csv</a></p>',
            ref_html(ref(catalog$paper[catalog$key == key])), key),
    '<table class="table table-sm"><thead><tr><th>Variable</th><th>Description</th></tr></thead><tbody>',
    sprintf('<tr><td class="text-nowrap"><span class="key">%s</span></td><td>%s</td></tr>', esc(v$variable), esc(v$description)),
    '</tbody></table>')
}))
body <- c('<div class="row mt-4"><div class="col-lg-2 d-none d-lg-block">', side, '</div><div class="col-lg-10">',
          '<h1>Variables</h1>',
          '<p class="lead mt-3">Column definitions for the wide panels, taken from the readme sheets that ship with the original data. Also as <a href="data/variables.csv"><code>data/variables.csv</code></a>.</p>',
          tables, '</div></div>')
writeLines(page("econdata: variable definitions", body, "variables"), "docs/variables.html")

# Vignettes ---------------------------------------------------------------

for (v in list.files("vignettes", pattern = "\\.Rmd$", full.names = TRUE)) {
  rmarkdown::render(v, output_format = rmarkdown::html_document(self_contained = TRUE, theme = "cosmo"),
                    output_dir = "docs/articles", quiet = TRUE)
}
