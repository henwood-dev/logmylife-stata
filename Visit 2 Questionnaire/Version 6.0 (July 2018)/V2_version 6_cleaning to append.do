///*in-office version*/ version 15

clear

//import raw, formattted csv file for all who took V2 version 6
/*mac remote login*/import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Visit 2 Questionnaire_HES-CLS\Version 6.0 (July 2018)\Visit2_Questionnaire_ver6.0 (July2018)_August 10, 2018_12.43_FORMATTED", delimiter(comma) varnames(1) case(upper)

//reorder variables how I like them...
order V2Q_PID, first
order RESPONSEID, after(V2Q_PID)
sort V2Q_PID

//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//misspelled variable, fixing to match other versions
rename EI_AGREE_EI_DOITAGAI EI_AGREE_EI_DOITAGAIN

//drop test ids
drop if RESPONSEID == "R_ykEWOsM5fBrha5X"
drop if RESPONSEID == "R_2VllYCzWcjjkhPX"
drop if RESPONSEID == "R_yJwlvxdOMMqWn4Z"
drop if RESPONSEID == "R_1GBlxtBDGlkeKu7"
drop if RESPONSEID == "R_1iniSJLreXVWkXE"

replace V2Q_PID = 1129 if RESPONSEID == "R_10NlniZ8rWHuIV9"
replace V2Q_PID = 1130 if RESPONSEID == "R_WDnNcnnPz5lI7Ml"



///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
///////////////////////APPEND/////////////////////////////////

//with verion 5
append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Clean Datasets\Clean ONLY Visit 2 Questionnaire Datasets\V2_version 5_cleaned"
//with version 4
append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Clean Datasets\Clean ONLY Visit 2 Questionnaire Datasets\V2_version 4_cleaned", force
//with version 3
append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Clean Datasets\Clean ONLY Visit 2 Questionnaire Datasets\V2_version 3_cleaned", force
//with version 1
append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Clean Datasets\Clean ONLY Visit 2 Questionnaire Datasets\V2_version 1_cleaned", force

//reorder variables how I like them...
order V2Q_PID, first
order RESPONSEID, after(V2Q_PID)
sort V2Q_PID

