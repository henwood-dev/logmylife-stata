///*in-office version*/ version 15

clear

//import raw, formattted csv file for all who took V2 version 1
/*mac remote login*/import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Visit 2 Questionnaire_HES-CLS\Version 1.0 (original HES-CLS)\LogMyLife Visit2 Questionnaire_ver1_June 25, 2018_09.31_FORMATTED", delimiter(comma) varnames(1) case(upper)

//reorder variables how I like them...
order EXIT_PID, first
order RESPONSEID, after(EXIT_PID)
sort EXIT_PID

//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//drop test ids
drop if EXIT_PID == 125231
drop if EXIT_PID == 105
drop if EXIT_PID == 10100
drop if EXIT_PID == 7675667

//PID 1031 - Accidentally took HES/V2Q on 9/8 at V1 instead of BL (correctly took SNI on 9/8/17). Took baseline on 10/3 instead. Drop 9/8 V2Q and keep 9/26 V2Q.
drop if RESPONSEID == "R_OiLgOEXdq9zF0iJ"

rename EXIT_PID V2Q_PID
rename HES_DATE V2Q_DATE
