# Dataset backlog

Papers whose data are (or might be) freely downloadable. Status: **bundled**
(in `data/`), **todo** (fetchable, not yet processed), **blocked** (needs
login / licence forbids redistribution / dead link), **pointer** (too large or
updated too often to bundle; listed in `sources.csv` only). Update this file
whenever a dataset is added or a lead is checked. Last sweep: 2026-09-14 (batch 3).

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

## Todo (fetchable, not processed)

### Macro and monetary

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Mertens 2018 (TCJA) | karelmertens.com `tcja_webprograms.zip` | | programs only? check |
| Mertens, Ravn 2012 AEJ Policy | karelmertens.com `replication_files.zip`, `isom_wdata.xls`, `regqdata.xls` | anticipated tax shocks | check contents |
| Altavilla et al. 2019 JME (EA-MPD) | ecb.europa.eu/pub/pdf/annex/Dataset_EA-MPD.xlsx | ECB event-study surprises | official ECB file, updated; input to jk2020_ecb |
| Ramey, Francis 2009 AEJ Macro | `Century_Public_Data.xls` (downloaded, in $TMP) | hours of work/school/home/leisure 1900-2005 by age/sex | multi-header sheets; needs reshaping |
| Francis, Ramey 2009 JMCB | `Francis-Ramey_JMCB_Data_09.xls` | technology shocks, long-run restrictions | server returned 319-byte stub on 2026-09-14; retry |
| Ramey, Vine 2011 AEJ Macro | `AEJMacro-2010-0019-data.zip` | oil shocks and auto industry | |
| Nekarda, Ramey 2020 JMCB | `nekarda_ramey_markups.xlsx` | cyclical markups | 319-byte stub on 2026-09-14; retry |
| Ben Zeev, Pappa 2017 EJ | in `homgovdat.xlsx` (mfev col) | defense news | already inside r2016_govt |
| Stock, Watson 2016 Handbook (FHSW) | `FHSW_Replication_Files_*.zip` | dynamic factor models | check contents |
| Müller, Watson 2018 JBES | `LongRunUncertainty_*` | long-run covariability | check contents |
| Giannone, Lenza, Primiceri 2021 Econometrica | gep575 `CodesJAE.zip` `dataMLprojectMay2021.xlsx` | monthly FRED panel (17 series) | plain FRED downloads; low value, pointer |
| Primiceri 2005 ReStud / Del Negro-Primiceri 2015 | gep575 | inflation/unemployment/rate 1953- | not in the public zips checked; the data are 3 FRED series |
| Bauer, Swanson 2023 JoF | michaeldbauer.com -> Wiley supplement zip | orthogonalised MP surprises | Wiley may block scripted download |
| Swanson 2021 JME | sites.google.com/site/ericswanson/data | FFR/FG/LSAP factors | Google Sites; find direct link |
| Nakamura, Steinsson 2018 QJE | eminakamura.com `PolicyNewsShocksWeb.xlsx` (old eml.berkeley.edu page redirects) | policy news shock | Acosta-Brennan-Jacobson update linked from same page |
| Nakamura, Steinsson 2014 AER | eminakamura.com | state-level military spending | fiscal multipliers in a monetary union |
| Hazell, Herreño, Nakamura, Steinsson 2022 QJE | eminakamura.com `statecpi_beta.csv` | state-level CPI | regional Phillips curve |
| Nakamura, Steinsson, Barro, Ursúa 2013 AEJ Macro | eminakamura.com `DisastersDataAndPrograms.zip` | Barro-Ursúa C and GDP panel | same data as Barro-Ursúa below, one zip |
| Barro, Ursúa 2008 BPEA | rbarro.com/data-sets | long-run consumption and GDP, 42 countries | rare disasters; some series from early 1800s |
| Bouscasse, Nakamura, Steinsson (England 1250-1870) | eminakamura.com `bns_estimates.xlsx` | productivity growth estimates | very long run |
| Romer, Romer 2017 AER | eml.berkeley.edu/~dromer | semiannual financial distress, 24 OECD 1967-2017 | narrative crisis measure; extension xlsx on site |
| Reinhart, Rogoff 2009 book / 2010 AER P&P | rogoff.scholars.harvard.edu "This Time Is Different—Data" | crisis dates, debt/GDP, growth | pair with Herndon-Ash-Pollin 2014 replication (peri.umass.edu) |
| Laeven, Valencia 2020 IMF ER (2026 update) | imf.org WP 2026/094 xlsx | banking crisis dates, fiscal cost, output loss 1970-2025 | |
| Känzig 2021 AER | github.com/dkaenzig/oilsupplynews | monthly oil supply news shocks | vintages kept in repo; MIT-friendly |
| Cloyne 2013 AER | aeaweb.org (pre-2019 dataset link) | UK narrative tax changes | UK counterpart of Romer-Romer 2010 |
| Holston, Laubach, Williams 2017 / LW 2003 | newyorkfed.org/research/policy/rstar | r* estimates, quarterly, US/EA/CA/UK | updated quarterly; real-time vintages too |
| Shimer 2012 RED | home.uchicago.edu/shimer/data/flows | job finding / separation rates 1948- | attribution only; text files |
| Welch, Goyal 2008 RFS (GWZ 2024 update) | sites.google.com/view/agoyal145 | equity premium predictors 1871-, m/q/a | Google Drive xlsx; annual update |
| He, Kelly, Manela 2017 JFE | zhiguohe.net/data-and-empirical-patterns | intermediary capital ratio and risk factor, quarterly 1970- | |
| Baker, Wurgler 2006 JoF | pages.stern.nyu.edu/~jwurgler | investor sentiment index | verify current file; Mendeley mirror stops 2014 |
| Miranda-Agrippino, Ricco 2021 AEJ Macro | silviamirandaagrippino.com/code-data | informationally robust shocks | |
| Kilian, Zhou 2018 | dallasfed.org/research/igrea | | index already bundled as k2009 |
| Baumeister, Hamilton 2019 AER | sites.google.com/site/cjsbaumeister | oil SVAR data | Google Sites |
| Romer, Romer 2004 AER | aeaweb.org (pre-2019 "data set" link) | original RR shocks | RR series already in r2016_monetary (Wieland update) |
| Romer, Romer 2010 AER | aeaweb.org | narrative tax changes | narrative already in r2016_tax |
| Auerbach, Gorodnichenko 2012 AEJ Policy | aeaweb.org | STVAR multipliers | |
| Coibion 2012 AEJ Macro | in `Monetarydat.xlsx` sheet Coibion_update | | already inside r2016 raw file |
| Lettau, Ludvigson (cay) | sydneyludvigson.com | consumption-wealth ratio | quarterly |
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
| Card, Krueger 1994 AER | davidcard.berkeley.edu/data_sets `njmin.zip` | 410 NJ/PA fast-food stores, 2 waves | canonical DiD; tiny |
| Card 1995 (college proximity) | davidcard.berkeley.edu `proximity.zip` | NLS young men | also `wooldridge::card`; pointer unless raw adds columns |
| Angrist 1990 AER | economics.mit.edu Angrist archive `cwhsa.dta`, `cwhsb.dta` | Vietnam draft lottery, SSA earnings | canonical IV |
| Angrist, Evans 1998 AER | Angrist archive `AngEv98.zip` | same-sex instrument, census extracts | check size |
| Angrist, Krueger 1991 QJE | Angrist archive `asciiqob.zip` | quarter of birth, 329k obs | probably too big to bundle; pointer |
| Abadie, Angrist, Imbens 2002 Econometrica | Angrist archive `jtpa.raw` | JTPA training RCT | quantile treatment effects |
| Autor, Dorn, Hanson 2013 AER | ddorn.net/data `Autor-Dorn-Hanson-ChinaSyndrome-FileArchive.zip` | commuting-zone panel 1990-2007 | China shock; check terms on data page |
| Acemoglu, Restrepo 2020 JPE | economics.mit.edu `replication_kit_AR2019.zip` | robots per CZ | |
| Acemoglu, Autor 2011 Handbook | Acemoglu archive "Skills, Tasks and Technologies" | CPS/Census wage series | derived series only, not micro |
| LaLonde 1986 / Dehejia, Wahba 1999 | `MatchIt::lalonde`, `causaldata` | NSW | already on CRAN; pointer |

### Health

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Chetty et al. 2016 JAMA | healthinequality.org/data | life expectancy by income percentile, sex, state/CZ/county 2001-14 | public tables |
| Acemoglu, Johnson 2007 JPE | economics.mit.edu `Disease and development data and programs.zip` | life expectancy, predicted mortality, GDP 1940-80 | includes 2014 reply data |
| Goodman-Bacon 2018 JPE | journal supplement / author site | state-year infant and child mortality 1950-79, Medicaid eligibility | check whether the panel is posted; JOLE 2021 follow-up is openICPSR |
| Miguel, Kremer 2004 Econometrica | Harvard Dataverse (Miguel's site links the DOI) | deworming RCT | Dataverse = CC0; verify DOI |
| Hall, Jones 2007 QJE | web.stanford.edu/~chadj `hxprograms500.zip` | health spending and value of life | check contents |

### Education

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Angrist, Lavy 1999 QJE | Angrist archive `final4.dta`, `final5.dta` | Israel class size, Maimonides RD | also `rbounds::angristlavy` on CRAN |
| Angrist, Lavy 2009 AER | Angrist archive `AngristLavy_AERdata.zip` | achievement awards RCT | |
| Angrist, Lang, Oreopoulos 2009 AEJ Applied | Angrist archive `STARdatapost.zip` | Canadian STAR incentives RCT | |
| Angrist et al. 2002 AER (Colombia vouchers) | Angrist archive `aerdat4.sas7bdat` | PACES lottery | SAS format; `haven` reads it |
| Angrist, Bettinger, Kremer 2006 AER | Angrist archive `angbetkre06data.zip` | voucher long-run follow-up | |
| Acemoglu, Angrist 2000 NBER MA | Angrist archive `CompSchoolLaws.rar` | compulsory schooling laws by state-year | rar |
| Duflo 2001 AER | github.com/droodman/Duflo-2001 | INPRES school construction | SUPAS micro file not in repo; check |
| Krueger 1999 QJE | `AER::STAR` | Tennessee STAR | already on CRAN; pointer |

### Development and growth

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Acemoglu, Johnson, Robinson 2001 AER | Acemoglu archive (table data) | settler mortality, 64 countries | also `hdm::AJR`, QoG `ajr` |
| Acemoglu, Johnson, Robinson 2002 QJE | Acemoglu archive | reversal of fortune | |
| Acemoglu, Johnson, Robinson, Yared 2008 AER | Acemoglu archive `Income and Democracy Data AER adjustment.zip` | income and democracy panel | |
| Acemoglu, Naidu, Restrepo, Robinson 2019 JPE | Acemoglu archive `replication_files_ddcg.rar` | democracy-growth panel | rar |
| Hall, Jones 1999 QJE | web.stanford.edu/~chadj `HallJones400.asc` | 127 countries, social infrastructure | plain ascii; tiny |
| Jones 2002 AER | chadj `Sources50.asc` | sources of US growth | |
| Nunn 2008 QJE | nathannunn.arts.ubc.ca/data | slave exports by country | site refused connection 2026-09-14; QoG mirror `slavet` |
| Nunn, Wantchekon 2011 AER | nathannunn.arts.ubc.ca/data | slave trade and trust (Afrobarometer) | retry with above |
| Mankiw, Romer, Weil 1992 QJE | reconstruct from PWT 5.6 / Bernanke-Gürkaynak 2001 | Solow regressions | no author file; low priority |

### Inequality

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Piketty, Saez 2003 QJE (updated) | eml.berkeley.edu/~saez `TabFig2018.xls` (look for newer vintage) | top income shares 1913- | |
| Piketty, Saez, Zucman 2018 QJE | gabriel-zucman.eu/usdina | distributional national accounts | |
| Saez, Zucman 2016 QJE | gabriel-zucman.eu/uswealth | wealth shares | |
| Chetty, Hendren, Kline, Saez 2014 QJE | opportunityinsights.org/data | county / CZ mobility statistics | |
| Chetty et al. 2017 Science | opportunityinsights.org/data | absolute mobility by birth cohort | tiny |

## Blocked

| paper | why |
| --- | --- |
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
