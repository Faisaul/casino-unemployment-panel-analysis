*******************************************************
* EC499 Senior Seminar
* 04_prepare_casino.do
* Prepare casino opening data
*******************************************************

* Load casino opening data
import excel using "$raw/casino_data.xlsx", firstrow clear

* Remove blank rows
drop if missing(county)

* Standardize county names
replace county = proper(county)

gen area_name = county + " County, " + state

* Check data
describe
count

* Save intermediate dataset
save "$intermediate/casino_openings.dta", replace
