****************************************************
* 05_build_analysis.do
* Build Final Analysis Dataset
****************************************************

clear all
set more off

* Load unemployment data
use "$intermediate/unemployment_counties.dta", clear

* Merge casino data
merge m:1 area_name using "$intermediate/casino_openings.dta"

drop _merge

* Replace missing treatment values
replace treated = 0 if missing(treated)

* Create casino treatment variable
gen casino = 0
replace casino = 1 if treated == 1 & year >= opening_year

* Create numeric panel ID
encode area_code, gen(panel_id)

sort panel_id year

save "Data/final_analysis_dataset.dta", replace

display "Final analysis dataset created."
