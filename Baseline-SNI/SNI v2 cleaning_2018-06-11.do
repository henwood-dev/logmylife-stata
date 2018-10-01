version 15

clear

//import raw, formattted csv file for all who took Baseline Version 4
import delimited "E:\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\SNI\Version 2.0-2.1 (2017-05-31_2.0pre-PID_2.1post-PID)\LogMyLifeSNIQuestionnaire ver2 (FL17)_December 18, 2017_15.17_formatted", delimiter(comma) varnames(1) case(upper)

//responses recorded before PID assigned to SPs, assigning PID based on top 5
replace SNI_PID = 1001 if RESPONSEID == "R_10qtoRYWsUkoIzt"
replace SNI_PID = 1005 if RESPONSEID == "R_1pxTWxuU54eFKlB"
replace SNI_PID = 1010 if RESPONSEID == "R_300lktfUf1pY6P5"
replace SNI_PID = 1011 if RESPONSEID == "R_3JeBtrOV0li5zX8"
replace SNI_PID = 2001 if RESPONSEID == "R_3OfbRQsgDj2Kevm"
replace SNI_PID = 2002 if RESPONSEID == "R_3Rt5HgK5XpHLn2Y"
replace SNI_PID = 2003 if RESPONSEID == "R_w0pYnI7VH9xrMlz"
replace SNI_PID = 2004 if RESPONSEID == "R_1IWMkYe9k7Y45ZN"

//BL only changes in SNI_PID
replace SNI_PID = 3003 if RESPONSEID == "R_21ieA681AseMilh"
replace SNI_PID = 3007 if RESPONSEID == "R_2diIpwcMFW8hEwg"
replace SNI_PID = 3025 if RESPONSEID == "R_1kNSGuHA9YCyU18"
replace SNI_PID = 3046 if RESPONSEID == "R_3065aTmwnpPCYF7"
replace SNI_PID = 4008 if RESPONSEID == "R_3MG6UTQ2fig8Us4"
replace SNI_PID = 4016 if RESPONSEID == "R_3pgs8knsRgeM2Zb"

//delete, largely due to test survey
drop if RESPONSEID == "R_3HU2nKY8iSPGrCj" 
drop if RESPONSEID == "R_26ausAH2Hrf6N7F"
drop if RESPONSEID == "R_2f73yMqqRmR7RmV"
drop if RESPONSEID == "R_OCKfmfoddyO8Hdv"
drop if RESPONSEID == "R_3nNLDwYMELWbHuB"
drop if RESPONSEID == "R_1CIKwLoXlp7JGzG"
drop if RESPONSEID == "R_pniit4z74M4zpu1"
drop if RESPONSEID == "R_W23nNeL5OU6dVLj"
drop if RESPONSEID == "R_1kNZzNdyMdPAYQp"
drop if RESPONSEID == "R_2zvTwwoNVvualpm"

//reorder variables how I like them...
order SNI_PID, first
order RESPONSEID, after(SNI_PID)
sort SNI_PID

//add survey version variable for all obs=2
gen SNIVERSION=2
order SNIVERSION, after(RESPONSEID)

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


