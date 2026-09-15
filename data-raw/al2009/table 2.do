clear
set mem 10m
set more off
*set trace on
set logtype text
local today="$S_DATE"
local day=word("`today'",1)
local month=word("`today'",2)
local year=substr(word("`today'",3),3,2)
if `day'<10 local day="0`day'" 
global date="`year'`month'`day'"
global progname="table2"
di "${date}"
di "${progname}"

* EDIT THIS CD STATEMENT IN ORDER TO LOCATE THE LOGS IN YOUR LOCAL DIRECTORY
cd "W:\Student bonuses\Yannay Aug 08\logs"

cap log close
log using "${progname}.log", replace

* EDIT THIS CD STATEMENT IN ORDER TO LOCATE THE DATA IN YOUR LOCAL DIRECTORY
cd "W:\Student bonuses\Yannay Aug 08\data"

/********************************************************************
	table 2 - levels estimates.do

	Data:   base99/00/01/02 

	This program creates table 2 - Treatment Effect for 2000, 2001 and 2002
    * This is a first Stata replication of the SAS programs.

**********************************************************************/

*** Looping over cohorts

foreach y in 00 01 02/* 99*/ {

  use "base`y'.dta" , clear
  cap rename semelmos school_id
  
  *sample 20
  
  tab educav, m
  
  *** adding pairs to base02
  if `y'==2 {
  
  }

  foreach gend of numlist 0 1 2 /* 2 is for boys+girls */ {

    preserve
 *  sample 20
    drop if (1-boy)==`gend'
    
    gen ls25=0	
    gen ls50=0
    gen ls75=0
    gen ls100=0

    *** quartiling algorithm that conforms with the SAS algorithm
    sum lagscore, detail
    replace ls25 =1 if lagscore<r(p25)
    replace ls50 =1 if ls25==0 & lagscore<r(p50)
    replace ls75 =1 if ls50+ls25==0 & lagscore<r(p75)
    replace ls100=1 if ls50+ls25+ls75==0

    gen ah4=m_ahim>=4
    xi i.pair
    *** dropping irrelevant dummies (so that brl won't fail with the school f.e.???)
    foreach var of varlist _Ip* {
      sum `var'
      if r(mean)==0 drop `var'
      }

    *** Taking mean of dep.var, N.obs and N.schools

    sum zakaibag
    local y`y'_gend`gend'_mean=r(mean)
    local y`y'_gend`gend'_n   =r(N)

    egen school_id2 = group(school_id)
    sum school_id2 
    local y`y'_gend`gend'_ns= r(max)
    drop school_id2

 *****************   REGRESSIONS  **********************************

   foreach ctrl in sc scqm {
    foreach p_ctrl in np wp {

    if "`ctrl'"=="sc" local control="semarab semrel"
      else local control="semarab semrel ls50 ls75 ls100 educav educem ah4 ole5"
    if "`p_ctrl'"=="np" local p_control=""
      else local p_control="_Ip*"
    di "control is `control' `p_control'"

    *** OLS REGRESSION
    ereturn clear
    if `gend'==2 | "`p_ctrl'"=="np" {
    brl zakaibag treated `control' `p_control',cluster(school_id)
    
        }
        local y`y'_gend`gend'_ols_`ctrl'_`p_ctrl'_est=.
        local y`y'_gend`gend'_ols_`ctrl'_`p_ctrl'_se =.
        cap local y`y'_gend`gend'_ols_`ctrl'_`p_ctrl'_est= _b[treated]
        cap local y`y'_gend`gend'_ols_`ctrl'_`p_ctrl'_se =_se[treated]

    *** LOGIT REGRESSION
      /* over the treated group, but predicted value as if treated=0
         when calculating the marginal effects   */
    ereturn clear
    cap mat drop b se
    if `gend'==2 | "`p_ctrl'"=="np" {
        brl zakaibag treated `control' `p_control',logit cluster(school_id)
        
        local est=_b[treated]
        local se=_se[treated]
        predict pxb,xb
              /*Currently, there's an error with the predict post-est:,
              the xb option is always on - instead of giving the pred. value
              it always gives the xb predicted value */
        replace pxb=pxb-`est' if treated==1
        gen p=(exp(pxb))/(1+exp(pxb))
        gen h0=p*(1-p)
        sum h0 if treated
        local h0=r(mean)
        drop h0 p pxb
        }
        local y`y'_gend`gend'_log_`ctrl'_`p_ctrl'_est=.
        local y`y'_gend`gend'_log_`ctrl'_`p_ctrl'_se =.
        cap local y`y'_gend`gend'_log_`ctrl'_`p_ctrl'_est=`h0'*`est'
        cap local y`y'_gend`gend'_log_`ctrl'_`p_ctrl'_se =`h0'*`se'
        macro drop _h0 _est _se

    }
    }

  restore
  } /* close gender loop*/

macro list
} /* close years loop*/


/**********************************************************************
   CREATING THE TREATMENT EFFECT TABLE
**********************************************************************/

	postfile levels_est str14(year ctrl pair) ///
        bg_ols bg_log space1 b_ols b_log space2 g_ols g_log ///
	  using t2_levels_estimates_NDM, replace

	foreach y in 01 00 02 /*99*/ {
	  post levels_est	("`y'") ("Dep Mean") ("") ///
				(`y`y'_gend2_mean') (`y`y'_gend2_mean') (.) ///
				(`y`y'_gend1_mean') (`y`y'_gend1_mean') (.) ///
				(`y`y'_gend0_mean') (`y`y'_gend0_mean')
	
	  foreach ctrl in sc scqm {
          foreach p_ctrl in np wp {
            foreach stat in est se {
              post levels_est ///
                  ("`y'") ("`ctrl'") ("`p_ctrl'") ///
		      (`y`y'_gend2_ols_`ctrl'_`p_ctrl'_`stat'') ///
                  (`y`y'_gend2_log_`ctrl'_`p_ctrl'_`stat'') (.) ///
		      (`y`y'_gend1_ols_`ctrl'_`p_ctrl'_`stat'') ///
                  (`y`y'_gend1_log_`ctrl'_`p_ctrl'_`stat'') (.) ///
		      (`y`y'_gend0_ols_`ctrl'_`p_ctrl'_`stat'') ///
                  (`y`y'_gend0_log_`ctrl'_`p_ctrl'_`stat'')
              }
            }
          }

	  post levels_est	("`y'") ("Observations") ("") ///
				(`y`y'_gend2_n') (`y`y'_gend2_n') (.) ///
				(`y`y'_gend1_n') (`y`y'_gend1_n') (.) ///
				(`y`y'_gend0_n') (`y`y'_gend0_n')

	  post levels_est	("`y'") ("Schools") ("") ///
				(`y`y'_gend2_ns') (`y`y'_gend2_ns') (.) ///
				(`y`y'_gend1_ns') (`y`y'_gend1_ns') (.) ///
				(`y`y'_gend0_ns') (`y`y'_gend0_ns')

	  post levels_est	("") ("") ("") ///
				(.) (.) (.) (.) (.) (.) (.) (.)
        }

postclose levels_est

use t2_levels_estimates_NDM, clear
browse

clear
cap erase t2_levels_estimates_NDM.dta

cap log close


