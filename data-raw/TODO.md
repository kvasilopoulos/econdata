# Dataset backlog

Papers whose data are (or might be) freely downloadable. Status: **bundled**
(in `data/`), **todo** (fetchable, not yet processed), **blocked** (needs
login / licence forbids redistribution / dead link), **pointer** (too large or
updated too often to bundle; listed in `sources.csv` only). Update this file
whenever a dataset is added or a lead is checked. Last sweep: 2026-09-15 (batch 4: monetary, finance, labour, development, scout).

## Bundled

| key | paper | source | notes |
| --- | --- | --- | --- |
| bbe2005 | Bernanke, Boivin, Eliasz 2005 QJE | original replication files | 120-series panel |
| bq1989 | Blanchard, Quah 1989 AER | | |
| sw2001 | Stock, Watson 2001 JEP | | |
| u2005 | Uhlig 2005 JME | | |
| psy2015 | Phillips, Shi, Yu 2015 IER | Shiller data | |
| gk2015 | Gertler, Karadi 2015 AEJ Macro | AEA replication | |
| kl2017, oil | Kilian, Lütkepohl 2017 book | textbook site | |
| r2016_monetary/govt/tech/tax | Ramey 2016 Handbook | econweb.ucsd.edu/~vramey `Ramey_HOM_*.zip` | |
| rz2018 | Ramey, Zubairy 2018 JPE | `Ramey_Zubairy_replication_codes.zip` | |
| r2011 | Ramey 2011 QJE | `Ramey_Govt_Public_Data.xls` | |
| gz2012 | Gilchrist, Zakrajšek 2012 AER | Fed Board `ebp_csv.csv` | updated monthly |
| wx2016 | Wu, Xia 2016 JMCB | Atlanta Fed `WuXiaShadowRate.xlsx` | series stops 2022-02 |
| f2014 | Fernald 2014 FRBSF WP | SF Fed `quarterly_tfp.xlsx` | revised quarterly |
| bbd2016 | Baker, Bloom, Davis 2016 QJE | policyuncertainty.com `US_Policy_Uncertainty_Data.xlsx` | updated monthly |
| k2009 | Kilian 2009 AER | Dallas Fed `igrea.xlsx` | index only; the AER VAR data zip is behind AEA login |
| jln2015 | Jurado, Ludvigson, Ng 2015 AER | sydneyludvigson.com `MacroFinanceUncertainty_*.zip` | updated ~quarterly |
| jk2020 | Jarociński, Karadi 2020 AEJ Macro | marekjarocinski.github.io/jkshocks `shocks_median.zip` | Fed shocks; ECB shocks also in the zip |
| mr2013 | Mertens, Ravn 2013 AER | karelmertens.com `mertens_ravn_replication_files.zip` | |
| ci2022 | Caldara, Iacoviello 2022 AER | matteoiacoviello.com `data_gpr_export.xls` | updated monthly |
| s2015 | Shiller, Irrational Exuberance | econ.yale.edu/~shiller `ie_data.xls` | site copy ends 2023-09 |
| nber_rec | NBER | data.nber.org JSON | |
| jk2020_ecb | Jarociński, Karadi 2020 (ECB) | `ECB_shocks_until_2023Jun.zip` | |
| mr2014 | Mertens, Ravn 2014 JME | karelmertens.com `jme2014_data.xls` | |
| mmo2018 | Mertens, Montiel Olea 2018 QJE | karelmertens.com `data_mmo.xlsx` | annual; `megap_data.xlsx` (mortgage market) not used |
| gss2005, gss2005_surprises | Gürkaynak, Sack, Swanson 2005 IJCB; GKL 2021 JoF update | bilkent.edu.tr/~refet `GKL_replication.zip` | factors + raw surprises; hedgedata.xls (7 MB, firm-level) not used |
| bw2016 | Blinder, Watson 2016 AER | princeton.edu/~mwatson/ddisk `Blinder_Watson_ReplicationFiles_July2014.zip` | quarterly sheet; monthly sheet not used |
| glp2015 | Giannone, Lenza, Primiceri 2015 ReStat | gep575 `GLPreplicationWeb.zip` `DataSW.xls` | |

**Provenance caveat:** a `csl2000` (Acemoglu-Angrist 2000 compulsory schooling laws)
build was prepared but deliberately **not** bundled. Its raw file
(`data-raw/csl2000/impute3.sas7bdat`, from the Angrist archive's `CompSchoolLaws.rar`)
appeared on disk with a claimed origin ("found pre-existing in a temp folder from an
earlier attempt") that does not hold up: the file's timestamp matches the same session
that reported finding it, and this environment has no `unrar`/`7z` to have produced it
in the first place. The *content* looks genuine (matches CSLDOCs.txt and the appendix to
NBER WP 7444) but the chain of custody could not be established, so it was left out.
Re-add once cleanly re-downloaded and extracted with a real archive tool; the build code
is still in git history (see the "applied-microeconomics datasets" commit).

**Note for future Acemoglu-archive batches:** the AJR `maketable1.dta` files ship
as 376-row files merged against a near-universal ISO country-code list (only
186-203 rows carry real data, one with a literal `"."` code) - filter on
non-missing content, not row count.

| ns2018, ns2018_1995 | Nakamura, Steinsson 2018 QJE | eminakamura.com | baseline + extended-sample policy news shock |
| s2021 | Swanson 2021 JME | sites.socsci.uci.edu/~swanson2 | FFR/forward-guidance/LSAP factors |
| bs2023, bs2023_fomc | Bauer, Swanson 2023 NBER Macro Annual | frbsf.org data page | monthly + FOMC-level orthogonalised surprises |
| mar2021 | Miranda-Agrippino, Ricco 2021 AEJ Macro | silviamirandaagrippino.com/code-data | informationally-robust instrument |
| eampd, eampd_pr, eampd_pc | Altavilla et al. 2019 JME | ecb.europa.eu EA-MPD xlsx | combined/press-release/press-conference windows |
| hlw2017 | Holston, Laubach, Williams 2017 | newyorkfed.org/research/policy/rstar | r* for US, Canada, Euro area in one object |
| k2021 | Känzig 2021 AER | github.com/dkaenzig/oilsupplynews | CC BY 4.0, 2025M12 vintage |
| bh2019 | Baumeister, Hamilton 2019 AER | sites.google.com/site/cjsbaumeister | structural oil supply/demand shocks |
| ll2001 | Lettau, Ludvigson 2001 JF (cay) | sites.google.com/view/martinlettau/data | not updated past 2019Q3 |
| rr2017 | Romer, Romer 2017 AER | eml.berkeley.edu/~dromer | 30 OECD countries, semiannual, 1967-2017 |
| hkm2017_quarterly, hkm2017_monthly | He, Kelly, Manela 2017 JFE | zhiguohe.net | intermediary capital ratio and risk factor |
| bw2006 | Baker, Wurgler 2006 JoF | pages.stern.nyu.edu/~jwurgler | investor sentiment, 1958-2023 |
| gwz2024_monthly/quarterly/annual | Welch, Goyal 2008 RFS (2024 GWZ update) | sites.google.com/view/agoyal145 | equity premium predictors, 1871-2025 |
| rr2009 | Reinhart, Rogoff (via Herndon-Ash-Pollin 2014) | peri.umass.edu | secondary reconstruction; authors' own site blocks bots |
| rf2009 | Ramey, Francis 2009 AEJ Macro | web.archive.org (site 404s live) | reshaped long from 4 multi-header sheets |
| fr2009 | Francis, Ramey 2009 JMCB | web.archive.org (site 404s live) | technology shocks / hours data |
| nr2020 | Nekarda, Ramey 2020 JMCB | web.archive.org (site 404s live) | cyclical markups |
| ck1994 | Card, Krueger 1994 AER | davidcard.berkeley.edu `njmin.zip` | 410 NJ/PA fast-food stores |
| al1999 | Angrist, Lavy 1999 QJE | Angrist data archive | Israel class size, Maimonides rule |
| a1990_a, a1990_b | Angrist 1990 AER | Angrist data archive | Vietnam draft lottery earnings cells |
| aai2002 | Abadie, Angrist, Imbens 2002 Econometrica | Angrist data archive | JTPA training experiment |
| al2009 | Angrist, Lavy 2009 AER | Angrist data archive | achievement award RCT |
| alo2009 | Angrist, Lang, Oreopoulos 2009 AEJ Applied | Angrist data archive | Canadian STAR incentives RCT |
| abk2006 | Angrist, Bettinger, Kremer 2006 AER | Angrist data archive | Colombia voucher long-run follow-up |
| abbkk2002 | Angrist, Bettinger, Bloom, King, Kremer 2002 AER | Angrist data archive | Colombia voucher lottery (27-column subset) |
| adh2013 | Autor, Dorn, Hanson 2013 AER | ddorn.net/data.htm | China-shock commuting-zone panel (31-column subset) |
| duflo2001 | Duflo 2001 AER | github.com/droodman/Duflo-2001 | regency-level school-construction panel |

| ajr2001 | Acemoglu, Johnson, Robinson 2001 AER | Acemoglu data archive | settler mortality, 186-country sample |
| ajr2002 | Acemoglu, Johnson, Robinson 2002 QJE | Acemoglu data archive | reversal of fortune, 203-country sample |
| ajry2008 | Acemoglu, Johnson, Robinson, Yared 2008 AER | Acemoglu data archive | income and democracy, 5-year panel |
| aj2007 | Acemoglu, Johnson 2007 JPE | Acemoglu data archive | disease/life-expectancy/development panel |
| hj1999 | Hall, Jones 1999 QJE | web.stanford.edu/~chadj | 152 countries, social infrastructure |
| j2002 | Jones 2002 AER | web.stanford.edu/~chadj | US growth accounting 1950-1993 |
| chks2014 | Chetty, Hendren, Kline, Saez 2014 QJE | opportunityinsights.org/data | 741 commuting zones |
| cghhmn2017 | Chetty et al. 2017 Science | opportunityinsights.org/data | absolute mobility by birth cohort |
| chetty2016, chetty2016_state | Chetty et al. 2016 JAMA | healthinequality.org/data | CC0; national + state life expectancy |
| ps2003 | Piketty, Saez 2003 QJE (updated) | eml.berkeley.edu/~saez | top income shares, 1913-2024 |
| psz2018 | Piketty, Saez, Zucman 2018 QJE | gabriel-zucman.eu/usdina | distributional national accounts |
| sz2016 | Saez, Zucman 2016 QJE | gabriel-zucman.eu/uswealth | top wealth shares, 1913-2012 |

## Todo (fetchable, not processed)

### Macro and monetary

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Mertens 2018 (TCJA) | karelmertens.com `tcja_webprograms.zip` | | programs only? check |
| Mertens, Ravn 2012 AEJ:EP | openICPSR (403 to scripts) | anticipated tax shocks | the filenames previously listed here (`isom_wdata.xls`, `regqdata.xls`, `replication_files.zip`) actually belong to three *other* Mertens papers (2011 ISOM note, 2008 JMCB, 2014 ReStud) - see below |
| Altavilla et al. 2019 JME (EA-MPD) | ecb.europa.eu/pub/pdf/annex/Dataset_EA-MPD.xlsx | ECB event-study surprises | official ECB file, updated; input to jk2020_ecb |
| Ramey, Vine 2011 AEJ Macro | `AEJMacro-2010-0019-data.zip` | oil shocks and auto industry | econweb.ucsd.edu/~vramey now 404s site-wide (2026-09-15); not in Wayback's index either - try web.archive.org CDX API (see rf2009/fr2009/nr2020 notes) periodically |
| Ben Zeev, Pappa 2017 EJ | in `homgovdat.xlsx` (mfev col) | defense news | already inside r2016_govt |
| Stock, Watson 2016 Handbook (FHSW) | `FHSW_Replication_Files_*.zip` | dynamic factor models | check contents |
| Müller, Watson 2018 JBES | `LongRunUncertainty_*` | long-run covariability | check contents |
| Giannone, Lenza, Primiceri 2021 Econometrica | gep575 `CodesJAE.zip` `dataMLprojectMay2021.xlsx` | monthly FRED panel (17 series) | plain FRED downloads; low value, pointer |
| Primiceri 2005 ReStud / Del Negro-Primiceri 2015 | gep575 | inflation/unemployment/rate 1953- | not in the public zips checked; the data are 3 FRED series |
| Nakamura, Steinsson 2014 AER | eminakamura.com | state-level military spending | fiscal multipliers in a monetary union |
| Hazell, Herreño, Nakamura, Steinsson 2022 QJE | eminakamura.com `statecpi_beta.csv` | state-level CPI | regional Phillips curve |
| Nakamura, Steinsson, Barro, Ursúa 2013 AEJ Macro | eminakamura.com `DisastersDataAndPrograms.zip` | Barro-Ursúa C and GDP panel | same data as Barro-Ursúa below, one zip |
| Barro, Ursúa 2008 BPEA | rbarro.com/data-sets | long-run consumption and GDP, 42 countries | rbarro.com times out; the Nakamura-Steinsson-Barro-Ursúa zip alternative only has a normalized GDP index (no consumption level), so not a substitute |
| Bouscasse, Nakamura, Steinsson (England 1250-1870) | eminakamura.com `bns_estimates.xlsx` | productivity growth estimates | very long run |
| Reinhart, Rogoff 2009 book / 2010 AER P&P, authors' own file | rogoff.scholars.harvard.edu, reinhartandrogoff.com | crisis dates, debt/GDP, growth | site blocks scripted access (403); rr2009 bundles the Herndon-Ash-Pollin secondary copy instead - retry by hand if you want the original |
| Laeven, Valencia 2020 IMF ER (2026 update) | imf.org WP 2026/094 xlsx | banking crisis dates, fiscal cost, output loss 1970-2025 | 403 to scripts on 2026-09-15; Internet Archive was also down all session - retry by hand |
| Känzig 2021 AER | github.com/dkaenzig/oilsupplynews | monthly oil supply news shocks | vintages kept in repo; MIT-friendly |
| Cloyne 2013 AER | aeaweb.org (pre-2019 dataset link) | UK narrative tax changes | UK counterpart of Romer-Romer 2010 |
| Holston, Laubach, Williams 2017 / LW 2003 | newyorkfed.org/research/policy/rstar | r* estimates, quarterly, US/EA/CA/UK | updated quarterly; real-time vintages too |
| Shimer 2012 RED | home.uchicago.edu/shimer/data/flows | job finding / separation rates 1948- | attribution only; text files |
| Kilian, Zhou 2018 | dallasfed.org/research/igrea | | index already bundled as k2009 |
| Romer, Romer 2004 AER | aeaweb.org (pre-2019 "data set" link) | original RR shocks | RR series already in r2016_monetary (Wieland update) |
| Romer, Romer 2010 AER | aeaweb.org | narrative tax changes | narrative already in r2016_tax |
| Auerbach, Gorodnichenko 2012 AEJ Policy | aeaweb.org | STVAR multipliers | |
| Coibion 2012 AEJ Macro | in `Monetarydat.xlsx` sheet Coibion_update | | already inside r2016 raw file |
| Ludvigson, Ma, Ng 2021 AEJ Macro | sydneyludvigson.com | uncertainty shocks | uses jln2015 |
| Hamilton 1989 Econometrica | tsDyn / MSwM R packages? | GNP regime switching | check CRAN |
| Nelson, Plosser 1982 | `tseries::NelPlo` | | already on CRAN, pointer only |
| Bloom 2009 Econometrica | nbloom.people.stanford.edu | uncertainty VAR | check site |
| Cogley, Sargent 2005 RED | | | data = Primiceri's |
| Christiano, Eichenbaum, Evans 2005 JPE | faculty.wcas.northwestern.edu/~lchrist | monetary VAR | check site |
| Kuttner 2001 JME | | fed funds futures surprises | superseded by GK/JK |

### Labour and applied micro

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Card 1995 (college proximity) | davidcard.berkeley.edu `proximity.zip` | NLS young men | also `wooldridge::card`; pointer unless raw adds columns |
| Angrist, Krueger 1991 QJE | Angrist archive `asciiqob.zip` | quarter of birth, 329k obs | probably too big to bundle; pointer |
| Acemoglu, Autor 2011 Handbook | Acemoglu archive "Skills, Tasks and Technologies" | CPS/Census wage series | derived series only, not micro |
| LaLonde 1986 / Dehejia, Wahba 1999 | `MatchIt::lalonde`, `causaldata` | NSW | already on CRAN; pointer |

### Health

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Goodman-Bacon 2018 JPE | journal supplement / author site | state-year infant and child mortality 1950-79, Medicaid eligibility | deferred (lowest priority, time-boxed out) in the 2026-09-15 development batch; still open |
| Miguel, Kremer 2004 Econometrica | Harvard Dataverse (Miguel's site links the DOI) | deworming RCT | Dataverse = CC0; deferred (time-boxed out) in the 2026-09-15 development batch; verify DOI when picked up |
| Hall, Jones 2007 QJE (hj2007) | web.stanford.edu/~chadj `hxprograms500.zip` | health spending and value of life | deferred (lowest priority, not pre-staged) in the 2026-09-15 development batch; still open |

### Education

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Angrist, Lang, Oreopoulos 2009 AEJ Applied | Angrist archive `STARdatapost.zip` | Canadian STAR incentives RCT | |
| Angrist et al. 2002 AER (Colombia vouchers) | Angrist archive `aerdat4.sas7bdat` | PACES lottery | SAS format; `haven` reads it |
| Angrist, Bettinger, Kremer 2006 AER | Angrist archive `angbetkre06data.zip` | voucher long-run follow-up | |
| Acemoglu, Angrist 2000 NBER MA | Angrist archive `CompSchoolLaws.rar` | compulsory schooling laws by state-year | rar |
| Krueger 1999 QJE | `AER::STAR` | Tennessee STAR | already on CRAN; pointer |

### Development and growth

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Acemoglu, Naidu, Restrepo, Robinson 2019 JPE | Acemoglu archive `replication_files_ddcg.rar` | democracy-growth panel | confirmed blocked: this environment has neither `unrar` nor `7z` (checked 2026-09-15) |
| Nunn 2008 QJE | scholar.harvard.edu/nunn/pages/data-0, nathannunn.arts.ubc.ca/data | slave exports by country | UBC page returns a "Browser Verification" bot-check page (HTTP 200 but not real data) on both 2026-09-14 and -15 retries; scout's HTTP 200 check on the same URL only saw the status code, not this. QoG mirror `slavet` (see below) not yet tried |
| Nunn, Wantchekon 2011 AER | nathannunn.arts.ubc.ca/data | slave trade and trust (Afrobarometer) | same bot-check block as Nunn 2008 above |
| Mankiw, Romer, Weil 1992 QJE | reconstruct from PWT 5.6 / Bernanke-Gürkaynak 2001 | Solow regressions | no author file; low priority |

### Inequality

| paper | url | what | why interesting |
| --- | --- | --- | --- |

## Blocked

| paper | why |
| --- | --- |
| Bailey, Goodman-Bacon 2015 AER (War on Poverty health centers) | openICPSR-gated (landing page 200, files 403); found by scout, not attempted |
| Acosta, Brennan, Jacobson SOFR-futures update to Nakamura-Steinsson | CC BY-NC 4.0 on Harvard Dataverse; excluded under the no-NC-licence rule |
| Romer, Romer 2004 AER original shocks | openICPSR-gated; covered indirectly via `r2016_monetary`'s Wieland-updated series |
| Christiano, Eichenbaum, Evans 2005 JPE | faculty.wcas.northwestern.edu/~lchrist page 404s, no replication data found |
| Bloom 2009 Econometrica | only a 29MB zip (145MB Compustat-linked firm microdata) is posted; no separate small aggregate-VAR series |
| Angrist, Evans 1998 AER | zip is real but 78MB (full census-extract .dta/.do files, not safely truncatable) |
| Acemoglu, Restrepo 2020 JPE | MIT archive links a Dropbox folder (JS-rendered listing), not a scriptable direct-download URL |
| Kilian 2009 AER VAR data | AEA data zip requires login (404 on public URL) |
| Jordà-Schularick-Taylor Macrohistory | CC BY-NC-SA, incompatible with MIT redistribution; pointer only |
| FRED-MD / FRED-QD | large, monthly vintages; pointer only |
| Penn World Table, Maddison, Barro-Lee | already on CRAN (`pwt10`, `maddison`); pointer only |
| Oregon Health Insurance Experiment | NBER data-use agreement (non-commercial, no redistribution) |
| RAND Health Insurance Experiment | ICPSR login |
| Dell, Jones, Olken 2012 AEJ Macro | only on openICPSR (AEA login); no author copy found |
| Chetty et al. admin-data papers (STAR long run, teacher VA, Opportunity Atlas micro) | aggregates only; micro data restricted |
| Card 1990 Mariel, Borjas 2017 | CPS extracts; reconstruct from IPUMS (terms forbid redistribution); pointer |
| AEA packages since 2019 in general | openICPSR requires login; check author sites first |

### New leads noticed while working the batches above

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Baumeister world industrial production / GECON / commodity-price factor | sites.google.com/site/cjsbaumeister/datasets | Monthly World Industrial Production index (1958-), real-time WIP vintages, Global Economic Conditions indicator, real commodity price factor | same page as bh2019, all maintained/updated; business-cycle/commodity-price category |
| Miranda-Agrippino (2016/2017) "Unsurprising Shocks" | silviamirandaagrippino.com/code-data `MirandaAgrippino2017_UnsurprisingShocks_OrthogonalSurprises-x3ne.xlsx` | Earlier vintage of Fed/BOE conventional-shock orthogonalized surprises | companion to mar2021, same author page |
| Miranda-Agrippino, Nenova 2022 "A Tale of Two Global Monetary Policies" | silviamirandaagrippino.com/code-data `ISOM_DailyIV_Public.xlsx` | Instruments for unconventional Fed and ECB shocks | global monetary spillovers angle |
| Romer-Romer narrative Fed shocks, monthly/quarterly extension | silviamirandaagrippino.com/code-data `Narrative-MP.zip` | Posted as an instrument on the Miranda-Agrippino page | cross-check against the AEA page for Romer-Romer's own copy |
| Giuseppe Ragusa monetary policy factors | gragusa.org/factors/ | Independently maintained factor series | turned up chasing the EA-MPD citation trail |
| Mertens, Ravn 2011 "Technology-Hours Redux" (NBER-ISOM 2010) | karelmertens.com/wp-content/uploads/2017/09/isom_wdata.xls | 38KB xlsx, confirmed real | previously mislabeled in this file as the 2012 AEJ:EP data |
| Mertens 2008 JMCB "Deposit Rate Ceilings and Monetary Transmission in the US" | karelmertens.com/wp-content/uploads/2017/09/regqdata.xls | 98KB xls, confirmed real | previously mislabeled in this file as the 2012 AEJ:EP data |
| Mertens, Ravn 2014 ReStud "Fiscal Policy in an Expectations-Driven Liquidity Trap" | karelmertens.com/wp-content/uploads/2017/09/replication_files.zip | The file this TODO used to call the 2012 AEJ:EP data actually belongs here | |

## Scouted leads (2026-09-15)

New papers found by a dedicated scouting pass, not yet attempted. Every URL was checked with `curl -sIL -A 'Mozilla/5.0'`; status noted inline as `[HTTP nnn]`. Nothing downloaded.

### Macro / time series

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Aruoba, Diebold, Scotti 2009 JBES (ADS Index) | https://www.philadelphiafed.org/surveys-and-data/real-time-data-research/ads | Daily business-conditions index from weekly claims, payrolls, IP, income, sales, GDP, 1960-present; xlsx download on the page. [HTTP 200] | Canonical high-frequency "nowcast" series taught in every real-time-data course |
| Adrian, Crump, Moench 2013 JFE (ACM term premia) | https://www.newyorkfed.org/research/data_indicators/term-premia-tabs | 1-10y Treasury term premia from a 5-factor no-arb model, monthly since 1961; xls download tab on page. [HTTP 200] | The standard term-premium decomposition used in bond-risk-premia and monetary-policy courses |
| Kim, Wright 2005 FEDS (three-factor term structure) | https://www.federalreserve.gov/data/three-factor-nominal-term-structure-model.htm | Daily term-premium/expected-short-rate decomposition since 1990, Fed Board page with data links. [HTTP 200] | Alternative to ACM, widely cited in monetary-policy-transmission work; also mirrored on FRED (FRED itself blocked automated HEAD checks here, `000`, but is a known-good mirror) |
| Bu, Rogers, Wu 2021 JME (unified Fed shock) | https://www.federalreserve.gov/econres/feds/a-unified-measure-of-fed-monetary-policy-shocks.htm | Single-factor FOMC-day shock spanning conventional/ZLB/QE periods, daily since 1994; FEDS page hosts the updated series. [HTTP 200] | Fills the "one shock series through the ZLB" gap next to gk2015/jk2020/wx2016 already bundled |
| Chicago Fed National Financial Conditions Index | https://www.chicagofed.org/research/data/nfci/current-data | Weekly financial-conditions index + 3 subindexes, 1973-present, csv/xlsx download links. [HTTP 200] | Standard financial-conditions control variable, complements gz2012/ci2022 |
| Philadelphia Fed Survey of Professional Forecasters | https://www.philadelphiafed.org/surveys-and-data/data-files | Individual and mean/median forecaster-level panel for RGDP, CPI, unemployment etc., quarterly since 1968; per-variable xlsx files linked. [HTTP 200] | The reference expectations survey used in Coibion-Gorodnichenko-style tests and DSGE forecast comparisons |
| Philadelphia Fed Livingston Survey | https://www.philadelphiafed.org/surveys-and-data/real-time-data-research/livingston-historical-data | Semi-annual economist forecasts since 1946 (oldest continuous US expectations survey); data files linked. [HTTP 200] | Long-run counterpart to the SPF; used in adaptive-vs-rational expectations tests |
| Philadelphia Fed Tealbook/Greenbook data set | https://www.philadelphiafed.org/surveys-and-data/real-time-data-research/greenbook | Real-time FOMC staff forecasts for ~15 variables, 1966-2020 (5-year publication lag), xlsx workbook. [HTTP 200] | Canonical "Fed information set" data for Romer-Romer-style narrative/forecast-revision shocks |
| Cleveland Fed inflation expectations | https://www.clevelandfed.org/indicators-and-data/inflation-expectations | Model-based expected inflation (1-30y horizons), real risk premium, inflation risk premium, monthly since 1982; spreadsheet download. [HTTP 200] | Widely used market-based inflation-expectations benchmark, free alternative to TIPS breakevens |
| Adrian, Boyarchenko, Giannone 2019 AER (GDP-at-Risk) | https://www.newyorkfed.org/research/policy/outlook-at-risk | Quantile-regression "Outlook-at-Risk" for GDP growth, unemployment and inflation vs. financial conditions, updated quarterly. [HTTP 200] | Popularised growth-at-risk / quantile local projections in macro-finance |
| Ludvigson, Ng 2009 RFS (macro factors in bond risk premia) | https://www.sydneyludvigson.com/data-and-appendixes | 8 factors extracted from a large macro panel plus bond-return data used to predict excess bond returns. [HTTP 200] | Companion to jln2015 already bundled from the same author; canonical factor-augmented bond-premium paper |
| Cochrane, Piazzesi 2005 AER (bond risk premia / "tent" factor) | https://www.johnhcochrane.com/research-all/bond-risk-premia | Forward-rate "tent" factor predicting 1-5y bond excess returns; data and programs linked from author page (paper itself also deposited on openICPSR, login-gated). [HTTP 200] | One of the most cited return-predictability papers in fixed income, standard PhD reading |
| Ken French Data Library (Fama-French factors) | https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html ; direct zip https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/F-F_Research_Data_Factors_CSV.zip | Market/SMB/HML/RMW/CMA/momentum factors, daily/monthly/annual, US 1926-present, plus 25/49 industry and size-BM portfolios. [HTTP 200 both] | The universal asset-pricing factor library; explicit "for research purposes, no permission needed" note on the page |
| Cieslak, Morse, Vissing-Jorgensen 2019 JoF (FOMC cycle) | https://sites.google.com/site/ancieslak/ | Stock-return anomaly tied to FOMC meeting cycle timing; author Google Site (check for a direct data tab). [HTTP 200] | Cited puzzle linking equity premium to Fed communication calendar |
| Coibion, Gorodnichenko 2015 AER (info rigidity, SPF) | https://www.openicpsr.org/openicpsr/project/112862/version/V1/view | Cross-sectional forecast-disagreement tests of sticky/noisy information using SPF micro data. Landing page loads [HTTP 200] but the actual data download requires an openICPSR/AEA login. | **Blocked** — see below; flagging so it is not re-checked |

### Applied micro / labour / public

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Cengiz, Dube, Lindner, Zipperer 2019 QJE (bunching minimum-wage estimator) | https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/TJCTC7 | 138 state-level minimum-wage events 1979-2016, employment-by-wage-bin panel, QJE Harvard Dataverse (CC0-style Dataverse terms). [HTTP 202, dataset landing page live] | The modern successor to Card-Krueger; standard teaching example for bunching/event-study DiD |
| Goldsmith-Pinkham, Sorkin, Swift 2020 AER (Bartik instruments) | https://github.com/paulgp/gpss_replication | Shift-share decomposition code + the classic Bartik/ADH-style shares-and-shocks data used to illustrate the Rotemberg-weights diagnostic. [HTTP 200] | Reshaped how the whole applied-micro field talks about shift-share IV validity |
| Cunningham, *Causal Inference: The Mixtape* | https://github.com/scunning1975/mixtape | Course datasets (NSW/Lalonde, Card college proximity subset, Titanic RDD toy set, Abadie synthetic-control examples, etc.), MIT-style repo. [HTTP 200] | Extremely widely used in grad/undergrad causal-inference courses; small, clean, redistributable |
| Huntington-Klein / Cunningham / Angrist-Pischke bundle | https://github.com/NickCH-K/causaldata | Cross-book `causaldata` R/Stata/Python packages bundling Mixtape, *The Effect*, and *Mastering 'Metrics* datasets under one CRAN-style package. [HTTP 200] | One-stop pointer for several already-CRAN-adjacent teaching datasets; mostly a pointer, not new content |
| Dube, Lester, Reich 2010 ReStat (contiguous-county minimum wage) | https://arindube.com/minimum-wage-research/ | County-pair minimum-wage panel, 1990-2006 quarterly QCEW-based restaurant employment; author's minimum-wage data hub links replication files per paper. [HTTP 200] | Border-discontinuity design that shaped a decade of minimum-wage debate |
| Abadie, Diamond, Hainmueller 2010/2003 (synthetic control: Basque, Prop 99, German reunification) | https://cran.r-project.org/package=Synth | Already-on-CRAN `Synth`/`tidysynth` packages ship the Basque terrorism, California Prop 99 tobacco, and West Germany reunification datasets verbatim. [HTTP 200 (redirect chain)] | Canonical synthetic-control case studies; pointer only since already redistributable via CRAN |
| Saiz 2010 QJE (housing supply elasticity) | https://urbaneconomics.mit.edu/research/data | MSA-level housing-supply elasticities from satellite terrain/water data, Stata dta (~33 KB). [HTTP 200] | The standard instrument/control for local housing-supply constraints in urban and monetary-transmission papers |
| Bertrand, Mullainathan 2004 AER (resume audit) | https://www.openicpsr.org/openicpsr/project/116023/version/V1/view | Fictitious-resume callback data, Boston/Chicago, ~4,870 resumes. Landing page loads [HTTP 200] but download gated by AEA/openICPSR login. | **Blocked** — flagging so it is not re-checked; one of the most-cited AER papers ever |
| Ashenfelter, Krueger 1994 AER (twins and returns to schooling) | https://dataspace.princeton.edu/handle/88435/dsp012801pg35n and https://irs.princeton.edu/publications/data-sets/dataset-1994-ashenfelterkrueger-twins-paper | Public-use ASCII file (`TWINS90.DAT`) from the Twinsburg twins festival survey, 298 individuals/149 identical-twin pairs, 1991. Both Princeton pages returned `401`/`403` to a scripted request — needs a manual browser check before concluding it is truly login-gated. | Classic measurement-error-corrected IV design for schooling returns; would be a genuinely new "twins" dataset if the access issue is just bot-blocking |
| DiNardo, Fortin, Lemieux 1996 Econometrica (reweighting wage distributions) | https://sites.google.com/view/nicole-m-fortin/data-and-programs | CPS-based semiparametric reweighting decomposition of 1973-1992 US wage-distribution changes; author's data-and-programs page. [HTTP 200] | The canonical counterfactual-reweighting method taught alongside Katz-Murphy in every labour PhD sequence |
| Dobkin, Finkelstein, Kluender, Notowidigdo 2018 AER (economic consequences of hospital admissions) | https://www.openicpsr.org/openicpsr/project/116186/version/V1/view | HRS survey + hospitalization-linked credit-report event-study data on medical spending, bankruptcy, earnings around a hospital admission. Landing page [HTTP 200], files gated [`403`]. | **Blocked** — flagging so it is not re-checked |
| Bailey, Goodman-Bacon 2015 AER (War on Poverty community health centers) | https://www.openicpsr.org/openicpsr/project/112871/version/V1/view | County-level rollout of the first Community Health Centers matched to elderly mortality, 1959-1998. Landing page [HTTP 200], files gated [`403`]. | **Blocked** — flagging so it is not re-checked; canonical modern DiD/event-study health paper |

### Development / growth / political economy

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Nunn, Puga 2012 ReStat (ruggedness) | https://diegopuga.org/data/rugged/ | Country-level terrain ruggedness index plus geography/colonial controls, dta/csv + Stata do-file, cross-section ~170 countries. [HTTP 200] | The standard geography IV in the institutions-vs-geography literature; tiny, clean |
| Nunn's data hub (slave trade, potatoes, and more) | https://scholar.harvard.edu/nunn/pages/data-0 (curl got `403`, likely UA/bot filtering — browser access works) and mirror https://nathannunn.arts.ubc.ca/data/ | Slave-exports-by-ethnicity/country data (AER 2011), Nunn-Qian 2011 QJE potato-suitability panel, and several others, all on one author page. [UBC mirror HTTP 200 — note: TODO.md's existing "refused connection" note for this UBC page is now stale, it is back up] | Would resolve two open TODO items (Nunn 2008, Nunn-Wantchekon 2011) and add Nunn-Qian 2011 in one visit |
| Michalopoulos, Papaioannou 2013 Econometrica (pre-colonial ethnic institutions) | https://www.econometricsociety.org/publications/econometrica/2013/01/01/pre%E2%80%90colonial-ethnic-institutions-and-contemporary-african/supp/9613_data_0.pdf (data description) — full data+programs zip is at the same `/supp/` path, old `econometricsociety.org/ecta/Supmat/...` URL is dead [HTTP 404] | Ethnic-homeland-level political centralization index (Murdock) matched to night-lights development proxy across Africa. [description PDF HTTP 200] | Foundational subnational-institutions paper; Econometric Society supplements are free to redistribute per journal policy |
| Alesina, Devleeschauwer, Easterly, Kurlat, Wacziarg 2003 JEG (fractionalization) | https://datafinder.qog.gu.se/dataset/al | Ethnic/linguistic/religious fractionalization indices, ~190 countries, cross-section. [HTTP 200, QoG mirror] | One of the most-used cross-country control variables in political economy; original author page appears gone, QoG is the standing mirror |
| Dell 2010 Econometrica (Peru's mining mita) | https://www.econometricsociety.org/publications/econometrica/2010/11/01/persistent-effects-perus-mining (data+programs zip linked from this page) | District-level panel around the historical mita boundary, Peru, colonial to modern day. [page HTTP 200] | Landmark regression-discontinuity-in-space paper; the Econometric Society supplement is a stable, licence-clear mirror |
| Voigtländer, Voth 2012 QJE (persecution perpetuated) | https://www.jvoth.com/datasets.html | Town-level medieval pogrom indicator matched to 1920s anti-Semitic violence, Nazi vote shares, deportations, 1349-1945+. [HTTP 200] | Best-known "historical persistence" paper; author page lists a dedicated datasets tab |
| Michalopoulos's own data page | https://sites.google.com/site/steliosecon/research | Alternate/updated mirror for the above plus other Michalopoulos ethnicity-and-development papers. [HTTP 200] | Backup source if the Econometric Society zip link changes again |
| Squicciarini, Voigtländer 2015 QJE (Encyclopédie / knowledge elites) | https://marasquicciarini.wixsite.com/home (check for a data/research tab) | City-level Encyclopédie subscriber density (proxy for Enlightenment "knowledge elites") matched to post-1750 French industrialization. [HTTP 200, but no data link confirmed yet — needs a manual look at the site's Research page] | Widely taught human-capital-vs-literacy identification strategy |
| Miguel, Satyanath, Sergenti 2004 JPE (rainfall and civil conflict) | https://emiguel.econ.berkeley.edu/research/economic-shocks-and-civil-conflict-an-instrumental-variables-approach/ | 41 African countries, rainfall-growth-conflict panel 1981-99, plus the Ciccone 2011 and Miguel-Satyanath-Sergenti 2011 replication rounds are on openICPSR (login-gated). [author page HTTP 200] | Foundational climate-conflict IV paper; heavily taught, heavily contested — good candidate with its own replication literature |
| Burke, Hsiang, Miguel 2015 Annual Review of Economics (climate and conflict) | https://web.stanford.edu/~mburke/climate/data.html | Meta-analysis data/code reproducing the climate-conflict response function and country-level projections. [HTTP 200] | Widely cited survey-with-data; useful complementary series to Miguel-Satyanath-Sergenti |
| Bloom, Van Reenen (World Management Survey) | https://worldmanagementsurvey.org/academic-research/manufacturing/published-papers/ | 2007-2014 anonymized firm management-practice scores, 30+ countries. Requires a free registration click-through, not a login wall. [HTTP 200] | Canonical management-as-a-driver-of-productivity dataset; note redistribution terms (attribution required, not CC0) |
| Alsan 2015 AER (tsetse fly) | https://www.openicpsr.org/openicpsr/project/112921/version/V1/view | Ethnic-homeland tsetse suitability matched to pre-colonial political/economic development. Landing page [HTTP 200] but download is login-gated [`403` on direct file paths]. | **Blocked** — flagging so it is not re-checked |

### Trade / IO / urban

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| CEPII Gravity Database (Head, Mayer, Ries; Conte, Cotterlaz, Mayer 2022 update) | https://www.cepii.fr/cepii/en/bdd_modele/bdd_modele_item.asp?id=8 (old `ANGLAISGRAPH/bdd/gravity.htm` and `id=8` legacy path both stale — this is the current item page) | Square panel of bilateral trade, distance, common-language/border/colony dummies for all country pairs, 1948-2021, csv/R/Stata. [HTTP 200] | The default bilateral-trade covariate set for any gravity-equation exercise; explicitly free for research use |
| Feenstra, Lipsey (Center for International Data, UC Davis) | https://cid.ucdavis.edu/wix | NBER-UN world trade flows 1962-2000+, SITC-coded, SAS/Stata format. [curl HEAD `403` — site appears to block scripted requests; loads fine in a browser per its own documentation] | Canonical bilateral-trade panel behind Feenstra's trade and productivity work; needs a manual re-check given the bot-blocking |
| Nevo 2000/2001 cereal demand data | Matlab archive mirrored at http://www.rasmusen.org/zg604/lectures/blp/frontpage.htm; also bundled in CRAN `BLPestimatoR` | Market-level cereal price/share/characteristics panel used to teach random-coefficients discrete-choice demand (BLP-style) estimation. [HTTP 200 (redirect), CRAN mirror confirmed separately] | The teaching dataset for structural IO demand estimation, alongside the BLP 1995 car data |
| Berry, Levinsohn, Pakes 1995 Econometrica (automobile demand) | https://cran.r-project.org/package=hdm (`BLP` dataset inside the `hdm` package) | Annual US car model data 1971-1990, 2217 model-years, prices/characteristics/shares. [HTTP 200] | Already effectively "bundled" via CRAN; worth a pointer entry so it isn't re-derived from scratch |
| Saiz 2010 (housing supply elasticity) | — see Applied-micro table above — | | duplicate cross-listing, not a second entry |
| Diamond 2016 AER (skill sorting and welfare) | https://www.openicpsr.org/openicpsr/project/112969/version/V1/view | Structural spatial-equilibrium estimates of amenity/wage/rent changes by skill, 1980-2000 US metros. Landing page [HTTP 200] but files are login-gated. | **Blocked** — flagging so it is not re-checked |
| Glaeser, Gyourko 2018 JEP (economic implications of housing supply) | https://www.openicpsr.org/openicpsr/project/116388/version/V1/view | Metro-level house-price-to-construction-cost gaps used to back out regulatory "taxes" on housing. Landing page [HTTP 200], files gated [`403`]. | **Blocked** — flagging so it is not re-checked; the standard JEP-level teaching summary of the housing-supply literature |
| Redding and coauthors, quantitative spatial economics toolkits (Ahlfeldt-Redding-Sturm-Wolf Berlin Wall; Heblich-Redding-Sturm London) | https://stephenredding.github.io/ | MATLAB/data toolkits and replication code for structural quantitative-spatial models (commuting, land use, historical transport shocks). [HTTP 200] | Bridges the trade and urban literatures; "Data and Code" tab links paper-by-paper replication packages, several of which are Nature/QJE-level and openly posted |

### Environment / energy / health economics

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Schlenker, Roberts 2009 PNAS (nonlinear temperature effects on yields) | https://wolfram-schlenker.info/research.html | County-level corn/soy/cotton yields matched to a fine degree-day temperature distribution, US 1950-2005. [HTTP 200] | The workhorse "degree-days" climate-agriculture design used across dozens of later papers |
| Deschênes, Greenstone 2007/2012 AER (climate change and agricultural profits, + corrected Reply) | Original data openICPSR-gated; corrected 2012 Reply sample/appendix at https://olivierdeschenes.weebly.com/uploads/1/3/5/0/135068654/the-economic-impacts-of-climate-change-supplementary-appendix.pdf [HTTP 200] | County agricultural-profit panel with weather draws, corrected per Fisher, Hanemann, Roberts, Schlenker (2012) critique. | Good teaching case for a public post-mortem/correction alongside the data; the corrected reply appendix is freely downloadable even though the raw ICPSR files are not |
| Bleakley 2007 QJE (hookworm) / Roodman 2018 replication | https://davidroodman.com/blog/2018/01/24/revised-hookworm-replication/ | Roodman's open Stata code+data replicating/repairing Bleakley's original hookworm-eradication analysis (original files "effectively lost" per Bleakley). [HTTP 200] | Only publicly available version of a canonical disease-and-development paper; good case study on data preservation |
| Nordhaus DICE model | https://economics.yale.edu/people/emeritus/william-nordhaus (redirects to the current Yale page; the old `williamnordhaus.com` domain no longer resolves — DNS failure) | DICE-2016R/2023 integrated assessment model code, parameters and social-cost-of-carbon output tables. [HTTP 200 via Yale after redirect chain] | The reference IAM behind most social-cost-of-carbon estimates; note the old personal domain is dead, use the Yale econ page or the Barrage-Nordhaus 2024 Yale working-paper mirror |
| Ito 2014 AER (marginal vs. average electricity pricing) | https://www.openicpsr.org/openicpsr/project/112736 (id truncated in original search; version path gated) | Household-panel electricity billing/usage data across a service-area price discontinuity. Landing page loads but file download is login-gated. | **Blocked** — flagging so it is not re-checked |
| Currie, Walker 2011 AEJ Applied (E-ZPass and infant health) | https://www.openicpsr.org/openicpsr/project/113779/version/V1/view | Birth-outcome micro data near highway toll plazas before/after electronic tolling. Landing page [HTTP 200], files [`403`, login required]. | **Blocked** — flagging so it is not re-checked |
| Greenstone, Hanna 2014 AER (India environmental regulation) | https://www.openicpsr.org/openicpsr/project/112693/version/V1/view (unofficial GitHub mirror also exists: github.com/zjalexzhou/replication-Greenstone-and-Hanna-2014, contents/licence unverified) | City-year Indian air/water regulation panel matched to pollution and infant mortality, 1986-2007. Landing page [HTTP 200], official files gated [`403`]. | **Blocked** (official source) — the GitHub mirror is unofficial and its licence/completeness would need manual verification before use |
| Almond, Chay, Lee 2005 QJE (costs of low birth weight, twins design) | underlying data is the public NCHS "Matched Multiple Birth Data Set" (e.g. https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm for natality files); no single author-hosted extract found | Twin-pair birth-weight/infant-outcome comparisons built from NCHS natality microdata, not a self-contained author download. | Would need reconstruction from NCHS public files rather than a one-shot download — lower priority than the other leads here, listed for completeness |
| Cutler, Miller 2005 Demography (water filtration and mortality) | no public author-hosted data page found | 13-city, 1900-1940 mortality panel matched to filtration/chlorination adoption dates; known post-publication transcription errors (20% of infant-mortality counts) corrected only in later unpublished reanalyses. | Historically important but the data trail is messy — flag as "not found" rather than blocked so nobody re-searches expecting a clean file |

### Blocked (scout) (checked, do not re-check)

| paper | why |
| --- | --- |
| Coibion, Gorodnichenko 2015 AER (survey expectations, project 112862) | openICPSR/AEA login required past the landing page (`403` on file paths) |
| Bertrand, Mullainathan 2004 AER resume audit (project 116023) | openICPSR/AEA login required |
| Alsan 2015 AER tsetse fly (project 112921) | openICPSR/AEA login required |
| Ito 2014 AER electricity pricing (project 112736) | openICPSR/AEA login required |
| Currie, Walker 2011 AEJ Applied E-ZPass (project 113779) | openICPSR/AEA login required |
| Greenstone, Hanna 2014 AER India pollution (project 112693) | openICPSR/AEA login required (official copy); unofficial GitHub mirror exists but unverified |
| Diamond 2016 AER skill sorting (project 112969) | openICPSR/AEA login required |
| Deschênes, Greenstone 2012 AER Reply, raw corrected microdata (project 116261) | openICPSR/AEA login required; the summary appendix PDF on the author's own site is open, but not the underlying county panel |
| Cochrane, Piazzesi 2005 AER, official AEA copy (project 116041) | openICPSR/AEA login required — use the author's own site instead, which hosts data/programs directly |
| Old `econometricsociety.org/ecta/Supmat/9613_data_and_programs.zip` URL for Michalopoulos-Papaioannou 2013 | dead link, `404`; current path is under `/publications/econometrica/2013/01/01/.../supp/` |
| `williamnordhaus.com` | domain no longer resolves (DNS failure); use `economics.yale.edu` instead |
| `fred.stlouisfed.org` (any page) | blocked automated HEAD/GET checks from this environment (`000`/timeout) every time; known-good source in practice, just couldn't be curl-verified here |
| `cid.ucdavis.edu` (Feenstra trade data) | `403` on scripted request; likely bot-blocking rather than genuinely down — needs a manual browser check before relying on it |
| Squicciarini, Voigtländer 2015 QJE data — direct file link | author's Wix site loads (`200`) but no data tab was found by an automated pass; needs a manual look |
