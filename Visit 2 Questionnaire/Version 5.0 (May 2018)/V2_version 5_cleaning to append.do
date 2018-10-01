///*in-office version*/ version 15

clear

//import raw, formattted csv file for all who took V2 version 5
/*mac remote login*/import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Visit 2 Questionnaire_HES-CLS\Version 5.0 (May 2018)\LogMyLife_Visit2_Questionnaire_ver5.0_FORMATTED", delimiter(comma) varnames(1) case(upper)

//reorder variables how I like them...
order V2Q_PID, first
order RESPONSEID, after(V2Q_PID)
sort V2Q_PID

//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//delete school-work schedule from data
drop V2Q_WORKSCHOOLWEEK_*

//drop test ids
drop if V2Q_PID == 101
drop if RESPONSEID == "R_3e3KHPHwy4TsSAa"

replace V2Q_PID = 2011 if RESPONSEID == "R_3PmLgNuV3kHZMVt"
replace V2Q_PID = 2019 if RESPONSEID == "R_31Qt8FUpZ8f2Y2D"
replace V2Q_PID = 1123 if RESPONSEID == "R_338UYPxSPohpAg1"

