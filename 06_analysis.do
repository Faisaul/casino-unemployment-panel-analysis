****************************************************
* 06_analysis.do
* Estimate the Effect of Casino Openings on County Unemployment
****************************************************

clear all
set more off

* Start log
capture log close
log using "Output/analysis.log", replace text

* Set working directory
cd "C:\Users\mullafai\OneDrive - Michigan State University\Desktop\casino_prjct"

* Load final analysis dataset
use "Data/final_analysis_dataset.dta", clear

* Declare panel structure
xtset panel_id year

* Run Two-Way Fixed Effects model
xtreg unemployment casino i.year, fe vce(cluster panel_id)

* Store estimates
estimates store twfe

* Export regression table
esttab twfe using "Output/TWFE_Results.rtf", ///
    replace ///
    se ///
    star(* 0.10 ** 0.05 *** 0.01) ///
    title("Effect of Casino Openings on County Unemployment")

display "Analysis complete."

* Close log
log close
