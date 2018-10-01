///*in-office version*/ version 15

clear

//import raw, formattted csv file for all who took V2 version 3
/*mac remote login*/import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Visit 2 Questionnaire_HES-CLS\Version 3.0 (Feb 2018)\LogMyLife_Visit2_Questionnaire_ver3 (Feb2018)_June 25, 2018_09.22_FORMATTED", delimiter(comma) varnames(1) case(upper)

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
drop if RESPONSEID == "R_2X66FVl0NeOhixn"
drop if RESPONSEID == "R_3eNrv9wgEEw1DfH"

