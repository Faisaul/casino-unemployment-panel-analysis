****************************************************
* master.do
* EC499 Senior Seminar
* Faisal Mulla
****************************************************

clear all
set more off
version 14.1

cd "C:\Users\mullafai\OneDrive - Michigan State University\Desktop\casino_prjct"

global data "Data"
global raw "$data/Raw"
global intermediate "$data/Intermediate"
global final "$data/Final"
global output "Output"

do "Code/01_prepare_data.do"
do "Code/02_prepare_lookup.do"
do "Code/03_merge_data.do"
do "Code/04_prepare_casino.do"
do "Code/05_build_analysis.do"
do "Code/06_analysis.do"

display "Project completed successfully."
