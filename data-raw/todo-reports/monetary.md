# Batch: monetary

## Bundled

| key | paper | source URL | file used | notes |
| --- | --- | --- | --- | --- |
| ns2018, ns2018_1995 | Nakamura, Steinsson (2018) QJE | https://eminakamura.com/papers/PolicyNewsShocksWeb.xlsx | `PolicyNewsShocksWeb.xlsx` (sheets `PolicyNewsShocks`, `PolicyNewsShocks1995`) | Policy news shock, baseline (2000-2014) and extended (1995-2014) samples. |
| s2021 | Swanson (2021) JME | https://sites.socsci.uci.edu/~swanson2/papers/pre-and-post-ZLB-factors-extended.xlsx | `pre-and-post-ZLB-factors-extended.xlsx` (sheet `Data`) | The classic `sites.google.com/site/ericswanson/data` page now redirects to a Google sign-in wall; found the current file on Swanson's UC Irvine page instead. Date column mixes Excel serials and `m/d/yyyy` text mid-sheet; handled in `parse_mixed_mdy()`. Dropped the file's extra "– LSAP factor" column (verified it is exactly `-1 * lsap_factor`, kept for charting only in the source). |
| bs2023, bs2023_fomc | Bauer, Swanson (2023) NBER Macroeconomics Annual | https://www.frbsf.org/research-and-insights/data-and-indicators/monetary-policy-surprises/ | `monetary-policy-surprises-data.xlsx` (sheets `Monthly (update 2023)`, `FOMC (update 2023)`) | Brief listed this as "JoF"; the actual venue is NBER Macroeconomics Annual 37 (2023), pp. 87-155 (doi 10.1086/723574) — bib entry corrected accordingly. Author's michaeldbauer.com page links straight to the FRBSF-hosted spreadsheet, no Wiley paywall involved. |
| mar2021 | Miranda-Agrippino, Ricco (2021) AEJ Macro | http://silviamirandaagrippino.com/code-data | `Instruments_web.xlsx` (sheet `Daily`) | The code-data page lists the OpenICPSR replication package (login-gated) plus a separate small instrument spreadsheet linked as "Instrument for conventional Fed monetary policy shocks as in Miranda-Agrippino and Ricco (2021)" at `/s/Instruments_web-x8wr.xlsx`; used that one. |
| eampd, eampd_pr, eampd_pc | Altavilla, Brugnolini, Gurkaynak, Motto, Ragusa (2019) JME (EA-MPD) | https://www.ecb.europa.eu/pub/pdf/annex/Dataset_EA-MPD.xlsx | `Dataset_EA-MPD.xlsx` (sheets `Monetary Event Window`, `Press Release Window`, `Press Conference Window`) | File has no daily-frequency sheet to drop (only the 3 event-level sheets + a Notes sheet), all three kept as separate objects, 315 rows x 46 cols each. Date column mixes Excel serials and `dd/mm/yyyy` text; handled in `parse_mixed_dmy()`. Input to the already-bundled `jk2020_ecb`. |
| hlw2017 | Holston, Laubach, Williams (2017) JIE | https://www.newyorkfed.org/research/policy/rstar | `Holston_Laubach_Williams_current_estimates.xlsx` (sheet `HLW Estimates`) | US, Canada and Euro area all in one sheet (Euro area NA before 1972Q1 sample start). Did not bundle the `US/CA/EA input data` or `Parameters` sheets (inputs and point estimates, not the main series). |
| k2021 | Kanzig (2021) AER | https://github.com/dkaenzig/oilsupplynews | `oilSupplyNewsShocks_2025M12.xlsx` (sheet `Monthly`) | Latest vintage in the repo (updated ~twice a year). CC BY 4.0, attribution required — noted in catalog. Did not bundle the daily sheets or `VARdata.xlsx` (the underlying VAR series, all standard FRED/oil-price data). |
| bh2019 | Baumeister, Hamilton (2019) AER | https://sites.google.com/site/cjsbaumeister/datasets | `oil_supply_shocks.xlsx`, `oil_demand_shocks.xlsx` (Google Drive-hosted, merged into one object) | Google Sites "datasets" subpage rendered fine (unlike Swanson's, which redirected to a login wall). Also on the same page: a world industrial production index, real-time WIP vintages, a GECON indicator and a commodity-price factor — left as leads below since they're outside this batch's monetary/oil scope but easy pickups for a future batch. |
| ll2001 | Lettau, Ludvigson (2001) JoF (cay) | https://sites.google.com/view/martinlettau/data | `cay_current.txt` | `sydneyludvigson.com/data-and-appendixes` no longer lists the cay series (appendix PDFs only); found the current cay file on Martin Lettau's own Google Sites data page instead ("Current cay data" link). Series stops at 2019Q3 despite being labelled "current" — likely not maintained past that point; noted in catalog notes. |

## Blocked

| paper | URL tried | why |
| --- | --- | --- |
| Acosta, Brennan, Jacobson (2024) SOFR-futures update of Nakamura-Steinsson / GSS | https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/WUXWHS | Licensed CC BY-NC 4.0 (checked via the Dataverse API) — non-commercial, excluded per the redistribution rule. |
| Romer, Romer (2004) AER original shocks | https://www.aeaweb.org/articles?id=10.1257/0002828042002651 (AEA "Additional Materials" -> `doi.org/10.3886/E116025V1`) | Replication package is hosted on openICPSR (AEA-login-gated), no public author copy found. The series is already in the bundled `r2016_monetary` (Wieland-updated version), so low priority to chase further. |
| Christiano, Eichenbaum, Evans (2005) JPE monetary VAR | https://faculty.wcas.northwestern.edu/~lchrist/research.htm | Page returns HTTP 404; the site appears to have been reorganized/taken down. No replication data found via search either. |
| Bloom (2009) Econometrica uncertainty VAR | https://nbloom.people.stanford.edu/research -> Dropbox `quarterly_2007a.zip` | The only "quarterly data" file linked is a 29 MB zip containing a single 145 MB `quarterly_2007a.csv` — Compustat-linked firm-level microdata, not the small aggregate VAR series (stock-market volatility etc.) used in the published VAR. Too large and likely license-encumbered (Compustat); not bundled. The small VAR series itself doesn't appear to be posted separately. |

## New leads noticed on the way

| paper | URL | what |
| --- | --- | --- |
| Baumeister world industrial production / GECON / commodity-price factor | https://sites.google.com/site/cjsbaumeister/datasets | Monthly World Industrial Production index (1958-), real-time WIP vintages, a Global Economic Conditions (GECON) indicator, and a real commodity price factor — all maintained/updated by Baumeister, all on the same page as bh2019. Business-cycle / commodity-price category, not monetary. |
| Miranda-Agrippino (2016/2017) "Unsurprising Shocks" surprises | silviamirandaagrippino.com/code-data, `/s/MirandaAgrippino2017_UnsurprisingShocks_OrthogonalSurprises-x3ne.xlsx` | Earlier vintage of Fed/BOE conventional-shock orthogonalized surprises, same author page as mar2021. |
| Miranda-Agrippino, Nenova (2022) "A Tale of Two Global Monetary Policies" | silviamirandaagrippino.com/code-data, `ISOM_DailyIV_Public.xlsx` | Instruments for unconventional Fed and ECB shocks; global monetary spillovers angle. |
| Romer, Romer (2024) narrative Fed shocks, monthly/quarterly extension | silviamirandaagrippino.com/code-data, `/s/Narrative-MP.zip` | Posted as a "Narrative" instrument on the same Miranda-Agrippino page; worth checking directly against the AEA page for Romer-Romer's own copy. |
| Giuseppe Ragusa monetary policy factors | https://gragusa.org/factors/ | Turned up while chasing the EA-MPD citation trail; may have an independently maintained factor series worth a look. |

## Notes for the integrator

- `bs2023` bib entry: corrected the venue from the brief's "JoF" to the actual NBER Macroeconomics Annual (vol. 37, 2023); DOI 10.1086/723574.
- `hlw2017` country field is the free-text `"US, Canada, Euro area"` since the dataset genuinely spans three economies in one object; flag if the catalog schema expects a single country per row.
- All raw files are well under the 8 MB cap (largest is `eampd`'s `Dataset_EA-MPD.xlsx` at 372 KB); no reshaping needed beyond the mixed-date-format parsing noted above.
- No licence blockers among the bundled datasets except the already-excluded Acosta-Brennan-Jacobson update; Kanzig's oil data is CC BY 4.0 (attribution recorded in catalog notes).
