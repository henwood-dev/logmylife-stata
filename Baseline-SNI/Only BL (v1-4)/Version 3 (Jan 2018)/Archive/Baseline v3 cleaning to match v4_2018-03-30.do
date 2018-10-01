version 15

clear

//import raw, formattted csv file for BL v3 (no longer being administered after 2/7/18**
import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Baseline\Version 3 (Jan 2018)\LogMyLife Baseline Questionnaire_ver3 (Jan2018)_February 28 2018_16.33_formatted", delimiter(comma) varnames(1) case(upper)

//drop 4 test responses
drop if RESPONSEID=="R_28MuG4hl2PCLe0I"
drop if RESPONSEID=="R_12R3h2qrWS8AkUi"
drop if RESPONSEID=="R_3pgMyQjKSLDa3H9"
drop if RESPONSEID=="R_2aDfQEATCqHYQHi"


//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)
sort PID

//drop empty metadata variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//drop variable(s) that were removed/deemed unnecessary in current survey versions
drop CONSENTCOMP

//generate empty fields for variables for variables added in future versions (updated for v3.1 and v4)
/*TTLINCOME_BENEFITS, added in BL v3.1*/
gen TTLINCOME_BENEFITS=.
order TTLINCOME_BENEFITS, after(TTLINCOME_EMPLOY)
/*HFIAS scale items, added in baseline v4*/
gen HFIAS_1=.
gen HFIAS_1_A=.
gen HFIAS_2=.
gen HFIAS_2_A=.
gen HFIAS_3=.
gen HFIAS_3_A=.
gen HFIAS_4=.
gen HFIAS_4_A=.
gen HFIAS_5=.
gen HFIAS_5_A=.
gen HFIAS_6=.
gen HFIAS_6_A=.
gen HFIAS_7=.
gen HFIAS_7_A=.
gen HFIAS_8=.
gen HFIAS_8_A=.
gen HFIAS_9=.
gen HFIAS_9_A=.
order HFIAS_1-HFIAS_9_A, after(TTLINCOME_INFORMAL)

//Correct any data changes that need to be made
replace SITE_HOUSED=12 if PID==1058
replace INCMGEN_30DAY_15=1 if PID==1058
replace TTLINCOME_BENEFITS=4 if PID==1058

//add survey version variable for all obs=3
gen BLVERSION=3
order BLVERSION, after(DATE)
replace BLVERSION=-9 if PID==1058 /*-9 is code for special case of bl version*/
