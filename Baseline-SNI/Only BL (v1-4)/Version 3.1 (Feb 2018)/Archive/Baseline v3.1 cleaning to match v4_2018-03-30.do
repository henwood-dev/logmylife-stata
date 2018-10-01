version 15

clear

//import raw, formattted csv file for BL v3 (no longer being administered after 2/7/18**
import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Baseline\Version 3.1 (Feb 2018)\LogMyLife Baseline Questionnaire_ver3.1 (Feb2018)_March 29, 2018_14.53_formatted", delimiter(comma) varnames(1) case(upper)




//TEMPORARY!!! DROP LML1077'S RESPONSE FOR THIS VERSION B/C FIRST HALF OF RESPONSE IS IN V4 AND JUST NEED DEMOS FOR NOW
drop if PID==1077




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


//generate empty fields for variables for variables added in future versions (updated v4)
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

//add survey version variable for all obs=3
gen BLVERSION=3.1
order BLVERSION, after(DATE)
/*replace BLVERSION=-9 if PID==1077 /*-9 is code for special case of bl version*/
