# Dataset backlog

Papers whose data are (or might be) freely downloadable. Status: **bundled**
(in `data/`), **todo** (fetchable, not yet processed), **blocked** (needs
login / licence forbids redistribution / dead link), **pointer** (too large or
updated too often to bundle; listed in `sources.csv` only). Update this file
whenever a dataset is added or a lead is checked. Last sweep: 2026-09-14.

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

## Todo (fetchable, not processed)

| paper | url | what | why interesting |
| --- | --- | --- | --- |
| Jarociński, Karadi 2020 (ECB shocks) | marekjarocinski.github.io/jkshocks `ECB_shocks_until_2023Jun.zip` | euro-area MP/CBI shocks | companion to jk2020 |
| Mertens, Ravn 2014 JME | karelmertens.com `jme2014_data.xls` | tax revenues, spending, output, narrative | reconciles SVAR and narrative multipliers |
| Mertens, Montiel Olea 2018 QJE | karelmertens.com `data_mmo.xlsx` | marginal tax rates and income | |
| Mertens 2018 (TCJA) | karelmertens.com `tcja_webprograms.zip` | | |
| Ramey, Francis 2009 AEJ Macro | `Century_Public_Data.xls` | hours of work/school/home/leisure 1900-2005 | long-run labour supply |
| Francis, Ramey 2009 JMCB | `Francis-Ramey_JMCB_Data_09.xls` | technology shocks, long-run restrictions | |
| Ramey, Vine 2011 AEJ Macro | `AEJMacro-2010-0019-data.zip` | oil shocks and auto industry | |
| Nekarda, Ramey 2020 JMCB | `nekarda_ramey_markups.xlsx` | cyclical markups | |
| Ben Zeev, Pappa 2017 EJ | in `homgovdat.xlsx` (mfev col) | defense news | already inside r2016_govt |
| Blinder, Watson 2016 AER | princeton.edu/~mwatson/ddisk `Blinder_Watson_ReplicationFiles_July2014.zip` | presidents and the economy | |
| Stock, Watson 2016 Handbook (FHSW) | `FHSW_Replication_Files_*.zip` | dynamic factor models | check contents |
| Müller, Watson 2018 JBES | `LongRunUncertainty_*` | long-run covariability | check contents |
| Giannone, Lenza, Primiceri 2015 ReStat | faculty.wcas.northwestern.edu/gep575 `GLPreplicationWeb.zip` | BVAR prior data | check if data included |
| Del Negro, Primiceri 2015 ReStud (TVP-VAR corrigendum) | gep575 `CodesJAE.zip`? | inflation/unemployment/rate 1953- | classic TVP-VAR dataset; verify file |
| Bauer, Swanson 2023 JoF | michaeldbauer.com -> Wiley supplement zip | orthogonalised MP surprises | Wiley may block scripted download |
| Swanson 2021 JME | sites.google.com/site/ericswanson/data | FFR/FG/LSAP factors | Google Sites; find direct link |
| Nakamura, Steinsson 2018 QJE | eml.berkeley.edu/~enakamura | policy news shock | link timed out; retry |
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
| Gürkaynak, Sack, Swanson 2005 IJCB (GKL 2021 update) | bilkent.edu.tr/~refet `GKL_replication.zip` | FOMC surprises daily | input to jk2020 |

## Blocked

| paper | why |
| --- | --- |
| Kilian 2009 AER VAR data | AEA data zip requires login (404 on public URL) |
| Jordà-Schularick-Taylor Macrohistory | CC BY-NC-SA, incompatible with MIT redistribution; pointer only |
| FRED-MD / FRED-QD | large, monthly vintages; pointer only |
| Penn World Table, Maddison, Barro-Lee | already on CRAN (`pwt10`, `maddison`); pointer only |
