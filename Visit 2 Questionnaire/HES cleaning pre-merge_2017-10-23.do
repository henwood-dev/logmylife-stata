version 15

clear

import delimited "U:\Log My Life Study\Survey Data\Qualtrics Data Exports\HES_CLS\Exit Interview_Housing Environment-Life Skills Items_October 18, 2017_16.00_formatted.csv", case(upper) 

//drop unneccessary variables/rename others as needed
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE
rename EXIT_PID PID_EXIT

//reorder variables how I like them...
order RECORDEDDATE, after(ENDDATE)
order STATUS-USERLANGUAGE, last
order PID_EXIT, first
order RESPONSEID, after(PID)
sort PID_EXIT

//drop test responses/junk responses:
drop if PID == 105 & RESPONSEID == "R_1pAVgwmZ0NSDvrc"
drop if PID == 10100 & RESPONSEID == "R_2cu51Ni0Lit4T0e"
drop if PID == 7675667 & RESPONSEID == "R_0NugAIF3VyvohKV"
drop if PID == 125231 & RESPONSEID == "R_1pyRsMTctbJuoK3"

//add dates for first few SPs
replace HES_DATE="6/19/2017" if PID==1001 | PID==1002 | PID==1004 | PID==1005

//label variables and values, drop unneccessary variables
lab var STARTDATE "Survey start date, qualtrics timestamp"
lab var ENDDATE "Survey end date, qualtrics timestamp"
lab var STATUS "qualtrics status"
lab var IPADDRESS "IP address for survey administration"
lab var PROGRESS "Percent of survey complete"
lab var DURATIONINSECONDS "Duration (in seconds) of survey administration"
lab var FINISHED "survey finished y/n"
lab var RECORDEDDATE "recorded date timestamp (qualtrics generated)"
lab var RESPONSEID "unique qualtrics response ID"

lab var LOCATIONLATITUDE "Location of survey - latitude"
lab var LOCATIONLONGITUDE "Location of survey - longitude"
lab var DISTRIBUTIONCHANNEL "Qualtrics Distrubution Channel (anonymous link/preview link/etc)"
lab var USERLANGUAGE "User language"
lab var HES_DATE "Exit interview/HES survey administration date (entered by interviewer MM/DD/YYYY)"
lab var PID_EXIT "Participant ID"
