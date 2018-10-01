version 15

clear

//import raw, formattted csv file **NEED TO CHANGE PATH FOR UPDATED FILES EVERY TIME WE UPDATE**
import delimited "U:\Log My Life Study\Survey Data\Qualtrics Data Exports\Baseline\Version_Copy (edits 2017-05-30)\LogMyLife Baseline Questionnaire - Copy (edits 2017-05-30)_September 18, 2017_15.01_formatted", delimiter(comma) varnames(1) case(upper)


//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)
