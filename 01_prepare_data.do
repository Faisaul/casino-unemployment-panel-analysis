*******************************************************
* EC499 Senior Seminar
* 01_prepare_data.do
* Prepare annual county unemployment data
*******************************************************

*------------------------------------------------------*
* Load raw LAUS county data
*------------------------------------------------------*

import delimited using "$raw/county_data.txt", clear

* Keep unemployment rate (measure 003)
gen measure = substr(series_id,18,3)
keep if measure == "003"

* Keep annual averages
keep if period == "M13"

* Match the study period
keep if year <= 2024

* Convert unemployment to numeric
rename value unemployment

* Remove leading/trailing spaces
replace unemployment = trim(unemployment)

* Treat "-" as missing
replace unemployment = "" if unemployment == "-"

* Convert to numeric
destring unemployment, replace

* Create county area code
gen area_code = substr(series_id,4,15)

* Save intermediate dataset
save "$intermediate/unemployment_panel.dta", replace
