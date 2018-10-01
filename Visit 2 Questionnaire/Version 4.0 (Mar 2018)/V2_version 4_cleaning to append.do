///*in-office version*/ version 15

clear

//import raw, formattted csv file for all who took V2 version 4
/*mac remote login*/import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Visit 2 Questionnaire_HES-CLS\Version 4.0 (Mar 2018)\LogMyLife_Visit2_Questionnaire_ver4.0 (Mar2018)_FORMATTED", delimiter(comma) varnames(1) case(upper)

//reorder variables how I like them...
order V2Q_PID, first
order RESPONSEID, after(V2Q_PID)
sort V2Q_PID

//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//drop test id
drop if RESPONSEID == "R_8ffh1QKZh1MjMHL"

//edit PID to correct
replace V2Q_PID = 1099 if RESPONSEID == "R_uyQRieSTpMom4jD"
replace V2Q_PID = 1115 if RESPONSEID == "R_1LeznYAMP8Ac2TV"

