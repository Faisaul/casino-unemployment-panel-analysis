*******************************************************
* EC499 Senior Seminar
* 03_merge_data.do
* Merge unemployment data with county lookup
*******************************************************

* Load unemployment panel
use "$intermediate/unemployment_panel.dta", clear

* Merge county names
merge m:1 area_code using "$intermediate/county_lookup.dta"

tab _merge

assert _merge == 3

drop _merge

save "$intermediate/unemployment_counties.dta", replace
