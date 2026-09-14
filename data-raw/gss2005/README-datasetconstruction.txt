*** The construction of the data set ***

This readme file explains how our data set is put together. 

1. The construction of our data set requires access to

	a. CRSP database

	b. Compustat database

	c. Capital IQ (CIQ) database

which are proprietary hence cannot be included in this replication package. We downloaded these through Wharton Research Data Services (WRDS). 

2. The raw data and the code required for constructing our monetary policy surprise measures (GSS) are included in this replication package (more on this below). 

3. The replication package also includes our interest rate risk hedging indicator whose construction is explained in detail in "README-hedgedata.txt."

4. Silvia Miranda-Agrippino and Giovanni Ricco provided us with Greenbook data used in Section 6 of the paper. Please refer to <https://www.aeaweb.org/articles?id=10.1257/mac.20180124&&from=f> for information regarding this data set. 

5. The Fama-French factors were downloaded from Kenneth French's website: <https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/f-f_factors.html>.

The online Appendix A provides detailed information about the construction of variables used in the paper. 

%%%%%

We use several Stata do files sequentially to construct our data sets. In what follows, we briefly explain what these do. The files should be run in the order they appear below.

(1). do0spdates - This file selects S&P500 firms we work with in the paper. This also imports CPI data (downloaded from FRED) and aggregate SP500 index data.

(2). do0stockdata - This file imports and merges CRSP-Compustat data which contain firm-level stock prices. 

(3). do0balancesheetdata - This file prepares Compustat data which provide firm-level balance sheet data. 

(4). do0famafrench - This file calculates factor loadings using the Fama-French factors, to be used for calculating abnormal stock returns later. 

(5). do1policysurprises - This file produces monetary policy target and path surprises as in Gurkaynak et al. (2005). The raw data are provided by "GSSrawdata.xlsx" and the results are stored in "GSSfactors.xlsx."

(6). do1policysurprises_longer - This file does the same as (5) but using interest rate futures contracts up to two years in maturity (ED8). 

(7). do1policysurprises_infoeffect - This file conditions monetary policy surprises from (5) on changes in Greenbook forecasts (using the data from Miranda-Agrippino and Ricco, 2021) and obtains residuals to control for possible central bank information effects. This also produces Table 7 in the paper.

(8). do2ciq - This file reads CIQ data, constructs our exposure measure, and merges it with our interest rate risk hedging data in "hedgedata.xls."

(9). do3compustat - This file merges Compustat data with CIQ data and our hedging data. 

(10). do4stockreturn - This file merges stock return from CRSP-Compustat data with what is produced by (9).

(11). do5stockregressionsdata - This file finalizes the data set for all stock return regressions in the paper.

(12). do6quarterlyfirmdata - This file prepares quarterly firm-level data for balance sheet regressions.

(13). do7sumtargetpath - This file aggregates monetary policy surprises within the same quarter, to be used for quarterly balance sheet regressions. 

(14). d08balancesheetregressionsdata - This file finalizes the data set for all balance sheet regressions in the paper.
