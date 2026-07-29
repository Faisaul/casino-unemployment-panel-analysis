*******************************************************
* EC499 Senior Seminar
* 02_prepare_lookup.do
* Prepare county lookup table
*******************************************************

* Load BLS geographic lookup
import delimited using "$raw/la.area.txt", clear

* Keep county observations only
keep if area_type_code == "F"

* Keep variables needed for merge
keep area_code area_text

rename area_text area_name

save "$intermediate/county_lookup.dta", replace
