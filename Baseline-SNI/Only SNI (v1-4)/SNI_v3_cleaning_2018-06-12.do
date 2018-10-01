version 15

clear

//import raw, formattted csv file for all who took Baseline Version 4
import delimited "E:\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\SNI\Version 3.0 (Jan 2018)\LogMyLife SNI Questionnaire_ver3 (Jan2018)_February 28 2018_16.47_formatted", delimiter(comma) varnames(1) case(upper)

//reorder variables how I like them...
order SNI_PID, first
order RESPONSEID, after(SNI_PID)
sort SNI_PID

//add survey version variable for all obs=2
gen SNIVERSION=3
order SNIVERSION, after(RESPONSEID)

//delete, due to test survey
drop if RESPONSEID == "R_1rBylBL2D0Tck8L" 
drop if RESPONSEID == "R_2CwgiaGXIhRR3g9"
drop if RESPONSEID == "R_XH5rOqpEI6hoCdj"
drop if RESPONSEID == "R_30bJEBI1ibsDp0D"

//delete, duplicate 1059
drop if RESPONSEID == "R_3qaF6Nse4uVMoE8"

//rename SNI alters to append
rename SNI_REL_X29 SNI_REL_H29
rename SNI_REL_X30 SNI_REL_H30
rename SNI_REL_X31 SNI_REL_H31
rename SNI_REL_X32 SNI_REL_H32
rename SNI_REL_X33 SNI_REL_H33

rename SNI_REL_X29_TEXT SNI_REL_H29_TEXT
rename SNI_REL_X30_TEXT SNI_REL_H30_TEXT
rename SNI_REL_X31_TEXT SNI_REL_H31_TEXT
rename SNI_REL_X32_TEXT SNI_REL_H32_TEXT
rename SNI_REL_X33_TEXT SNI_REL_H33_TEXT
