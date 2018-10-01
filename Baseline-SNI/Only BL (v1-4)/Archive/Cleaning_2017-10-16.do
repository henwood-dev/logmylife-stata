version 15

clear

//import raw, formattted csv file **NEED TO CHANGE PATH FOR UPDATED FILES EVERY TIME WE UPDATE**
import delimited "U:\Log My Life Study\Survey Data\Qualtrics Data Exports\Baseline\LogMyLife Baseline Questionnaire - (edits 2017-07-11)_October 3, 2017_14.59_formatted", delimiter(comma) varnames(1) case(upper)


//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)



/* TEMPORARY!!!! Add observations for any that don't have a survey file and label them with PID, then enter values for HISP, RACE and SEX for reporting
insobs 1 
replace PID = 1001 if PID == . 
replace SEX = 1 if PID == 1001
replace HISP = 1 if PID == 1001
replace RACE = 99 if PID == 1001

insobs 1 
replace PID = 1002 if PID == . 
replace SEX = 1 if PID == 1002
replace HISP = 99 if PID == 1002
replace RACE = 2 if PID == 1002

insobs 1 
replace PID = 1003 if PID == . 
replace SEX = 1 if PID == 1003
replace HISP = 0 if PID == 1003
replace RACE = 3 if PID == 1003

insobs 1 
replace PID = 1004 if PID == . 
replace SEX = 1 if PID == 1004
replace HISP = 0 if PID == 1004
replace RACE = 7 if PID == 1004

insobs 1 
replace PID = 1005 if PID == . 
replace SEX = 1 if PID == 1005
replace HISP = 0 if PID == 1005
replace RACE = 6 if PID == 1005

insobs 1
replace PID = 1007 if PID == . 
replace SEX = 2 if PID == 1007
replace HISP = 999 if PID == 1007
replace RACE = 999 if PID == 1007

insobs 1 
replace PID = 1010 if PID == . 
replace SEX = 1 if PID == 1010
replace HISP = 1 if PID == 1010
replace RACE = 99 if PID == 1010

insobs 1 
replace PID = 1011 if PID == . 
replace SEX = 1 if PID == 1011
replace HISP = 1 if PID == 1011
replace RACE = 99 if PID == 1011

insobs 1 
replace PID = 1013 if PID == . 
replace SEX = 1 if PID == 1013
replace HISP = 1 if PID == 1013
replace RACE = 6 if PID == 1013

insobs 1 
replace PID = 1014 if PID == . 
replace SEX = 1 if PID == 1014
replace HISP = 1 if PID == 1014
replace RACE = 99 if PID == 1014

insobs 1 
replace PID = 2001 if PID == . 
replace SEX = 1 if PID == 2001
replace HISP = 1 if PID == 2001
replace RACE = 99 if PID == 2001

insobs 1 
replace PID = 2002 if PID == . 
replace SEX = 1 if PID == 2002
replace HISP = 1 if PID == 2002
replace RACE = 99 if PID == 2002

insobs 1 
replace PID = 2003 if PID == . 
replace SEX = 1 if PID == 2003
replace HISP = 1 if PID == 2003
replace RACE = 99 if PID == 2003

insobs 1 
replace PID = 2004 if PID == . 
replace SEX = 1 if PID == 2004
replace HISP = 1 if PID == 2004
replace RACE = 99 if PID == 2004

insobs 1 
replace PID = 2005 if PID == . 
replace SEX = 1 if PID == 2005
replace HISP = 1 if PID == 2005
replace RACE = 3 if PID == 2005

insobs 1 
replace PID = 2006 if PID == . 
replace SEX = 1 if PID == 2006
replace HISP = 1 if PID == 2006
replace RACE = 99 if PID == 2006


//END OF TEMPORARY INSERTIONS*/


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

drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

lab var LOCATIONLATITUDE "Location of survey - latitude"
lab var LOCATIONLONGITUDE "Location of survey - longitude"
lab var DISTRIBUTIONCHANNEL "Qualtrics Distrubution Channel (anonymous link/preview link/etc)"
lab var USERLANGUAGE "User language"
lab var INTNAME "Interviewer Name"
lab var DATE "Interview date (entered by interviewer MM/DD/YYYY)"
lab var PID "Participant ID"

lab var SURVEYTYPE "Survey type, housed/not housed"
lab def SURVEYTYPE_LAB 1"Housed" 2"Unhoused" -99"Seen but not answered"
lab val SURVEYTYPE SURVEYTYPE_LAB

//make sure to add new sites as we go. 
lab var SITE_HOUSED "Recruitment site, housed"
lab def SITE_HOUSED_LAB 1"Jovenes TLP" 2"Jovenes SH (Progress Place)" 4"Jovenes Scattered Site SH" 5"CRCD Epworth Apts SH" 6"CRCD 28th Street Apts SH" 7"Young Burlington SH" 8"Covenant House TLP" 9"Ruth's Place TLP" 77"Other (please specify)" -99"Seen but not answered", modify
lab val SITE_HOUSED SITE_HOUSED_LAB

lab var SITE_UNHOUSED "Recruitment site, unhoused"
lab def SITE_UNHOUSED_LAB 1"Jovenes ES" 2"Jovenes-OTHER" 4"CRCD Ruth's Place Drop-in" 77"Other, (please specify)" -99"Seen but not answered"
lab val SITE_UNHOUSED SITE_UNHOUSED_LAB


lab var CONSENTCOMP "Consent comprehension questions asked y/n"
lab def YNONLY_LAB 1"Yes" 0"No" -99"Seen but not answered" 999"Missing"
lab val CONSENTCOMP YNONLY_LAB

lab var CONSENT "Consent signed y/n"
lab val CONSENT YNONLY_LAB

lab var DOB "birthdate"

lab var HISP "hispanic/latino"
lab def YN_DK_LAB 1"Yes" 0"No" 99"Don't know" -99"Seen but not answered" 999"Missing Data"
lab val HISP YN_DK_LAB

lab var RACE "race"
lab def RACE_LAB 1"American Indian or Alaska Native" 2"Asian" 3"Black or African American" 4"Native Hawaiian or other Pacific Islander" 5"South Asian" 6"White" 7"Bi/Multi Racial or Ethnic" 8"Other, please specify" 99"I don't know" -99"Seen but not answered" 999"MISSING"
lab val RACE RACE_LAB

rename RACE_8_TEXT RACE_OTHER
lab var RACE_OTHER "Race_other (text entry)"

lab var BIRACE_1 "Bi/multi-racial/ethnic: American Indian or Alaska Native selected"
lab var BIRACE_2 "Bi/multi-racial/ethnic: Asian selected"
lab var BIRACE_3 "Bi/multi-racial/ethnic: Black or African American selected"
lab var BIRACE_4 "Bi/multi-racial/ethnic: Hispanic/Latino selected"
lab var BIRACE_5 "Bi/multi-racial/ethnic: Native Hawaiian or other Pacific Islander selected"
lab var BIRACE_6 "Bi/multi-racial/ethnic: South Asian selected"
lab var BIRACE_7 "Bi/multi-racial/ethnic: White selected"
lab var BIRACE_8 "Bi/multi-racial/ethnic: Other, please specify:___ selected"
lab var BIRACE_99 "Bi/multi-racial/ethnic: Don't know selected"

rename BIRACE_8_TEXT BIRACE_OTHER
lab var BIRACE_OTHER "Bi/multi-racial/ethnic-OTHER (text entry)"


lab var INSCHOOL "Currently attending school?"
lab val INSCHOOL YNONLY_LAB

lab var INSCHOOL_TYPE "Type of school currently attending"
lab def INSCHOOL_TYPE_LAB 1"GED Program" 5"High School" 2"Vocational/trade school" 3"College" 4"Other (please specify)" -99 "Seen but not answered"
lab val INSCHOOL_TYPE INSCHOOL_TYPE_LAB

lab var EDUC "Highest level of school completed"
lab def EDUC_LAB 1"No formal education" 2"Kindergarten to 5th grade" 3"6th to 8th grade" 4"9th to 12th grade (no degree)" 5"High school diploma" 6"GED" 7"Some vocational/trade school (no degree)" 8"Voacational/trade school degree" 9"Associates (AA) degree" 10"Bachelor's BA/BS degree" 11"Some graduate school (no degree)" 12"Gradute degree" -99"Seen but not answered"
lab val EDUC EDUC_LAB

lab var SEX "Biological sex"
lab def SEX_LAB 1"Male" 2"Female" 99"Don't Know" -99"Seen but not answered"
lab val SEX SEX_LAB

rename GENDER_1 GENDER_M
lab var GENDER_M "Gender: Male selected"
rename GENDER_2 GENDER_F
lab var GENDER_F "Gender: Female selected"
rename GENDER_3 GENDER_TM
lab var GENDER_TM "Gender: Trans male/Trans man selected"
rename GENDER_4 GENDER_TF
lab var GENDER_TF "Gender: Trans female/Trans woman selected"
rename GENDER_5 GENDER_GQNC
lab var GENDER_GQNC "Gender: Genderqueer/gender non-conforming selected"
rename GENDER_6 GENDER_OTHER
lab var GENDER_OTHER "Gender: Different identity (please state) selected"
rename GENDER_6_TEXT GENDER_OTHER_TEXT
lab var GENDER_OTHER_TEXT "Gender: Different identity (please state) TEXT ENTRY"

lab var SEXORI "Sexual orientation identity"
lab def SEXORI_LAB 1"Gay or lesbian" 2"Bisexual" 3"Heterosexual or straight" 4"Questioning or unsure" 5"Asexual" 6"Another sexual orientation, please specify" -99"Seen but not answered"
lab val SEXORI SEXORI_LAB

rename SEXORI_6_TEXT SEXORI_OTHER
lab var SEXORI_OTHER "Another sexual orientation please specify: _____ (TEXT ENTRY)"

rename SEXATTR_FORMALES SEXATTR
lab var SEXATTR "Sexual attraction preferences"
lab def SEXATTR_LAB 1"Only attracted to females" 2"Mostly attracted to females" 3"Equally attracted to females and males" 4"Mostly attracted to males" 5"Only attracted to males" 99"Not sure" -99"Seen but not answered"
lab val SEXATTR SEXATTR_LAB

lab var RESEARCH_LAST "Last research study involvement"
lab def RESEARCH_LAST_LAB 1"Less than 1 month ago" 2"1-3 months ago" 3"4-6 months ago" 4"6-12 months ago" 5"1-3 years ago" 0"I have never participated in a research study before this" -99"Seen but not answered"
lab val RESEARCH_LAST RESEARCH_LAST_LAB

rename RESEARCH_TYPES_1 RESEARCHTYPE_HIV
lab var RESEARCHTYPE_HIV "Type of research involved in: HIV prevention or risk selected"
rename RESEARCH_TYPES_2 RESEARCHTYPE_SU
lab var RESEARCHTYPE_SU "Type of research involved in: Substance use selected"
rename RESEARCH_TYPES_3 RESEARCHTYPE_SEX
lab var RESEARCHTYPE_SEX "Type of research involved in: Sexual behavior selected"
rename RESEARCH_TYPES_4 RESEARCHTYPE_OTHER
lab var RESEARCHTYPE_OTHER "Type of research involved in: Other, please specify selected"
rename RESEARCH_TYPES_99 RESEARCHTYPE_DK
lab var RESEARCHTYPE_DK "Type of research involved in: Don't know/can't remember selected"
rename RESEARCH_TYPES_4_TEXT RESEARCHTYPE_OTHER_TEXT
lab var RESEARCHTYPE_OTHER_TEXT "Type of research involved in: Other text entry"

lab var RESEARCH_PASTYR "Number of research studies involved with in past year"
lab def RESEARCH_PASTYR_LAB 1"1" 2"2" 3"3" 4"4" 5"5 or more" -99"Seen but not answered"
lab val RESEARCH_PASTYR RESEARCH_PASTYR_LAB

lab var ROMREL_MARR "Current marital status"
lab def ROMREL_MARR_LAB	1"Yes, to a woman" 2"Yes, to a man" 0"No, not currently married" -99"Seen but not answered"
lab val ROMREL_MARR ROMREL_MARR_LAB

lab var ROMREL_CURR "Currently in a committed romantic/intimate relationship"
lab val ROMREL_CURR YN_DK_LAB

lab var ROMREL_PTNRS "Polyamory - # of partners in relationship"
lab def ROMREL_PTNRS_LAB 1"1" 2"2" 3"More than 2"
lab val ROMREL_PTNRS ROMREL_PTNRS_LAB

rename ROMREL_PTNRSGNDR_1 ROMREL_PTNRSGNDR_M
lab var ROMREL_PTNRSGNDR_M "Gender(s) of partners: Male selected"

rename ROMREL_PTNRSGNDR_2 ROMREL_PTNRSGNDR_F
lab var ROMREL_PTNRSGNDR_F "Gender(s) of partners: Female selected"

rename ROMREL_PTNRSGNDR_3 ROMREL_PTNRSGNDR_TM
lab var ROMREL_PTNRSGNDR_TM "Gender(s) of partners: Trans male/trans man selected"

rename ROMREL_PTNRSGNDR_4 ROMREL_PTNRSGNDR_TF
lab var ROMREL_PTNRSGNDR_TF "Gender(s) of partners: Trans female/trans woman selected"

rename ROMREL_PTNRSGNDR_5 ROMREL_PTNRSGNDR_GQ
lab var ROMREL_PTNRSGNDR_GQ "Gender(s) of partners: Genderqueer/gender non-comforming selected"

rename ROMREL_PTNRSGNDR_6 ROMREL_PTNRSGNDR_OTHER
lab var ROMREL_PTNRSGNDR_OTHER "Gender(s) of partners: Other selected"

rename ROMREL_PTNRSGNDR_6_TEXT ROMREL_PTNRSGNDR_OTHER_TXT
lab var ROMREL_PTNRSGNDR_OTHER_TXT "Gender(s) of partners: Other (text input)"

lab var ROMREL_DUR "Duration of romantic relationship"
lab def ROMREL_DUR_LAB 1"1 day or less" 2"1-30 days" 3"1-3 months" 4"3-12 months" 5"1-3 years" 6"More than 3 years" -99"Seen but not answered"
lab val ROMREL_DUR ROMREL_DUR_LAB

lab var ROMREL_SEX_0 "Sex behavior w/ partner: no sexual relatnioship selected"
lab var ROMREL_SEX_1 "Sex behavior w/ partner: monogamous throughout relationship selected"
lab var ROMREL_SEX_2 "Sex behavior w/ partner: have had period(s) of monogamy selected"
lab var ROMREL_SEX_3 "Sex behavior w/ partner: have had sex with other people TOGETHER (e.g., 3-ways) selected"
lab var ROMREL_SEX_4 "Sex behavior w/ partner: I have sex with other people selected"
lab var ROMREL_SEX_5 "Sex behavior w/ partner: Partner(s) have sex with other people selected"
lab var ROMREL_SEX_6 "Sex behavior w/ partner: Don't ask-don't tell about sex with others selected"
lab var ROMREL_SEX_7 "Sex behavior w/ partner: I've played around/cheated on partner selected"
lab var ROMREL_SEX_8 "Sex behavior w/ partner: Partner has played around/cheated on me selected"

lab var FIRSTHOMELESS "Age first homeless"

lab var REASONHOMELESS_1 "Cause of homelessness: kicked out/asked to leave FAMILY home selected"
lab var REASONHOMELESS_2 "Cause of homelessness: kicked out/asked to leave FOSTER home selected"
lab var REASONHOMELESS_3 "Cause of homelessness: kicked out/asked to leave RELATIVE's home selected"
lab var REASONHOMELESS_4 "Cause of homelessness: kicked out/asked to leave GROUP HOME selected"
lab var REASONHOMELESS_5 "Cause of homelessness: ran away from FAMILY home selected"
lab var REASONHOMELESS_6 "Cause of homelessness: ran away from FOSTER FAMILY home selected"
lab var REASONHOMELESS_7 "Cause of homelessness: ran away from RELATIVE's home selected"
lab var REASONHOMELESS_8 "Cause of homelessness: ran away from GROUP HOME selected"
lab var REASONHOMELESS_9 "Cause of homelessness: aged out of foster care selected"
lab var REASONHOMELESS_10 "Cause of homelessness: couldn't pay rent selected"
lab var REASONHOMELESS_11 "Cause of homelessness: no place to go when got out of jail/prison selected"
lab var REASONHOMELESS_12 "Cause of homelessness: no place to go when got out of hospital selected"
lab var REASONHOMELESS_13 "Cause of homelessness: left domestic violence situation selected"
lab var REASONHOMELESS_14 "Cause of homelessness: left gang or neighborhood w/ gang violence selected"
lab var REASONHOMELESS_15 "Cause of homelessness: FAMILY does not have stable place to stay selected"
lab var REASONHOMELESS_16 "Cause of homelessness: had no place to stay when moved here selected"
lab var REASONHOMELESS_17 "Cause of homelessness: OTHER selected"
lab var REASONHOMELESS_17_TEXT "Cause of homelessness: OTHER text entry"

lab var HOUSINGPROGS_EVER_1 "Places lived since becoming homeless: family home selected"
lab var HOUSINGPROGS_EVER_2 "Places lived since becoming homeless: foster family home selected"
lab var HOUSINGPROGS_EVER_3 "Places lived since becoming homeless: relative's home selected"
lab var HOUSINGPROGS_EVER_4 "Places lived since becoming homeless: friend's home selected"
lab var HOUSINGPROGS_EVER_5 "Places lived since becoming homeless: home of romantic/intimate partner selected"
lab var HOUSINGPROGS_EVER_6 "Places lived since becoming homeless: group home selected"
lab var HOUSINGPROGS_EVER_7 "Places lived since becoming homeless: Adult emergency/short-term shelter (<30 days) selected"
lab var HOUSINGPROGS_EVER_8 "Places lived since becoming homeless: Youth-only emergency/short-term shelter (<30 days) selected"
lab var HOUSINGPROGS_EVER_9 "Places lived since becoming homeless: Adult longer-term shelter (>30 days) selected"
lab var HOUSINGPROGS_EVER_10 "Places lived since becoming homeless: Youth-only longer term shelter (>30 days) selected"
lab var HOUSINGPROGS_EVER_11 "Places lived since becoming homeless: Hotel/motel selected"
lab var HOUSINGPROGS_EVER_12 "Places lived since becoming homeless: sober living facility selected"
lab var HOUSINGPROGS_EVER_13 "Places lived since becoming homeless: juvenile detention center or jail selected"
lab var HOUSINGPROGS_EVER_14 "Places lived since becoming homeless: TLP selected"
lab var HOUSINGPROGS_EVER_15 "Places lived since becoming homeless: PSH/SH program selected"
lab var HOUSINGPROGS_EVER_16 "Places lived since becoming homeless: own apartment selected"
lab var HOUSINGPROGS_EVER_17 "Places lived since becoming homeless: street/park/beach/outside selected"
lab var HOUSINGPROGS_EVER_18 "Places lived since becoming homeless: abandoned building/squat selected"
lab var HOUSINGPROGS_EVER_19 "Places lived since becoming homeless: car/bus/light rail/metro selected"
lab var HOUSINGPROGS_EVER_20 "Places lived since becoming homeless: OTHER selected"
lab var HOUSINGPROGS_EVER_20_TEXT "Places lived since becoming homeless: OTHER text entry"

lab var TIMEHOMELESS_EVER "total duration of homelessness over lifetime"
lab def HMLS_HOUSEDTIME_LAB 1"Less than 1 month" 2"1-3 months" 3"4-6 months" 4"7-9 months" 5"10-11 months" 6"1-2 years" 7"3-4 years" 8"5-6 years" 9"7-8 years" 10"9 or more years" -99"Seen but not answered"
lab val TIMEHOMELESS_EVER HMLS_HOUSEDTIME_LAB

lab var TIMEHOUSED "length of stay at current housing program"
lab val TIMEHOUSED HMLS_HOUSEDTIME_LAB

lab var STAYBEFOREHOUSED "place of stay most of the time immediately before being housed"
lab def STAYBEFOREHOUSED_LAB 1"family home" 2"foster family home" 3"relative's home" 4"friend's home" 5"home of romantic/intimate partner" 6"group home" 7"adult emergency/short-term shelter (<30 days)" 8"youth emergency/short-term shelter (<30 days)" 9"adult longer-term shelter (>30 days)" 10"Youth-only longer-term shelter (>30 days)" 11"hotel/motel" 12"sober living facility" 13"juvenile detention center or jail" 14"TLP" 15"PSH/SH program" 16"own apartment" 17"street/park/beach/outside" 18"abandoned building/squat" 19"car/bus/light rail/metro" 20"Other please specify" -99"Seen but not answered"
lab val STAYBEFOREHOUSED STAYBEFOREHOUSED_LAB

rename STAYBEFOREHOUSED_20_TEXT STAYBEFOREHOUSED_OTHER
lab var STAYBEFOREHOUSED_OTHER "place of stay most of the time immediately before being housed_other text entry"

lab var TIMEHOMELESS_BEFOREH "duration of most recent homeless episode for HOUSED SP"
lab val TIMEHOMELESS_BEFOREH HMLS_HOUSEDTIME_LAB

lab var TIMEHOMELESS_RECENT "duration of current/most recent homeless episode for UNHOUSED SP"
lab val TIMEHOMELESS_RECENT HMLS_HOUSEDTIME_LAB

lab var FC_EVER "ever placed in foster care"
lab val FC_EVER YNONLY_LAB

lab var FC_PLACEMENTS "Number of foster care placements ever"
lab def FC_PLACEMENTS_LAB 1"1-2" 2"3-4" 3"5-9" 4"10-20" 5"more than 20"
lab val FC_PLACEMENTS FC_PLACEMENTS_LAB

lab var JJS_EVER "Juvenile justice system involvement ever"
lab val JJS_EVER YNONLY_LAB

lab var JJS_AGEOUT "aged out of juvenile justice system"
lab val JJS_AGEOUT YNONLY_LAB

lab var ARREST_EVER "ever arrested since turning 18 years old"
lab val ARREST_EVER YNONLY_LAB

lab var JAIL_EVER "ever in jail/prison since turning 18 years old"
lab val JAIL_EVER YNONLY_LAB


lab var STRESS_STREETS_1 "How much stress did you feel about the following in the past month: FINDING ENOUGH FOOD TO EAT"
lab var STRESS_STREETS_2 "How much stress did you feel about the following in the past month: GETTING ALONG WITH FRIENDS"
lab var STRESS_STREETS_3 "How much stress did you feel about the following in the past month: BEING ARRESTED"
lab var STRESS_STREETS_4 "How much stress did you feel about the following in the past month: BEING UNABLE TO FIND WORK"
lab var STRESS_STREETS_5 "How much stress did you feel about the following in the past month: BEING HIT/KICKED/PUNCHED"
lab var STRESS_STREETS_6 "How much stress did you feel about the following in the past month: FINDING A PLACE TO SLEEP"
lab var STRESS_STREETS_7 "How much stress did you feel about the following in the past month: GETTING PROFESSIONAL HELP FOR A HEALTH PROBLEM"
lab var STRESS_STREETS_8 "How much stress did you feel about the following in the past month: BEING TREATED BADLY BY THE REST OF SOCIETY"
lab var STRESS_STREETS_9 "How much stress did you feel about the following in the past month: HAVING A PURPOSE FOR MY LIFE"
lab var STRESS_STREETS_10 "How much stress did you feel about the following in the past month: GETTING MORE EDUCATION"
lab var STRESS_STREETS_11 "How much stress did you feel about the following in the past month: FINDING A PLACE TO TAKE A BATH OR SHOWER"
lab var STRESS_STREETS_12 "How much stress did you feel about the following in the past month: FINDING A PLACE TO WASH MY CLOTHES"
lab var STRESS_STREETS_13 "How much stress did you feel about the following in the past month: FINDING OTHER PEOPLE TO HANG OUT WITH"
lab var STRESS_STREETS_14 "How much stress did you feel about the following in the past month: BEING SEXUALLY ASSAULTED"
lab var STRESS_STREETS_15 "How much stress did you feel about the following in the past month: EARNING MONEY"

lab def SOTS_LAB 1"None at all" 2"A little" 3"More than a little" 4"A lot" -99"Seen but not answered"
lab val STRESS_STREETS_* SOTS_LAB

lab def YN_NS_LAB 1"Yes" 0"No" 99"Not sure" -99"Seen but not answered"

lab var MSE_RELPROV "MSE: Have developed at least one relationship with a supportive and positive staff"
lab var MSE_TALKTO "MSE: Know who I can talk to in the youth service system to get support"
lab var MSE_HOUSINGOPTS "MSE: Know housing options available to me"
lab val MSE_RELPROV-MSE_HOUSINGOPTS YN_NS_LAB

lab var MSEPROGENGAGE_0 "MSE: participated in I HAVE NOT PARTICIPATED IN ANY MEANINGFUL ACTIVITIES THROUGH YOUTH SERVICES selected"
lab var MSEPROGENGAGE_1 "MSE: participated in EDUCATION PROGRAMS selected"
lab var MSEPROGENGAGE_2 "MSE: participated in JOB READINESS TRAINING/EMPLOYMENT SERVICES selected"
lab var MSEPROGENGAGE_3 "MSE: participated in PAID INTERNSHIP/WORK EXPERIENCE selected"
lab var MSEPROGENGAGE_4 "MSE: participated in JOB OR COLLEGE FAIR OR TOUR selected"
lab var MSEPROGENGAGE_5 "MSE: participated in ART OR MUSIC GROUPS selected"
lab var MSEPROGENGAGE_6 "MSE: participated in YOGA OR MEDITATION selected"
lab var MSEPROGENGAGE_7 "MSE: participated in PREGNANCY AND PARENTING CLASSES selected"
lab var MSEPROGENGAGE_8 "MSE: participated in COUNSELING AND SUPPORT GROUPS selected"
lab var MSEPROGENGAGE_9 "MSE: participated in LEGAL CLINIC selected"
lab var MSEPROGENGAGE_10 "MSE: participated in OTHER selected"
lab var MSEPROGENGAGE_10_TEXT "MSE: participated in OTHER TEXT ENTRY"

lab var MSE_DROPINACCESS "MSE: Felt that drop-in services are easily accessible"
lab var MSE_SHELTERACCESS "MSE: Felt that I know how to access shelters"
lab var MSE_TXACCESS "MSE: Felt that I know how to connect to medical/mental health/SU support if needed"
lab val MSE_DROPINACCESS-MSE_TXACCESS YN_NS_LAB

lab var INCMGEN_30DAY_1 "30day income generation: WORKING FT JOB (38+ HRS/WK) selected"
lab var INCMGEN_30DAY_2 "30day income generation: WORKING MULTIPLE PT JOBS ADD UP TO 38+ HRS/WK selected"
lab var INCMGEN_30DAY_3 "30day income generation: WORKING 1+ PT JOB THAT ADD UP TO <38 HRS/WK selected"
lab var INCMGEN_30DAY_4 "30day income generation: PAID TEMP WORK selected"
lab var INCMGEN_30DAY_5 "30day income generation: WORK PAID UNDER TABLE selected"
lab var INCMGEN_30DAY_6 "30day income generation: SELLING SELF-MADE ITEMS selected"
lab var INCMGEN_30DAY_7 "30day income generation: FRIENDS selected"
lab var INCMGEN_30DAY_8 "30day income generation: RELATIVES selected"
lab var INCMGEN_30DAY_9 "30day income generation: PANHANDLING/PEOPLE GIVING YOU MONEY selected"
lab var INCMGEN_30DAY_10 "30day income generation: SOLD CLOTHING OR PERSONAL POSSESSIONS selected"
lab var INCMGEN_30DAY_11 "30day income generation: COLLECTING/SELLING BOTTLES/CANS selected"
lab var INCMGEN_30DAY_12 "30day income generation: SELLING BLOOD/PLASMA selected"
lab var INCMGEN_30DAY_13 "30day income generation: DEALING DRUGS selected"
lab var INCMGEN_30DAY_14 "30day income generation: TRADE SEX selected"
lab var INCMGEN_30DAY_15 "30day income generation: FROM AGENCY/PROGRAM LIKE FOODSTAMPS/WELFARE/GR/SSI ETC selected"
lab var INCMGEN_30DAY_16 "30day income generation: GAMBLING selected"
lab var INCMGEN_30DAY_17 "30day income generation: STEALING selected"
lab var INCMGEN_30DAY_18 "30day income generation: SELLING STOLEN GOODS selected"

lab var EMPLOY_PAIDJOBS "Current total # of paid jobs"
lab def PAIDJOB_LAB 0"0" 1"1" 2"2" 3"3" 4"4" 5"5" 6"6 or more" -99"Seen but not answered"
lab val EMPLOY_PAIDJOBS PAIDJOB_LAB

lab var EMPLOY_TTLPAIDHRS "Current total # of hours/week worked for paid jobs"
lab def PAIDHRS_LAB 1"1-5hrs" 2"6-10hrs" 3"11-15hrs" 4"16-20hrs" 5"21-25hrs" 6"26-30hrs" 7"31-35hrs" 8"36-40hrs" 9"41-45hrs" 10"46-50hrs" 11"51-55hrs" 12"56-60hrs" 13"61-65hrs" 14"66-70hrs" 15"71-75hrs" 16"76-80hrs" 17"81-85hrs" 18"86-90hrs" 19"91-95hrs" 20"96-100hrs" 21"101 or more hrs"
lab val EMPLOY_TTLPAIDHRS PAIDHRS_LAB

lab var TTLINCOME_EMPLOY "Total monthly income from all paid jobs"
lab def INCOME_LAB 1"Less than $250" 2"$251-$500" 3"$501-$750" 4"$751-$1000" 5"$1001-$1250" 6"$1251-$1500" 7"$1501-$1750" 8"$1751-$2000" 9"$2001-$2250" 10"$2251-$2500" 11"$2501-$2750" 12"$2751-$3000" 13"More than $3000"
lab val TTLINCOME_EMPLOY INCOME_LAB

lab var TTLINCOME_INFORMAL "Total monthly informal income"
lab val TTLINCOME_INFORMAL INCOME_LAB

lab var UCLA_PTSD_DISASTER "UCLAPTSD: In a disaster like earthquake/wildfire/hurricane/tornado/flood"
lab var UCLA_PTSD_ACCIDENT "UCLAPTSD: In a bad accident like serious car accident or fall"
lab var UCLA_PTSD_WAR "UCLAPTSD: In a place where a war was going on around you"
lab var UCLA_PTSD_PHYSABUSE "UCLAPTSD: Hit/punched/kicked very hard at home"
lab var UCLA_PTSD_WITNESS "UCLAPTSD: Witnessed family member being hit/punched/kicked very hard at home"
lab var UCLA_PTSD_COMMVICT "UCLAPTSD: Was beaten up/shot at/threatened to be hurt badly in school/neighborhood/town"
lab var UCLA_PTSD_COMMWIT "UCLAPTSD: Saw someone beaten up/shot at/killed"
lab var UCLA_PTSD_DEADBODY "UCLAPTSD: Saw dead body"
lab var UCLA_PTSD_SEXABUSE "UCLAPTSD: Sexual abuse"
lab var UCLA_PTSD_FAMILYVICT "UCLAPTSD: See/hear about violent death/serious injury of loved one/friend"
lab var UCLA_PTSD_INJURY "UCLAPTSD: Had a painful or scary medical treatment when very sick or badly injured"
lab var UCLA_PTSD_FORCEDSEX "UCLAPTSD: Forced to have sex with someone against your will"
lab var UCLA_PTSD_DEATH "UCLAPTSD: Someone close to you died"
lab val UCLA* YNONLY_LAB

lab var HEALTH "General self-rated health"
lab def HEALTH_LAB 1"Poor" 2"Fair" 3"Good" 4"Very good" 5"Excellent"
lab val HEALTH HEALTH_LAB

lab var CHRONICDX_0 "Physical health conditions: NEVER DIAGNOSED WITH ANY CHRONIC HEALTH CONDITIONS selected"
lab var CHRONICDX_1 "Physical health conditions: ASTHMA/CHRONIC BRONCHITIS/EMPHYSEMA/COPD/OTHER RESP. COND. selected"
lab var CHRONICDX_2 "Physical health conditions: DIABETES/HIGH BLOOD SUGAR selected"
lab var CHRONICDX_3 "Physical health conditions: HIGH BLOOD PRESSURE/HYPERTENSION selected"
lab var CHRONICDX_4 "Physical health conditions: HEART MURMUR selected"
lab var CHRONICDX_5 "Physical health conditions: HIGH/LOW CHOLESTEROL selected"
lab var CHRONICDX_6 "Physical health conditions: OBESITY selected"
lab var CHRONICDX_7 "Physical health conditions: OTHER CVD selected"
lab var CHRONICDX_8 "Physical health conditions: ANEMIA selected"
lab var CHRONICDX_9 "Physical health conditions: SEIZURES selected"
lab var CHRONICDX_10 "Physical health conditions: MIGRAINES selected"
lab var CHRONICDX_11 "Physical health conditions: SLEEP APNEA selected"
lab var CHRONICDX_12 "Physical health conditions: INSOMNIA selected"
lab var CHRONICDX_13 "Physical health conditions: HEARING IMPAIRMENT/DEAFNESS selected"
lab var CHRONICDX_14 "Physical health conditions: BLIND IN ONE OR BOTH EYES selected"
lab var CHRONICDX_15 "Physical health conditions: ARTHRITIS selected"
lab var CHRONICDX_16 "Physical health conditions: SCOLIOSIS selected"
lab var CHRONICDX_17 "Physical health conditions: SCIATICA/SCIATIC PAIN selected"
lab var CHRONICDX_18 "Physical health conditions: TUBERCULOSIS selected"
lab var CHRONICDX_19 "Physical health conditions: CANCER selected"
lab var CHRONICDX_20 "Physical health conditions: CIRRHOSIS OF THE LIVER OR PANCREATITIS selected"
lab var CHRONICDX_21 "Physical health conditions: KIDNEY DISEASE OR WEAK/FAILING KIDNEYS selected"
lab var CHRONICDX_22 "Physical health conditions: THYROID DISORDER selected"
lab var CHRONICDX_23 "Physical health conditions: SOMETHING ELSE NOT LISTED selected"
lab var CHRONICDX_22_TEXT "Physical health conditions: SOMETHING ELSE NOT LISTED TEXT ENTRY"

lab var HEALTHNEEDS_1 "Past year unmet healthcare need: VISION selected"
lab var HEALTHNEEDS_2 "Past year unmet healthcare need: ORAL/DENTAL selected"
lab var HEALTHNEEDS_3 "Past year unmet healthcare need: PREVENTATIVE HEALTHCARE/PRIMARY CARE selected"
lab var HEALTHNEEDS_4 "Past year unmet healthcare need: SEXUAL/REPRODUCTIVE HEALTHCARE selected"
lab var HEALTHNEEDS_5 "Past year unmet healthcare need: CHRONIC PAIN MANAGEMENT/CARE selected"
lab var HEALTHNEEDS_6 "Past year unmet healthcare need: PHYSICAL THERAPY/REHAB selected"
lab var HEALTHNEEDS_7 "Past year unmet healthcare need: WEIGHT MANAGEMENT selected"
lab var HEALTHNEEDS_8 "Past year unmet healthcare need: HEARING/AUDITORY HEALTHCARE selected"
lab var HEALTHNEEDS_9 "Past year unmet healthcare need: SLEEP HEALTHCARE selected"
lab var HEALTHNEEDS_10 "Past year unmet healthcare need: OTHER selected"
lab var HEALTHNEEDS_10_TEXT "Past year unmet healthcare need: OTHER TEXT ENTRY"

lab var SD_SF1 "PROMIS SD_SF1a: past 7 day sleep quality"
lab def SDSF1_LAB 1"Very good" 2"Good" 3"Fair" 4"Poor" 5"Very poor" -99"Seen but not answered"
lab val SD_SF1 SDSF1_LAB

lab var SD_SF2 "PROMIS SD_SF1a: past 7 day sleep was refreshing"
lab def SDSF2_LAB 1"Very much" 2"Quite a bit" 3"Somewhat" 4"A little bit" 5"Not at all" -99"Seen but not answered"
lab val SD_SF2 SDSF2_LAB

lab var SD_SF3 "PROMIS SD_SF1a: past 7 day had problem with sleep"
lab var SD_SF4 "PROMIS SD_SF1a: past 7 day difficulty falling asleep"
lab def SDSF34_LAB 5"Very much" 4"Quite a bit" 3"Somewhat" 2"A little bit" 1"Not at all" -99"Seen but not answered"
lab val SD_SF3-SD_SF4 SDSF34_LAB 

lab var SD_SINCE "Sleep quality compared to before housed"
lab def SD_SINCE_LAB 1"Worsened" 2"Stayed the same" 3"Improved" -99"Seen but not answered"
lab val SD_SINCE SD_SINCE_LAB

lab var ISI7SRI "ISI7: Current daytime sleep-related impairment"
lab def ISI7_LAB 0"Not at all interfering" 1"A little" 2"Somewhat" 3"Much" 4"Very much" -99"Seen but not answered"
lab val ISI7SRI ISI7_LAB

lab var ISI7SRI_SINCE "Daytime sleep-related impairment frequency compared to housed"
lab def ISI7_SINCE_LAB 1"More often, or to a greater extent than before I was housed" 2"No difference" 3"Less often, or to a lesser extent than before I was housed"
lab val ISI7SRI_SINCE ISI7_SINCE_LAB

lab var SLEEP_SAFE "How safe feel at place of sleep most of the time"
lab val SLEEP_SAFE SDSF34_LAB

lab var PHQ9_1 "PHQ9: little interest or pleasure"
lab var PHQ9_2 "PHQ9: feeling down/depressed/hopeless"
lab var PHQ9_3 "PHQ9: trouble falling asleep/staying asleep/sleeping too much"
lab var PHQ9_4 "PHQ9: feeling tired or having little energy"
lab var PHQ9_5 "PHQ9: poor appetite or overeating"
lab var PHQ9_6 "PHQ9: feeling bad about self/feelings of failure/letting family down"
lab var PHQ9_7 "PHQ9: trouble concentrating"
lab var PHQ9_8 "PHQ9: moving/speaking slowly or restless/fidgety"
lab var PHQ9_9 "PHQ9: suicidal/self-harm ideology/thoughts"
lab def PHQ9_LAB 0"Not at all" 1"Several days" 2"More than half the days" 3"Nearly every day" -99"Seen but not answered"
lab val PHQ9_1-PHQ9_9 PHQ9_LAB

lab var GAD7_1 "GAD7: feeling nervous/anxious/on-edge"
lab var GAD7_2 "GAD7: not able to stop/control worrying"
lab var GAD7_3 "GAD7: worrying too much"
lab var GAD7_4 "GAD7: having trouble relaxing"
lab var GAD7_5 "GAD7: restless/hard to sit still"
lab var GAD7_6 "GAD7: easily annoyed/irritable"
lab var GAD7_7 "GAD7: feeling afraid as if something awful might happen"
lab def GAD7_LAB 0"Not at all" 1"Several days" 2"Over half the days" 3"Nearly every day" -99"Seen but not answered"
lab val GAD7_1-GAD7_7 GAD7_LAB

lab var GAD7_8 "GAD7: Functional impairment from indicated GAD7 items"
lab def GAD7_8_LAB 0"Not difficult at all" 1"Somewhat difficult" 2"Very difficult" 3"Extremely difficult"
lab val GAD7_8 GAD7_8_LAB

lab var PTSD_1 "PTSD Screen: 30day nightmares/intrusive thoughts"
lab var PTSD_2 "PTSD Screen: 30day vigilance"
lab var PTSD_3 "PTSD Screen: 30day avoidance"
lab var PTSD_4 "PTSD Screen: 30day numbness"
lab val PTSD_1-PTSD_4 YNONLY_LAB

rename MH_DX_MH_DX_1 MHDX_ADHD
lab var MHDX_ADHD "Ever diagnosed with ADHD"
rename MH_DX_MH_DX_2 MHDX_PTSD
lab var MHDX_PTSD "Ever diagnosed with PTSD"
rename MH_DX_MH_DX_3 MHDX_ODCD
lab var MHDX_ODCD "Ever diagnosed with OPPOSITIONAL DEFIANT/CONDUCT DISORDER"
rename MH_DX_MH_DX_4 MHDX_MDD
lab var MHDX_MDD "Ever diagnosed with MAJOR DEPRESSION"
rename MH_DX_MH_DX_5 MHDX_BPD
lab var MHDX_BPD "Ever diagnosed with BIPOLAR DISORDER"
rename MH_DX_MH_DX_6 MHDX_SCHIZ
lab var MHDX_SCHIZ "Ever diagnosed with SCHIZOPHRENIA/SCHIZOAFFECTIVE DISORDER"
rename MH_DX_MH_DX_7 MHDX_ANX
lab var MHDX_ANX "Ever diagnosed with ANXIETY/PANIC DISORDER"
rename MH_DX_MH_DX_8 MHDX_PD
lab var MHDX_PD "Ever diagnosed with PERSONALITY DISORDER"
rename MH_DX_MH_DX_9 MHDX_OTHER
lab var MHDX_OTHER "Ever diagnosed with OTHER MH CONDITION(S) NOT LISTED"
lab val MHDX_ADHD-MHDX_OTHER YNONLY_LAB

rename MH_DX_OTHER MHDX_OTHER_TXT
lab var MHDX_OTHER_TXT "Other mental health conditions diagnosed with: text entry"

lab var MH_CURRENT "Past 30day extent of issues w/ mental health"

/*LABELS FOR F/U'S IN ORIGINAL VERSION: (use once appended)
lab var MH_CURRENT_ADHD "Past 30day extent of issues w/ ADHD (in original BL version only)"
lab var MH_CURRENT_PTSD "Past 30day extent of issues w/ PTSD (in original BL version only)"
lab var MH_CURRENT_MDD "Past 30day extent of issues w/ MAJOR DEPRESSION (in original BL version only)"
lab var MH_CURRENT_BPD "Past 30day extent of issues w/ BIPOLAR DISORDER (in original BL version only)"
lab var MH_CURRENT_SCHIZ "Past 30day extent of issues w/ SHIZOPHRENIA/SCHIZOAFFECTIVE DISORDER (in original BL version only)"
lab var MH_CURRENT_ANXIETY "Past 30day extent of issues w/ ANXIETY/PANIC DISORDER (in original BL version only)"
lab var MH_CURRENT_PD "Past 30day extent of issues w/ PERSONALITY DISORDER (in original BL version only)"
lab var MH_CURRENT_OTHER "Past 30day extent of issues w/ OTHER SPECIFIED MH CONDITION (in original BL version only)"
*/
lab val MH_CURRENT* SDSF34_LAB

lab var SUIC_THOUGHT "Past 12mo suicidal thoughts"
lab var SUIC_ATTEMPT "Past 12mo suicidal attempt"
lab val SUIC* YNONLY_LAB

rename MED_12MO MHC12MO_RX
lab var MHC12MO_RX "12month taken Rx for MH cond." 
rename THER_12MO MHC12MO_THER
lab var MHC12MO_THER "12month received outpatient MH care"
rename ER_12MO MHC12MO_ER
lab var MHC12MO_ER "12month emergency room treatment for MH issue"
rename HOSPIT_12MO MHC12MO_INPAT
lab var MHC12MO_INPAT "12month inpatient MH care"
rename UNMET_12MO MHC12MO_UNMET
lab var MHC12MO_UNMET "12 month unmet MH care need"
lab val MHC12MO* YNONLY_LAB

rename MHNEED_PERCEIVE MHC_NEEDCURR 
lab var MHC_NEEDCURR "Currently feel in-need of mentalhealth treatment"
lab def MHNEED_LAB 1"Yes" 0"No" 3"I am currently receiving treatment" 99"Not sure" -99"Seen but not answered"

rename DERS_SF_DERS_SF_1 DERS_SF_1
rename DERS_SF_DERS_SF_2 DERS_SF_2
rename DERS_SF_DERS_SF_6 DERS_SF_6
rename DERS_SF_DERS_SF_4 DERS_SF_4
rename DERS_SF_DERS_SF_5 DERS_SF_5
rename DERS_SF_DERS_SF_3 DERS_SF_3
rename DERS_SF_DERS_SF_8 DERS_SF_8
rename DERS_SF_DERS_SF_9 DERS_SF_9
rename DERS_SF_DERS_SF_10 DERS_SF_10
rename DERS_SF_DERS_SF_11 DERS_SF_11
rename DERS_SF_DERS_SF_12 DERS_SF_12
rename DERS_SF_DERS_SF_13 DERS_SF_13
rename DERS_SF_DERS_SF_14 DERS_SF_14
rename DERS_SF_DERS_SF_15 DERS_SF_15
rename DERS_SF_DERS_SF_16 DERS_SF_16
rename DERS_SF_DERS_SF_17 DERS_SF_17
rename DERS_SF_DERS_SF_18 DERS_SF_18
rename DERS_SF_DERS_SF_19 DERS_SF_19

lab def DERS_LAB 1"Almost never(0-10%)" 2"Sometimes (11-35%)" 3"About half of the time (36-65%)" 4"Most of the time (66-90%)" 5"Almost always (91-100%)" -99"Seen but not answered"
lab val DERS* DERS_LAB
/*dont forget to recode reverse scored items when gen sum score*/

lab var PSS_1 "Cohen perceived stress: unable to control impt things in life"
lab var PSS_2 "Cohen perceived stress: felt confident about ability to handle personal problems"
lab var PSS_3 "Cohen perceived stress: felt things going your way"
lab var PSS_4 "Cohen perceived stress: cannot overcome difficulties piling up"

lab def PSS14_LAB 0"Never" 1"Almost never" 2"Sometimes" 3"Fairly often" 4"Very often"
lab def PSS23_LAB 4"Never" 3"Almost never" 2"Sometimes" 1"Fairly often" 0"Very often"
lab val PSS_1 PSS14_LAB
lab val PSS_4 PSS14_LAB
lab val PSS_2-PSS_3 PSS23_LAB

lab var COPING_0 "Coping techniques: NONE OF THESE selected"
lab var COPING_1 "Coping techniques: CONCENTRATE AND PROBLEM SOLVE selected"
lab var COPING_2 "Coping techniques: SORT OUT IN HEAD selected"
lab var COPING_3 "Coping techniques: TRY TO NOT THINK ABOUT IT selected"
lab var COPING_4 "Coping techniques: GO TO SLEEP selected"
lab var COPING_5 "Coping techniques: GO TO SOMEONE I TRUST FOR SUPPORT selected"
lab var COPING_6 "Coping techniques: GO OFF BY SELF TO THINK selected"
lab var COPING_7 "Coping techniques: TRY TO LEARN FROM BAD EXP selected"
lab var COPING_8 "Coping techniques: USE ANGER TO GET THROUGH IT selected"
lab var COPING_9 "Coping techniques: USE DRUGS/ALCOHOL selected"
lab var COPING_10 "Coping techniques: DO HOBBY (E.G. READ/DRAW) selected"
lab var COPING_11 "Coping techniques: VALUE SELF AND NOT THINK ABOUT OTHER'S OPINIONS selected"
lab var COPING_12 "Coping techniques: REALIZE I'M STRONG AND CAN DEAL WITH IT selected"
lab var COPING_13 "Coping techniques: THINK ABOUT HOW THINGS WILL GET BETTER IN FUTURE selected"
lab var COPING_14 "Coping techniques: USE SPIRITUAL BELIEF/BELIEF IN HIGHER POWER selected"

lab var LIFESEX_BEH "lifetime biological sex(es) of sex (oral/anal/vaginal) partners"
lab def LIFESEXBEH_LAB 1"Men only" 2"Women only" 3"Both men and women" 0"I've never had sex" -99"Seen but not answered"
lab val LIFESEX_BEH LIFESEXBEH_LAB

lab var LIFESEX_PARTNUM "lifetime # of vaginal/anal sex partners"
lab def PARTNUM_LAB 0"Never have had vaginal/anal sex" 1"1" 2"2-5" 3"6-10" 4"11-20" 5"21-30" 6"31 or more" -99"Seen but not answered"
lab val LIFESEX_PARTNUM PARTNUM_LAB

lab var DESCRIBE_3MOPARTNER_0 "Describe 3mo sex partners: HAVE NOT HAD SEX IN PAST 3MO selected"
lab var DESCRIBE_3MOPARTNER_1 "Describe 3mo sex partners: SERIOUS PARTNER selected"
lab var DESCRIBE_3MOPARTNER_2 "Describe 3mo sex partners: CASUAL PARTNER selected"
lab var DESCRIBE_3MOPARTNER_3 "Describe 3mo sex partners: ONE-TIME/HOOKUP selected"
lab var DESCRIBE_3MOPARTNER_4 "Describe 3mo sex partners: OTHER selected"

rename MOSEX* SEX3MO*

lab var SEX3MO_PARTGNDR_1 "3mo sex partners gender(s): MALE selected"
lab var SEX3MO_PARTGNDR_2 "3mo sex partners gender(s): FEMALE selected"
lab var SEX3MO_PARTGNDR_3 "3mo sex partners gender(s): TRANS MALE/TRANS MAN selected"
lab var SEX3MO_PARTGNDR_4 "3mo sex partners gender(s): TRANS FEMALE/TRANS WOMAN selected"
lab var SEX3MO_PARTGNDR_5 "3mo sex partners gender(s): GENDERQUEER/GENDER NON-CONFORMING selected"
lab var SEX3MO_PARTGNDR_6 "3mo sex partners gender(s): DIFFERENT IDENTITY selected"
lab var SEX3MO_PARTGNDR_6_TEXT "3mo sex partners gender(s): DIFFERENT IDENTITY TEXT ENTRY"

lab var SEX3MO_TYPES_1 "3mo sex types: ANAL W/ CONDOM selected"
lab var SEX3MO_TYPES_2 "3mo sex types: ANAL NO CONDOM selected"
lab var SEX3MO_TYPES_3 "3mo sex types: ORAL W/ CONDOM/DAM selected"
lab var SEX3MO_TYPES_4 "3mo sex types: ORAL NO CONDOM/DAM selected"
lab var SEX3MO_TYPES_5 "3mo sex types: VAGINAL W/ CONDOM selected"
lab var SEX3MO_TYPES_6 "3mo sex types: VAGINAL NO CONDOM selected"

lab var SEX3MO_PARTNUM "3mo # of vaginal/anal sex partners"
lab val SEX3MO_PARTNUM PARTNUM_LAB

lab var SEX3MO_PARTBIOSEX "3mo sex partner(s) biological sex(es)"
lab def BIOSEX_LAB 1"Men only" 2"Women only" 3"Both men and women"
lab val SEX3MO_PARTBIOSEX BIOSEX_LAB

lab var SEX3MO_CONDOMFREQ "3mo frequency of condum use during anal/vaginal sex"
lab def SEXFREQ_LAB 0"Never" 1"Less than half the time" 2"Half the time" 3"More than half the time" 4"Every Time"
lab val SEX3MO_CONDOMFREQ SEXFREQ_LAB

lab var SEX3MO_CNTRCPTV_1 "3mo contraceptive method to prevent pregnancy: NO METHOD USED selected" 
lab var SEX3MO_CNTRCPTV_2 "3mo contraceptive method to prevent pregnancy: CONDOMS (M/F) selected" 
lab var SEX3MO_CNTRCPTV_3 "3mo contraceptive method to prevent pregnancy: BIRTH CONTROL PILLS selected" 
lab var SEX3MO_CNTRCPTV_4 "3mo contraceptive method to prevent pregnancy: BIRTH CONTROL PATCH selected" 
lab var SEX3MO_CNTRCPTV_5 "3mo contraceptive method to prevent pregnancy: IUD/IMPLANT selected" 
lab var SEX3MO_CNTRCPTV_6 "3mo contraceptive method to prevent pregnancy: PULLING OUT/WITHDRAWAL selected" 
lab var SEX3MO_CNTRCPTV_7 "3mo contraceptive method to prevent pregnancy: FERTILITY AWARENESS METHODS selected" 
lab var SEX3MO_CNTRCPTV_8 "3mo contraceptive method to prevent pregnancy: SOME OTHER METHOD selected" 
lab var SEX3MO_CNTRCPTV_99 "3mo contraceptive method to prevent pregnancy: NOT SURE selected" 
lab var SEX3MO_CNTRCPTV_9_TEXT "3mo contraceptive method to prevent pregnancy: SOME OTHER METHOD TEXT ENTRY" 

lab var SEX3MO_CNTRCPTV_FAM "3mo use app to help with fertility awareness methods"
lab val SEX3MO_CNTRCPTV_FAM YN_DK_LAB

lab var SEX3MO_CNTRCPTV_PLAN "3mo you or partner used emergency contraception/plan-b to prevent pregnancy"
lab val SEX3MO_CNTRCPTV_PLAN YN_DK_LAB

lab var SEX3MO_SUIFREQ "3mo frequency of sex under the influence of drugs/alcohol"
lab val SEX3MO_SUIFREQ SEXFREQ_LAB

lab var SEX3MO_HIVCONVO "3mo had sex w/o condom w/o first having conversation about HIV status"
lab val SEX3MO_HIVCONVO YNONLY_LAB

lab var EXCHSEX_3MO "3mo engaged in exchange sex"
lab val EXCHSEX_3MO YNONLY_LAB

lab var EXCHSEX_TYPES_1 "3mo types of exchange sex: ANAL W/ CONDOM selected"
lab var EXCHSEX_TYPES_2 "3mo types of exchange sex: ANAL NO CONDOM selected"
lab var EXCHSEX_TYPES_3 "3mo types of exchange sex: ORAL W/ CONDOM/DAM selected"
lab var EXCHSEX_TYPES_4 "3mo types of exchange sex: ORAL NO CONDOM/DAM selected"
lab var EXCHSEX_TYPES_5 "3mo types of exchange sex: VAGINAL W/ CONDOM selected"
lab var EXCHSEX_TYPES_6 "3mo types of exchange sex: VAGINAL NO CONDOM selected"

lab var EXCHSEX_3MO_FORCED "3mo forced by someone else to engage in exchange sex"
lab val EXCHSEX_3MO_FORCED YNONLY_LAB

lab var FORCEDSEX_3MO "3mo forced/pressured to have sex of any kind"
lab val FORCEDSEX_3MO YNONLY_LAB

lab var FORCEDSEXATTEMPT_3MO "3mo someone ATTEMPTED to force/pressure to have sex of any kind"
lab var FORCEDSEXATTEMPT_3MO YNONLY_LAB

lab var HIV_ST "Ever tested HIV+"
lab val HIV_ST YNONLY_LAB

lab var HIVP_WHEN "When first tested HIV+"
lab def WHEN_LAB 1"Within the past 3 months" 2"3-6 months ago" 3"6-12 months ago" 4"More than 1 year ago" -99"Seen but not answered"
lab val HIVP_WHEN WHEN_LAB

lab var HIVP_TESTLOC "Where tested when first tested HIV+"
lab def HIVTESTLOC_LAB 1"Drop-in center" 2"through shelter/housing program where i was staying" 3"Primary care provider" 4"Hospital" 5"School health clinic" 6"Community clinic" 7"Mobile testing van" 8"Home test kit" 9"Other, please specify" -99"Seen but not answered"
lab val HIVP_TESTLOC HIVTESTLOC_LAB

rename HIVP_TESTLOC_9_TEXT HIVP_TESTLOC_OTHER
lab var HIVP_TESTLOC_OTHER "Other location where first tested HIV+ TEXT ENTRY"

lab var HIVP_TX "HIV+ currently seeing doctor/going to clinic to manage HIV"
lab val HIVP_TX YNONLY_LAB

lab var HIVP_TX_WHY_1 "HIV+ why not receiving treatment: CAN MANAGE W/O DR INVOLVEMENT selected"
lab var HIVP_TX_WHY_2 "HIV+ why not receiving treatment: TOO MUCH EFFORT TO GET TO DR/CLINIC selected"
lab var HIVP_TX_WHY_3 "HIV+ why not receiving treatment: DONT TRUST DRS selected"
lab var HIVP_TX_WHY_4 "HIV+ why not receiving treatment: DONT HAVE HEALTH INSURANCE selected"
lab var HIVP_TX_WHY_5 "HIV+ why not receiving treatment: OTHER selected"
lab var HIVP_TX_WHY_5_TEXT "HIV+ why not receiving treatment: OTHER TEXT ENTRY"

lab var HIVP_MEDS "HIV+ currently taking meds"
lab val HIVP_MEDS YNONLY_LAB

lab var HIVP_MEDS_WHYNOT_1 "HIV+ why not taking meds: TOO MUCH EFFORT TO TAKE PILL EACH DAY selected"
lab var HIVP_MEDS_WHYNOT_2 "HIV+ why not taking meds: CONCERNED ABOUT SIDE EFFECTS selected"
lab var HIVP_MEDS_WHYNOT_3 "HIV+ why not taking meds: TOO DIFFICULT TO GO TO DR TO GET RX selected"
lab var HIVP_MEDS_WHYNOT_4 "HIV+ why not taking meds: DONT HAVE PLACE TO KEEP MEDS selected"
lab var HIVP_MEDS_WHYNOT_5 "HIV+ why not taking meds: THINK IT WOULD BE TOO EXPENSIVE selected"
lab var HIVP_MEDS_WHYNOT_6 "HIV+ why not taking meds: OTHER selected"
lab var HIVP_MEDS_WHYNOT_6_TEXT "HIV+ why not taking meds: OTHER text entry"

lab var HIVN_LASTTEST "HIV- last time tested"
lab def LASTTEST_LAB 1"Within the past 3 months" 2"3-6 months ago" 3"6-12 months ago" 4"More than 1 year ago" 0"Never been tested" -99"Seen but not answered"
lab val HIVN_LASTTEST LASTTEST_LAB

lab var HIVN_TESTLOC "HIV- location of last HIV test"
lab val HIVN_TESTLOC HIVTESTLOC_LAB 

lab var HIVN_GOTRESULT "HIV- did you recieve results of last HIV test"
lab val HIVN_GOTRESULT YNONLY_LAB

lab var HIVN_PTCOUNSEL "HIV- received any post-test counseling after last HIV test"
lab val HIVN_PTCOUNSEL YNONLY_LAB

lab var STI_LAST "Last time tested for STI"
lab val STI_LAST LASTTEST_LAB

lab var STI_POS_0 "Ever tested + for STI's: NEVER selected"
lab var STI_POS_1 "Ever tested + for STI's: CHLAMYDIA selected"
lab var STI_POS_2 "Ever tested + for STI's: GONORRHEA selected"
lab var STI_POS_3 "Ever tested + for STI's: SYPHILIS selected"
lab var STI_POS_4 "Ever tested + for STI's: HERPES selected"
lab var STI_POS_5 "Ever tested + for STI's: GENITAL WARTS/HPV selected"
lab var STI_POS_6 "Ever tested + for STI's: HEP B selected"
rename STI_POS_7 STI_POS_OTHER
lab var STI_POS_OTHER "Ever tested + for STI's: OTHER selected"
rename STI_POS_7_TEXT STI_POS_OTHER_TXT
lab var STI_POS_OTHER_TXT "Ever tested + for STI's: OTHER text entry"
lab var STI_POS_88 "Ever tested + for STI's: DIDNT GET TEST RESULTS selected"

lab var CHLAM_POS_LAST "Last time tested positive for CHLAMYDIA"
lab var GONO_POS_LAST "Last time tested positive for GONORRHEA"
lab var SYPH_POS_LAST "Last time tested positive for SYPHILIS"
lab var HERP_POS_LAST "Last time tested positive for HERPES"
lab var HPV_POS_LAST "Last time tested positive for GENTIAL WARTS/HPV"
lab var HEPB_POS_LAST "Last time tested positive for HEP-B"
lab var OTHER_POS_LAST "Last time tested positive for OTHER STI"
lab def STILAST_LAB 1"Within the past 3 months" 2"More than 3 months ago but less than 6 months ago" 3"More than 6 months ago" -99"Seen but not answered"
lab val CHLAM_POS_LAST-OTHER_POS_LAST STILAST_LAB

lab var HCV_LASTTEST "Last time tested for Hep-C"
lab def HCVLAST_LAB 1"Within the past 3 months" 2"More than 3 months ago but less than 6 months ago" 3"More than 6 months ago" 0"I have never been tested for Hep-C" -99"Seen but not answered"
lab val HCV_LASTTEST HCVLAST_LAB

lab var HCV_STATUS "Did you test positive for Hep-C (last time tested)"
lab def HCVSTATUS_LAB 1"Yes" 0"No" 88"I did not get my results" -99"Seen but not answered"
lab val HCV_STATUS HCVSTATUS_LAB

lab var HCV_TX "Currently receiving treatment to manage Hep-C?"
lab val HCV_TX YNONLY_LAB

lab var PREP_KNOW "How much do you know about PrEP?" 
lab def PREPKNOW_LAB 0"I have never heard of it" 1"I have heard of it, but don't know what it is" 2"I know a little bit about it" 3"I know a lot about it" -99"Seen but not answered"
lab val PREP_KNOW PREPKNOW_LAB

lab var PREP_INTEREST "Interest in PrEP"
lab def PREPINT_LAB 0"Not interersted" 1"A little interested" 2"Somewhat interested" 3"Moderately interested" 4"Very interested" -99"Seen but not answered"
lab val PREP_INTEREST PREPINT_LAB

lab var PREP_WHERELEARD_1 "Where heard about PrEP: DOCTOR selected"
lab var PREP_WHERELEARD_2 "Where heard about PrEP: ADVERTISEMENT selected"
lab var PREP_WHERELEARD_3 "Where heard about PrEP: FRIEND selected"
lab var PREP_WHERELEARD_4 "Where heard about PrEP: FAMILY MEMBER selected"
lab var PREP_WHERELEARD_5 "Where heard about PrEP: SEXUAL/ROMANTIC PARTNER selected"
lab var PREP_WHERELEARD_6 "Where heard about PrEP: INTERNET selected"
lab var PREP_WHERELEARD_7 "Where heard about PrEP: COUNSELOR/SOCIAL WORKER/CASE WORKER selected"
lab var PREP_WHERELEARD_8 "Where heard about PrEP: RESEARCH STUDY OR INTERVENTION selected"
lab var PREP_WHERELEARD_9 "Where heard about PrEP: OTHER selected"
lab var PREP_WHERELEARD_9_TEXT "Where heard about PrEP: OTHER TEXT RESPONSE"

lab var PREP_SOCIAL "Do you know anyone currently taking PrEP?"
lab val PREP_SOCIAL YNONLY_LAB

lab var PREP_SOCIAL_WHO_1 "Who do you know currently taking PrEP: FRIENDS FROM HOME/BEFORE HOMELESS selected"
lab var PREP_SOCIAL_WHO_2 "Who do you know currently taking PrEP: FRIENDS/PEERS FROM STREET OR AGENCY selected"
lab var PREP_SOCIAL_WHO_3 "Who do you know currently taking PrEP: FAMILY (BIO/FOSTER) selected"
lab var PREP_SOCIAL_WHO_4 "Who do you know currently taking PrEP: ROMANTIC/SEX PARTNER selected"
lab var PREP_SOCIAL_WHO_5 "Who do you know currently taking PrEP: CASE WORKER/SOCIAL WORKER/AGENCY STAFF/VOLUNTEER selected"
lab var PREP_SOCIAL_WHO_6 "Who do you know currently taking PrEP: PEOPLE FROM SCHOOL selected"
lab var PREP_SOCIAL_WHO_7 "Who do you know currently taking PrEP: PEOPLE FROM WORK selected"

lab var PREP_RX_EVER "Have you ever been prescribed PrEP?"
lab val PREP_RX_EVER YNONLY_LAB

lab var PREP_CURRENTLYTAKING " Are you currently taking PrEP?"
lab val PREP_CURRENTLYTAKING YNONLY_LAB

lab var PREP_BARRIERS_1 "I am not sure I would take PrEP because: I'M NOT AT RISK FOR HIV selected"
lab var PREP_BARRIERS_2 "I am not sure I would take PrEP because: DON'T REALLY UNDERSTAND PREP/KNOW ENOUGH ABOUT IT selected"
lab var PREP_BARRIERS_3 "I am not sure I would take PrEP because: DON'T LIKE ANY TYPE OF PHARM. MEDS selected"
lab var PREP_BARRIERS_4 "I am not sure I would take PrEP because: TOO MUCH EFFORT TO TAKE PILL EVERY DAY selected"
lab var PREP_BARRIERS_5 "I am not sure I would take PrEP because: CONCERNED ABOUT SIDE EFFECTS selected"
lab var PREP_BARRIERS_6 "I am not sure I would take PrEP because: TOO DIFFICULT TO GET TO DR TO GET RX selected"
lab var PREP_BARRIERS_7 "I am not sure I would take PrEP because: THINK IT WOULD BE TOO EXPENSIVE selected"
lab var PREP_BARRIERS_8 "I am not sure I would take PrEP because: USE OTHER METHODS TO PROTECT MYSELF selected"
lab var PREP_BARRIERS_9 "I am not sure I would take PrEP because: SOMETHING ELSE selected"
lab var PREP_BARRIERS_9_TEXT "I am not sure I would take PrEP because: SOMETHING ELSE TEXT ENTRY"

lab var PREG_FREQ "How many times in lifetime been pregnant or got someone pregnant"
lab var PREG_UNPLAN "# of unplanned pregnancies"
lab var PREG_CHILD "# of children"
lab var PREG_LIVE "# of children that you live with currently"
lab def PREG_LAB 0"0" 1"1" 2"2" 3"3" 4"4 or more" -99"Seen but not answered"
lab val PREG_FREQ-PREG_LIVE PREG_LAB

rename SUTYPES_USE_EVER_0 SUEVER_NONE
lab var SUEVER_NONE "Lifetime substance use: no substances used in lifetime selected"
rename SUTYPES_USE_EVER_1 SUEVER_TOB
lab var SUEVER_TOB "Lifetime substance use: tobacco selected"
rename SUTYPES_USE_EVER_2 SUEVER_ALC
lab var SUEVER_ALC "Lifetime substance use: alcohol selected"
rename SUTYPES_USE_EVER_3 SUEVER_MJ
lab var SUEVER_MJ "Lifetime substance use: marijuana selected"
rename SUTYPES_USE_EVER_4 SUEVER_METH
lab var SUEVER_METH "Lifetime substance use: meth selected"
rename SUTYPES_USE_EVER_5 SUEVER_MDMA
lab var SUEVER_MDMA "Lifetime substance use: Ecstacy/mdma/'molly' selected"
rename SUTYPES_USE_EVER_6 SUEVER_SMJ
lab var SUEVER_SMJ "Lifetime substance use: synthetic marijuana (k2, spice, fake weed) selected"
rename SUTYPES_USE_EVER_7 SUEVER_HALL
lab var SUEVER_HALL "Lifetime substance use: hallucinogens/psychedelics selected"
rename SUTYPES_USE_EVER_8 SUEVER_PDM
lab var SUEVER_PDM "Lifetime substance use: prescription drugs that were not prescribed or in higher doses than prescribed selected"
rename SUTYPES_USE_EVER_9 SUEVER_HER
lab var SUEVER_HER "Lifetime substance use: heroin selected"
rename SUTYPES_USE_EVER_10 SUEVER_COC
lab var SUEVER_COC "Lifetime substance use: cocaine (powdered) selected"
rename SUTYPES_USE_EVER_11 SUEVER_CRACK
lab var SUEVER_CRACK "Lifetime substance use: crack/freebase cocaine selected"
rename SUTYPES_USE_EVER_12 SUEVER_INHAL
lab var SUEVER_INHAL "Lifetime substance use: inhalants (sniffed/huffed glue, paint, markers, etc) selected"
rename SUTYPES_USE_EVER_13 SUEVER_STEROID
lab var SUEVER_STEROID "Lifetime substance use: steroid pills or shots without a prescription selected"
rename SUTYPES_USE_EVER_14 SUEVER_N20
lab var SUEVER_N20 "Lifetime substance use: nitrous oxide (whippets/laughing gas/hippy crack/etc) selected"
rename SUTYPES_USE_EVER_15 SUEVER_KET
lab var SUEVER_KET "Lifetime substance use: ketamine selected"
rename SUTYPES_USE_EVER_16 SUEVER_PCP
lab var SUEVER_PCP "Lifetime substance use: pcp selected"
rename SUTYPES_USE_EVER_17 SUEVER_OTHER
lab var SUEVER_OTHER "Lifetime substance use: something else not listed here selected"
rename OTHERSU_TYPE SUEVER_OTHER_TEXT
lab var SUEVER_OTHER_TEXT "Lifetime substance use: other text response"

lab def SU_LAST_LAB 1"Within the past 30 days" 2"Between 1-3 months ago" 3"More than 3 months ago" -99"Seen but not answered" 999"Missing"

lab var TOBACCO_LAST "Last time TOBACCO used"
lab val TOBACCO_LAST SU_LAST_LAB

lab var TOBACCO_TYPES_1 "30day tobacco types used: SMOKED TOBACCO selected"
lab var TOBACCO_TYPES_2 "30day tobacco types used: ECIGS/VAPED TOBACCO selected"
lab var TOBACCO_TYPES_3 "30day tobacco types used: CHEWING TOBACCO/DIP selected"
lab var TOBACCO_TYPES_4 "30day tobacco types used: SOMETHING ELSE selected"
lab var TOBACCO_TYPES_4_TEXT "30day tobacco types used: SOMETHING ELSE TEXT ENTRY"
lab var TOBACCO_SMOKEFREQ "Current tobacco smoking frequency"
lab def SMOKEFREQ_LAB 0"Not at all" 1"Less than daily" 2"Daily" 99"Don't know" -99"Seen but not answered" 999"Missing"
lab val TOBACCO_SMOKEFREQ SMOKEFREQ_LAB

lab var TOBACCO_DAILYAMT_1 "Avg daily # MANUFACTURED CIGARETTES smoked"
lab var TOBACCO_DAILYAMT_2 "Avg daily # HAND-ROLLED CIGARETTES smoked"
lab var TOBACCO_DAILYAMT_3 "Avg daily # KRETEKS/CLOVE CIGARETTES smoked"
lab var TOBACCO_DAILYAMT_4 "Avg daily # PIPES FULL OF TOBACCO smoked"
lab var TOBACCO_DAILYAMT_5 "Avg daily # CIGARS/CIGARILLOS/CHEROOTS smoked"
lab var TOBACCO_DAILYAMT_6 "Avg daily # WATER PIPE/HOOKAH SESSIONS smoked"
lab var TOBACCO_DAILYAMT_7 "TEXT ENTRY of TYPE of other daily smoked tobacco product"
lab var TOBACCO_DAILYAMT_8 "Avg daily # SPECIFIED OTHER TOBACCO PRODUCT smoked"

lab var TOBACCO_WEEKLYAMT_1 "Avg weekly # MANUFACTURED CIGARETTES smoked"
lab var TOBACCO_WEEKLYAMT_2 "Avg weekly # HAND-ROLLED CIGARETTES smoked"
lab var TOBACCO_WEEKLYAMT_3 "Avg weekly # KRETEKS/CLOVE CIGARETTES smoked"
lab var TOBACCO_WEEKLYAMT_4 "Avg weekly # PIPES FULL OF TOBACCO smoked"
lab var TOBACCO_WEEKLYAMT_5 "Avg weekly # CIGARS/CIGARILLOS/CHEROOTS smoked"
lab var TOBACCO_WEEKLYAMT_6 "Avg weekly # WATER PIPE/HOOKAH SESSIONS smoked"
lab var TOBACCO_WEEKLYAMT_7 "TEXT ENTRY of TYPE of other weekly smoked tobacco product"
lab var TOBACCO_WEEKLYAMT_8 "Avg weekly # SPECIFIED OTHER TOBACCO PRODUCT smoked"

lab var TOBACCO_SMOKELESSFRE "Current smokeless/vapeless tobacco use frequency"
lab val TOBACCO_SMOKELESSFRE SMOKEFREQ_LAB 

rename TOBACCO_VEPFREQ TOBACCO_VAPEFREQ
lab var TOBACCO_VAPEFREQ "Current ecig/vaped tobacco use frequency"
lab val TOBACCO_VAPEFREQ SMOKEFREQ_LAB

lab var ALC_LAST "Last time ALCOHOL used"
lab val ALC_LAST SU_LAST_LAB
lab var ALC_30 "Days used ALCOHOL in last 30 days"
lab var ALC_30_BINGE_F "Days BINGE DRANK ALCOHOL in last 30 days if FEMALE (4 or more drinks in <2hrs)"
lab var ALC_30_BINGE_M "Days BINGE DRANK ALCOHOL in last 30 days if MALE (5 or more drinks in <2hrs)"

lab var MARJ_LAST "Last time MARIJUANA used"
lab val MARJ_LAST SU_LAST_LAB
lab var MARJ_30 "Days used MARIJUANA in last 30 days"
lab var MARJ_30_TYPES_1 "Types of marijuana used in last 30 days: DRIED PLANT MATERIAL selected"
lab var MARJ_30_TYPES_2 "Types of marijuana used in last 30 days: CONCENTRATES selected"
lab var MARJ_30_TYPES_3 "Types of marijuana used in last 30 days: EDIBLES/DRINKABLES selected"
lab var MARJ_30_TYPES_4 "Types of marijuana used in last 30 days: SPRAY/DROPS selected"
lab var MARJ_30_TYPES_5 "Types of marijuana used in last 30 days: OTHER selected"
lab var MARJ_30_TYPES_2_TEXT "Types of marijuana used in last 30 days: OTHER TEXT RESPONSE"
lab var MARJ_30_ROA_1 "30day marijuana ROA: SMOKED PIPE selected"
lab var MARJ_30_ROA_2 "30day marijuana ROA: SMOKED WATERPIPE selected"
lab var MARJ_30_ROA_3 "30day marijuana ROA: SMOKED JOINT selected"
lab var MARJ_30_ROA_4 "30day marijuana ROA: SMOKED BLUNT selected"
lab var MARJ_30_ROA_5 "30day marijuana ROA: SMOKED SPLIFF selected"
lab var MARJ_30_ROA_6 "30day marijuana ROA: VAPED CANNABIS PLANT selected"
lab var MARJ_30_ROA_7 "30day marijuana ROA: CONCENTRATES: VAPE PEN selected"
lab var MARJ_30_ROA_8 "30day marijuana ROA: CONCENTRATES: DABS selected"
lab var MARJ_30_ROA_9 "30day marijuana ROA: SWALLOWED edible/drinkable selected"
lab var MARJ_30_ROA_10 "30day marijuana ROA: OTHER selected"
lab var MARJ_30_ROA_11_TEXT "30day marijuana ROA: OTHER TEXT ENTRY"

lab var MARJ_FREQ_CURR "Current marj use frequency"
lab def MARJ_FREQ_LAB 1"Once a month or less" 2"Once a week" 3"Once every few days" 4"Once a day, every day" 5"Multiple times a day, every day" -99"Seen but not answered"
lab val MARJ_FREQ_CURR MARJ_FREQ_LAB

lab var MARJ_HPD30D "30day average # of hits of MJ/day"

lab var MARJ_FREQACCPT "Self-reported 'acceptable' amount of marijuana use for self"
lab val MARJ_FREQACCPT MARJ_FREQ_LAB
/*NOTE: just noticed that MARJ_FREQACCPT does not have a response option for not at all! Do we change it to add a response now? Or is it too late?*/
rename MARJ_AMTWK_1 MARJ_AMTWK_PLNT
lab var MARJ_AMTWK_PLNT "Approx amt of MARIJUANA PLANT MATERIAL used per week over past 30days"
lab def MARJPLNTAMT_LAB 1"None" 2"Less than 1/8oz (3.5g)" 3"Between 1/8-1/2oz (3.5-14g)" 4"Between 1/2-1oz (14-27g)" 5"More than 1oz (28g)" -99"Seen but not answered"
lab val MARJ_AMTWK_PLNT MARJPLNTAMT_LAB
rename MARJ_AMTWK_2 MARJ_AMTWK_CONC
lab var MARJ_AMTWK_CONC "Approx amt of MARIJUANA CONCENTRATES used per week over past 30days"
lab def MARJCONCAMT_LAB 1"None" 2"Less than 0.5 grams" 3"0.5-1 gram" 4"1-2 grams" 5"More than 2 grams" -99"Seen but not answered"
lab val MARJ_AMTWK_CONC MARJCONCAMT_LAB

lab var MARJ_ACCESS_1 "30day marijuana source: I BOUGHT FROM MEDICAL DISPENSARY STOREFRONT selected"
lab var MARJ_ACCESS_2 "30day marijuana source: I BOUGHT FROM MEDICAL DELIVERY SERVICE selected"
lab var MARJ_ACCESS_3 "30day marijuana source: DRUG DEALER BOUGHT FROM MEDICAL DISPENSARY OR DELIVERY selected"
lab var MARJ_ACCESS_4 "30day marijuana source: FRIEND BOUGHT FROM MEDICAL DISPENSARY OR DELIVERY selected"
lab var MARJ_ACCESS_5 "30day marijuana source: FAMILY MEMBER BOUGHT FROM MEDICAL DISPENSARY OR DELIVERY selected"
lab var MARJ_ACCESS_6 "30day marijuana source: OTHER PERSON OBTAINED FROM OTHER PLACE (NOT MEDICAL DISPENSARY/DELIVERY) selected"
lab var MARJ_ACCESS_7 "30day marijuana source: I GREW MY OWN PLANTS selected"

lab var MARJ_CARD "Have a medical marijuana recommendation/card from doctor"
lab val MARJ_CARD YNONLY_LAB

lab var METH_LAST "Last time METH used"
lab val METH_LAST SU_LAST_LAB
lab var METH_30 "Days used METH in last 30 days"
lab var METH_30_ROA_1 "30day meth ROA: SMOKED selected"
lab var METH_30_ROA_2 "30day meth ROA: SNORTED selected"
lab var METH_30_ROA_3 "30day meth ROA: INJECTED selected"
lab var METH_30_ROA_4 "30day meth ROA: SWALLOWED selected"
lab var METH_30_ROA_5 "30day meth ROA: OTHER selected"

lab var MDMA_LAST "Last time MDMA used"
lab val MDMA_LAST SU_LAST_LAB
lab var MDMA_30 "Days used MDMA in last 30 days"
lab var MDMA_30_ROA_2 "30day MDMA ROA: SNORTED selected"
lab var MDMA_30_ROA_3 "30day MDMA ROA: INJECTED selected"
lab var MDMA_30_ROA_4 "30day MDMA ROA: SWALLOWED selected"
lab var MDMA_30_ROA_5 "30day MDMA ROA: OTHER selected"

lab var SYNTHMJ_LAST "Last time used SYNTHETIC MARIJUANA"
lab val SYNTHMJ_LAST SU_LAST_LAB
lab var SYNTHMJ_30 "Days used SYNTHETIC MARIJUANA in last 30 days"

lab var HALLUC_LAST "Last time used HALLUCINOGENS/PSYCHEDELICS"
lab val HALLUC_LAST SU_LAST_LAB
lab var HALLUC_30 "Days used HALLUCINOGENS/PSYCHEDELICS in last 30 days"
lab var HALLUC_30_TYPES_1 "30day hallucinogen/psychedelic types used: LSD selected"
lab var HALLUC_30_TYPES_2 "30day hallucinogen/psychedelic types used: MUSHROOMS selected"
lab var HALLUC_30_TYPES_3 "30day hallucinogen/psychedelic types used: DMT selected"
lab var HALLUC_30_TYPES_4 "30day hallucinogen/psychedelic types used: PEYOTE selected"
lab var HALLUC_30_TYPES_5 "30day hallucinogen/psychedelic types used: OTHER selected"
lab var HALLUC_30_TYPES_5_TEXT "30day hallucinogen/psychedelic types used: OTHER TEXT ENTRY"

lab var PDM_LAST "Last time PRESCRIPTION DRUG MISUSE occurred"
lab val PDM_LAST SU_LAST_LAB
lab var PDM_30 "Days used PDM in last 30 days"
lab var PDM_30_ROA_1 "30day PDM ROA: SMOKED selected"
lab var PDM_30_ROA_2 "30day PDM ROA: SNORTED selected"
lab var PDM_30_ROA_3 "30day PDM ROA: INJECTED selected"
lab var PDM_30_ROA_4 "30day PDM ROA: SWALLOWED selected"
lab var PDM_30_ROA_5 "30day PDM ROA: OTHER selected"
lab var PDM_30_TYPES_1 "30day PDM types used: STIMULANTS selected"
lab var PDM_30_TYPES_2 "30day PDM types used: SEDATIVES selected"
lab var PDM_30_TYPES_3 "30day PDM types used: OPIOIDS selected"
lab var PDM_30_TYPES_4 "30day PDM types used: SOMETHING ELSE NOT LISTED selected"
lab var PDM_30_TYPES_4_TEXT "30day PDM types used: SOMETHING ELSE TEXT ENTRY"

lab var HEROIN_LAST "Last time HEROIN used"
lab val HEROIN_LAST SU_LAST_LAB
lab var HEROIN_30 "Days used HEROIN in last 30 days"
lab var HEROIN_30_ROA_1 "30day heroin ROA: SMOKED selected"
lab var HEROIN_30_ROA_2 "30day heroin ROA: SNORTED selected"
lab var HEROIN_30_ROA_3 "30day heroin ROA: INJECTED selected"
lab var HEROIN_30_ROA_5 "30day heroin ROA: OTHER selected"

lab var COCAINE_LAST "Last time POWDERED COCAINE used"
lab val COCAINE_LAST SU_LAST_LAB
lab var COCAINE_30 "Days used POWDERED COCAINE in last 30 days"
lab var COCAINE_30_ROA_1 "30day cocaine ROA: SMOKED selected"
lab var COCAINE_30_ROA_2 "30day cocaine ROA: SNORTED selected"
lab var COCAINE_30_ROA_3 "30day cocaine ROA: INJECTED selected"
lab var COCAINE_30_ROA_4 "30day cocaine ROA: ORALLY (SWALLOWED/CHEWED/RUBBED ON GUMS) selected"
lab var COCAINE_30_ROA_5 "30day cocaine ROA: OTHER selected"

lab var CRACK_LAST "Last time FREEBASE COCAINE/CRACK used"
lab val CRACK_LAST SU_LAST_LAB
lab var CRACK_30 "Days used FREEBASE COCAINE/CRACK in last 30 days"
lab var CRACK_30_ROA_1 "30day crack/freebase ROA: SMOKED selected"
lab var CRACK_30_ROA_2 "30day crack/freebase ROA: SNORTED selected"
lab var CRACK_30_ROA_3 "30day crack/freebase ROA: INJECTED selected"
lab var CRACK_30_ROA_5 "30day crack/freebase ROA: OTHER selected"

lab var INHAL_LAST "Last time INHALANTS used"
lab val INHAL_LAST SU_LAST_LAB
lab var INHAL_30 "Days used INHALANTS in last 30 days"

lab var STEROID_LAST "Last time STEROIDS W/O RX used"
lab val STEROID_LAST SU_LAST_LAB
lab var STEROID_30 "Days used STEROIDS W/O RX in last 30 days"
lab var STEROID_30_ROA_3 "30day steroid ROA: INJECTED selected"
lab var STEROID_30_ROA_4 "30day steroid ROA: SWALLOWED selected"
lab var STEROID_30_ROA_5 "30day steroid ROA: OTHER selected"

lab var NITROUS_LAST "Last time NITROUS OXIDE used"
lab val NITROUS_LAST SU_LAST_LAB
lab var NITROUS_30 "Days used NITROUS OXIDE in last 30 days"

lab var KETA_LAST "Last time KETAMINE used"
lab val KETA_LAST SU_LAST_LAB
lab var KETA_30 "Days used KETAMINE in last 30 days"

lab var PCP_LAST "Last time PCP used"
lab val PCP_LAST SU_LAST_LAB
lab var PCP_30 "Days used PCP in last 30 days"
lab var PCP_30_ROA_1 "30day PCP ROA: SMOKED selected"
lab var PCP_30_ROA_2 "30day PCP ROA: SNORTED selected"
lab var PCP_30_ROA_3 "30day PCP ROA: INJECTED selected"
lab var PCP_30_ROA_4 "30day PCP ROA: SWALLOWED selected"
lab var PCP_30_ROA_5 "30day PCP ROA: OTHER selected"

lab var OTHERSU_LAST "Last time OTHER SPECIFIED SUBSTANCE used"
lab val OTHERSU_LAST SU_LAST_LAB
lab var OTHERSU_30 "Days used OTHER SPECIFIED SUBSTANCE in last 30 days"
lab var OTHERSU_30_ROA_1 "30day OTHER SPECIFIED SUBSTANCE ROA: SMOKED selected"
lab var OTHERSU_30_ROA_2 "30day OTHER SPECIFIED SUBSTANCE ROA: SNORTED selected"
lab var OTHERSU_30_ROA_3 "30day OTHER SPECIFIED SUBSTANCE ROA: INJECTED selected"
lab var OTHERSU_30_ROA_4 "30day OTHER SPECIFIED SUBSTANCE ROA: SWALLOWED selected"
lab var OTHERSU_30_ROA_5 "30day OTHER SPECIFIED SUBSTANCE ROA: OTHER selected"
lab var OTHERSU_30_ROA_5_TEXT "30day OTHER SPECIFIED SUBSTANCE ROA: OTHER TEXT ENTRY"

rename IVDU_NEEDLEEXH IVDU_NEEDLEEXCH
lab var IVDU_NEEDLEEXCH "Ever used needle exchange/clean needle program"
lab val IVDU_NEEDLEEXCH YNONLY_LAB
lab var IVDU_NEEDLEPURCH "Ever purchased clean needles from non-doctor/medical professional"
lab val IVDU_NEEDLEPURCH YNONLY_LAB

lab var EXCH_30DAYS "Used needle exchange/clean needle program in last 30 days"
lab val EXCH_30DAYS YNONLY_LAB
lab var EXCH_WHERE_1 "Where accessed clean needles/exchange ever: MOBILE CLINIC selected"
lab var EXCH_WHERE_2 "Where accessed clean needles/exchange ever: HOSPITAL selected"
lab var EXCH_WHERE_3 "Where accessed clean needles/exchange ever: PUBLIC HEALTH CENTER selected"
lab var EXCH_WHERE_4 "Where accessed clean needles/exchange ever: FREE HEALTH CLINIC selected"
lab var EXCH_WHERE_5 "Where accessed clean needles/exchange ever: DROP-IN CENTER selected"
lab var EXCH_WHERE_6 "Where accessed clean needles/exchange ever: HEALTH CENTER/APPT FOR HIV/HEP-C selected"
lab var EXCH_WHERE_7 "Where accessed clean needles/exchange ever: OTHER selected"
lab var EXCH_WHERE_7_TEXT "Where accessed clean needles/exchange ever: OTHER TEXT RESPONSE"

lab var IVDU_EVER "Illegal injection drug use EVER"
lab val IVDU_EVER YNONLY_LAB

lab var IVDU_30DAY "30day # times injected illegal drugs"
lab def IVDU_30DAY_LAB 0"0 times" 1"1 time" 2"2-3 times" 3"4-5 times" 4"More than 5 times" -99"Seen but not answered"
lab val IVDU_30DAY IVDU_30DAY_LAB

lab var IVDU_SHARE "Shared needle in past 30 days"
lab val IVDU_SHARE YNONLY_LAB

lab var IVDU_REUSE "Ever re-use same needle for >1 injection in past 30 days"
lab val IVDU_REUSE YNONLY_LAB

lab var IVDU_REUSE_QUANT "Approx # injections re-used same needle during time when used most"
lab def IVDU_REUSEQUANT_LAB 1"2 times" 2"3-5 times" 3"6 or more times"
lab val IVDU_REUSE_QUANT IVDU_REUSEQUANT_LAB

lab var SUTX_EVER "Received treatment/counseling for alcohol/drug use EVER"
lab val SUTX_EVER YNONLY_LAB

rename SYTX_PASTYEAR SUTX_PASTYEAR
lab var SUTX_PASTYEAR "Received treatment/counseling for alcohol/drug use IN PAST YEAR"
lab val SUTX_PASTYEAR YNONLY_LAB

lab var CAGE2 "ANNOYED by others criticizing alcohol/drug use"
lab var CAGE1 "feel that I ought to CUT DOWN on alcohol/drug use"
lab var CAGE3 "feel bad or GUILTY about alcohol/drug use"
lab var CAGE4 "(EYE-OPENER) felt need to drink/use drugs first thing in the morning"
lab val CAGE2-CAGE4 YNONLY_LAB
egen CAGESCORE = rowtotal(CAGE2-CAGE4), missing
order CAGESCORE, after(CAGE4)
gen CAGE_CLIN=. 
replace CAGE_CLIN=1 if CAGESCORE >= 2 & CAGESCORE != .
replace CAGE_CLIN=0 if CAGESCORE == 0 | CAGESCORE == 1
lab var CAGE_CLIN "Clinically significant cage score (2 or greater)"


rename SUCOST_30D_ALCOHOL SUCOST_30D_ALC
lab var SUCOST_30D_ALC "30day amt spent on alcohol"
lab def SUCOST_LAB 1"Less than $50 (allows text entry)" 2"$51-$250" 3"$251-$500" 4"$501-750" 5"$751-$1000" 6"$1001-$1250" 7"$1251-$1500" 8"$1501-$1750" 9"$1751-$2000" 10"$2001-$2250" 11"$2251-$2500" 12"$2501-$2750" 13"$2751-$3000" 14"More than $3000" -99"Seen but not answered"
lab val SUCOST_30D_ALC SUCOST_LAB
rename SUCOST_30D_ALCOHOL_1_TEXT SUCOST_30D_ALC_UND50TXT
lab var SUCOST_30D_ALC_UND50TXT "Less than $50 text response"

lab var SUCOST_30D_MARJ "30day amt spent on marijuana"
lab val SUCOST_30D_MARJ SUCOST_LAB
rename SUCOST_30D_MARJ_X1_TEXT SUCOST_30D_MARJ_UND50TXT
lab var SUCOST_30D_MARJ_UND50TXT "Less than $50 text response"

lab var SUCOST_30D_ILDRUG "30day amt spent on illegal drugs"
lab val SUCOST_30D_ILDRUG SUCOST_LAB
rename SUCOST_30D_ILDRUG_XX1_TEXT SUCOST_30D_ILDRUG_UND50TXT
lab var SUCOST_30D_ILDRUG_UND50TXT "Less than $50 text response"

lab var TECHACCESS_0 "Personally own: NONE selected"
lab var TECHACCESS_1 "Personally own: SMARTPHONE selected"
lab var TECHACCESS_2 "Personally own: (NON-SMART) CELL PHONE selected"
lab var TECHACCESS_3 "Personally own: DESKTOP/LAPTOP COMPUTER selected"
lab var TECHACCESS_4 "Personally own: TABLET selected"

lab var TECH_ACCESS_NOOWN_0 "Access to but don't own: NONE selected"
lab var TECH_ACCESS_NOOWN_1 "Access to but don't own: SMARTPHONE selected"
lab var TECH_ACCESS_NOOWN_2 "Access to but don't own: (NON-SMART) CELL PHONE selected"
lab var TECH_ACCESS_NOOWN_3 "Access to but don't own: DESKTOP/LAPTOP COMPUTER selected"
lab var TECH_ACCESS_NOOWN_4 "Access to but don't own: TABLET selected"

lab var TECH_ACCESS_WHERE_1 "Location where access non-owned tech: YOUTH SERVICE AGENCY selected"
lab var TECH_ACCESS_WHERE_2 "Location where access non-owned tech: PUBLIC LIBRARY selected"
lab var TECH_ACCESS_WHERE_3 "Location where access non-owned tech: WHERE I'M STAYING selected"
lab var TECH_ACCESS_WHERE_4 "Location where access non-owned tech: BORROWED FROM FRIEND selected"
lab var TECH_ACCESS_WHERE_5 "Location where access non-owned tech: SCHOOL selected"
lab var TECH_ACCESS_WHERE_6 "Location where access non-owned tech: WORK selected"
lab var TECH_ACCESS_WHERE_7 "Location where access non-owned tech: INTERNET CAFE selected"
lab var TECH_ACCESS_WHERE_8 "Location where access non-owned tech: OTHER selected"
lab var TECH_ACCESS_WHERE_8_TEXT "Location where access non-owned tech: OTHER TEXT ENTRY"

lab var CELL_PLAN "Type of cell phone plan"
lab def CELL_PLAN_LAB 1"I buy minutes" 2"I have a bill each month" 3"I'm on a shared plan, and pay my part" 4"Someone else pays for my cell phone bill"
lab val CELL_PLAN CELL_PLAN_LAB

lab var CELL_BILL_1 "Who pays your cellphone bill: I DO selected"
lab var CELL_BILL_2 "Who pays your cellphone bill: MY PARENT selected"
lab var CELL_BILL_3 "Who pays your cellphone bill: MY BOYFRIEND/GIRLFRIEND/SIGNIFICANT OTHER selected"
lab var CELL_BILL_4 "Who pays your cellphone bill: MY BOSS selected"
lab var CELL_BILL_5 "Who pays your cellphone bill: MY FRIEND selected"
lab var CELL_BILL_6 "Who pays your cellphone bill: MY BROTHER/SISTER selected"
lab var CELL_BILL_7 "Who pays your cellphone bill: ANOTHER FAMILY MEMBER selected"
lab var CELL_BILL_8 "Who pays your cellphone bill: OTHER selected"
rename CELL_BILL_6_TEXT CELL_BILL_OTHER1TXT
rename CELL_BILL_7_TEXT CELL_BILL_OTHER2TXT
lab var CELL_BILL_OTHER1TXT "Who pays your cellphone bill: ANOTHER FAMILY MEMBER TEXT ENTRY"
lab var CELL_BILL_OTHER2TXT "Who pays your cellphone bill: OTHER TEXT ENTRY"

lab var CELL_TURNOVER "# phones in past year"
lab def CELL_TURNOVER_LAB 1"1" 2"2" 3"3" 4"4" 5"5" 6"More than 5"
lab val CELL_TURNOVER CELL_TURNOVER_LAB

lab var CEL_USE_1 "How do you use your phone: CALL/TEXT FRIENDS selected"
lab var CEL_USE_2 "How do you use your phone: CALL/TEXT FAMILY selected"
lab var CEL_USE_3 "How do you use your phone: CHECK/WRITE EMAIL selected"
lab var CEL_USE_4 "How do you use your phone: BROWSE INTERNET selected"
lab var CEL_USE_5 "How do you use your phone: LOOK FOR SUPPORT SERVICES selected"
lab var CEL_USE_6 "How do you use your phone: LOOK FOR EMPLOYMENT selected"
lab var CEL_USE_7 "How do you use your phone: CHECK SOCIAL MEDIA selected"
lab var CEL_USE_8 "How do you use your phone: USE DATING APP selected"
lab var CEL_USE_9 "How do you use your phone: LOOK UP DIRECTIONS/TRANSPORTATION OPTIONS selected"
lab var CEL_USE_10 "How do you use your phone: LISTEN TO MUSIC selected"
lab var CEL_USE_11 "How do you use your phone: STREAM/WATCH VIDEOS selected"
lab var CEL_USE_12 "How do you use your phone: MAKE EMERGENCY PHONE CALLS ONLY selected"
lab var CEL_USE_13 "How do you use your phone: OTHER selected"
lab var CEL_USE_13_TEXT "How do you use your phone: OTHER TEXT ENTRY"

lab var CELL_CHARGE "Ever have trouble accessing electricity to charge phone"
lab val CELL_CHARGE YNONLY_LAB

lab var CELL_CHARGE_ACCESS_1 "Access to electricity: YOUTH SERVICE AGENCY selected"
lab var CELL_CHARGE_ACCESS_2 "Access to electricity: PUBLIC LIBRARY selected"
lab var CELL_CHARGE_ACCESS_3 "Access to electricity: MY PLACE OF STAY selected"
lab var CELL_CHARGE_ACCESS_4 "Access to electricity: FRIEND OR SOMEONE'S APARTMENT/HOUSE selected"
lab var CELL_CHARGE_ACCESS_5 "Access to electricity: FAMILY MEMBER OR RELATIVE'S APARTMENT/HOUSE selected"
lab var CELL_CHARGE_ACCESS_6 "Access to electricity: PUBLIC SPACE WITH WIFI ACCESS selected"
lab var CELL_CHARGE_ACCESS_7 "Access to electricity: SCHOOL selected"
lab var CELL_CHARGE_ACCESS_8 "Access to electricity: WORK selected"
lab var CELL_CHARGE_ACCESS_9 "Access to electricity: POWER OUTLET ON OUTSIDE OF BUILDING selected"
lab var CELL_CHARGE_ACCESS_77 "Access to electricity: I DO NOT NEED ELECTRICITY selected"

lab var TECH_BARRIERS_1 "Owning phone would make life easier b/c: KEEP IN TOUCH W/ FRIENDS selected"
lab var TECH_BARRIERS_2 "Owning phone would make life easier b/c: KEEP IN TOUCH W/ FAMILY selected"
lab var TECH_BARRIERS_3 "Owning phone would make life easier b/c: FIND SUPPORT SERVICES selected"
lab var TECH_BARRIERS_4 "Owning phone would make life easier b/c: FIND EMPLOYMENT selected"
lab var TECH_BARRIERS_5 "Owning phone would make life easier b/c: DATE/MEET PEOPLE selected"
lab var TECH_BARRIERS_6 "Owning phone would make life easier b/c: NAVIGATION/TRANSPORTATION OPTIONS/TIMES selected"
lab var TECH_BARRIERS_7 "Owning phone would make life easier b/c: LISTEN TO MUSIC selected"
lab var TECH_BARRIERS_8 "Owning phone would make life easier b/c: WATCH VIDEOS selected"
lab var TECH_BARRIERS_9 "Owning phone would make life easier b/c: ACCESS EMERGENCY SERVICES selected"
lab var TECH_BARRIERS_10 "Owning phone would make life easier b/c: OTHER selected"
lab var TECH_BARRIERS_10_TEXT "Owning phone would make life easier b/c: OTHER TEXT ENTRY"

lab var VICT_ROBBERY "Experienced robbery since homeless"
lab val VICT_ROBBERY YNONLY_LAB

rename VICT_IPV_VIC VICT_IPV
lab var VICT_IPV "VICTIM of intimate partner violence since homeless"
lab def VICT_IPV_LAB 0"No" 1"Yes" 99"Have not been in relationship during this time period"
lab val VICT_IPV VICT_IPV_LAB

rename VICT_IPV_PERP PERP_IPV
lab var PERP_IPV "PERPETRATED intimate partner violence since homeless"
lab var VICT_ASSLT "VICTIM of physical assault (non-IPV)"
lab var PERP_ASSLT "PERPETRATED physical assault"

rename GANG_CUR GANG_CURFMR
rename GANG_FMR GANG_CURACTV
lab var GANG_CURFMR "Current or former member of a gang"
lab var GANG_CURACTV "Currently active member of a gang"
lab val PERP_IPV-GANG_CURACTV YNONLY_LAB

lab var GANG_AGE_1 "Age first joined a gang"

lab var GANG_AFF_0 "Not in gang; NO ONE IMPORTANT IN LIFE IS GANG MEMBER"
lab var GANG_AFF_1 "Not in gang; CLOSE FRIEND is in gang selected"
lab var GANG_AFF_2 "Not in gang; FAMILY MEMBER is in gang selected"
lab var GANG_AFF_3 "Not in gang; ROMANTIC/INTIMATE PARTNER is in gang selected"
lab var GANG_AFF_4 "Not in gang; OTHER is in gang selected"
lab var GANG_AFF_4_TEXT "Not in gang; OTHER TEXT ENTRY is gang member"

lab var STREETFAMILY "Not in gang; in a STREET FAMILY?"
lab val STREETFAMILY YNONLY_LAB

lab var POLICEINTGEN "In general, how do you view interactions you've had with law enforcement"
lab def POLICELIKERT_LAB 1"Very negative" 2"Negative" 3"Somewhat negative" 4"Neither positive or negative" 5"Somewhat positive" 6"Positive" 7"Very positive" -99"Seen but not answered"
lab val POLICEINTGEN POLICELIKERT_LAB

lab var POLICEINT_3MO "3month approx # of interactions w/ law enforcement"
lab def POLICEINT_LAB 0"0 times" 1"1-2 times" 2"3-5 times" 3"5-7 times" 4"8-10 times" 5"10 times or more" -99"Seen but not answered"
lab val POLICEINT_3MO POLICEINT_LAB

lab var POLICEIN_3MO_EXP "3mo experience when interacting w/ law enforcement"
lab val POLICEIN_3MO_EXP POLICELIKERT_LAB

lab var POLICEIN_3MO_WHY_1 "Contexts of police interaction in past 3mo: CALLED FOR SOMEONE ELSE selected"
lab var POLICEIN_3MO_WHY_2 "Contexts of police interaction in past 3mo: CALLED FOR MYSELF selected"
lab var POLICEIN_3MO_WHY_3 "Contexts of police interaction in past 3mo: STOPPED FOR SUSPECTED CRIME selected"
lab var POLICEIN_3MO_WHY_4 "Contexts of police interaction in past 3mo: STOPPED FOR NO APPARENT REASON selected"
lab var POLICEIN_3MO_WHY_5 "Contexts of police interaction in past 3mo: STOPPED BECAUSE OF WHO I AM selected"
lab var POLICEIN_3MO_WHY_6 "Contexts of police interaction in past 3mo: OTHER selected"

lab var AVOIDPOLICE "Purposely avoid areas/situations w/ police/law enforcement?"
lab val AVOIDPOLICE YNONLY_LAB

lab def CASEY_LAB 1"No" 2"Mostly no" 3"Somewhat" 4"Mostly yes" 5"Yes"
lab var CASEY_LOCUSCONTROL "I believe I can influence how my life will turn out"
lab var CASEY_FUTURETHINK "I can describe my vision for myself as a successful adult"
lab var CASEY_RELATIONSHIPS "I have a good relationship with a trusted adult I like and respect"
lab var CASEY_MODELING "I would like to use my experience to help other youth"
lab var CASEY_SUCCESSREL "I believe my relationships with others will help me succeed"
lab var CASEY_TRANSITION "I feel I am ready for the next phase of my life"
lab var CASEY_PRIDE "Most days, I am proud of the way I am living my life"
lab var CASEY_SELFEFFICACY "Most days, I feel I have control of how my life will turn out"
lab val CASEY* CASEY_LAB

rename Q524 INTERVIEWNOTE
lab var INTERVIEWNOTE "Any special notes/circumstances that need to reported from this interview?"
lab val INTERVIEWNOTE YNONLY_LAB

rename Q524_1_TEXT INTERVIEWNOTE_TEXT
lab var INTERVIEWNOTE_TEXT "Interview special note(s)/circumstance(s): text entry"

drop Q525

/*Delete all test responses*/
drop if RESPONSEID == "R_3dLBmeVaJN1KDsD" | RESPONSEID == "R_3HRMuFtiDaFj7RD" | RESPONSEID == "R_1Q9lqUXMprXCHUH"

//append data from original version (cleaned)
append using "U:\Log My Life Study\Survey Data\Qualtrics Data Exports\Baseline\Version_Copy (edits 2017-05-30)\Cleaned 5-30-17 version dataset ready to merge.dta", nolabel force


/*Recode incorrect PIDs: 1 of 2 1024's to 2017; 2 BL onlys to 4008 and 4016; 1 of 2 1034's to 1036*/
replace PID = 2017 if RESPONSEID == "R_1GUHNGNcf1AYuJY"
replace PID = 4008 if RESPONSEID == "R_1exDzqYGNb34xQq"
replace PID = 4016 if RESPONSEID == "R_1Fb1Tth45hmne1q"	
replace PID = 1036 if RESPONSEID == "R_2PmUtgGazr5a8z7"


// clean recode "other" recruitment site entries
/* first for YB */
replace SITE_HOUSED = 7 if PID == 1034
replace SITE_HOUSED = 7 if PID == 1035
replace SITE_HOUSED = 7 if PID == 1036
replace SITE_HOUSED = 7 if PID == 1037
replace SITE_HOUSED = 7 if PID == 1038
replace SITE_HOUSED = 7 if PID == 1039
replace SITE_HOUSED = 7 if PID == 1040
replace SITE_HOUSED = 7 if PID == 1041
replace SITE_HOUSED = 7 if PID == 1042
replace SITE_HOUSED = 7 if PID == 1043
replace SITE_HOUSED = 7 if PID == 1044

/*ruth's place TLP */
replace SITE_HOUSED = 9 if PID == 1020
replace SURVEYTYPE = 1 if PID == 1021
replace SITE_HOUSED = 9 if PID == 1021
replace SITE_UNHOUSED = . if PID == 1021


// Make known changes to baseline survey responses:
/* fix 4008's (formerly 2008's) SUcost_30d_marj response to $20 or more (but don't have that response option... $50 or less? --> */ 
replace SUCOST_30D_MARJ = 999 if PID == 4008

/* fix 2002's resposne to alc_30_binge_m to 0 */ 
replace ALC_30_BINGE_M = 0 if /*RESPONSEID == "R_2pKaU8QjbpCuDr9" & --> can put this back once other files are merged...maybe move below next set though*/PID == 2002

/* fix 2006's resposnes for SUCOST_30D_MARJ and SUCOST_30D_ILDRUG*/
replace SUCOST_30D_MARJ = 2 if PID == 2006
replace SUCOST_30D_ILDRUG = 1 if PID == 2006

/* fix 1008's response to SEXORI (responded other) to indicate heterosexual/straight*/
replace SEXORI = 3 if PID == 1008

//merge in other surveys from other files?


//sort how I want it
sort PID


//Create demographic reporting variables for enrollment reports to NIH and NIMH

/*clean raw race/eth/sex variables as needed*/
replace RACE = 3 if PID == 1008
replace RACE = 99 if PID == 1009
replace RACE = 99 if PID == 1010
replace RACE = 99 if PID == 1011
replace RACE = 999 if PID == 1015
replace RACE = 999 if PID == 1025
replace RACE = 6 if PID == 1032
replace RACE = 99 if PID == 2006
replace RACE = 7 if PID == 2009

replace HISP = 1 if PID == 1037

replace SEX = 1 if PID == 1041
replace SEX = 1 if PID == 2005
replace SEX = 2 if PID == 4008 /*NEED TO REVISIT THIS: do we want to keep as recoded to female? or change back to seen but not answered since we don't know for 100% sure? or analyze as female but with * in methods section explaining?*/

/*cleaned ethnicity hisp/not/missing/unknown*/
gen DEMO_HISP = . 
lab var DEMO_HISP "Cleaned ethnicity (hisp/not) variable for enrollment reporting"
lab def DEMO_HISP_LAB 0"Not Hispanic or Latino" 1"Hispanic or Latino" 99"Unknown or not reported"
lab val DEMO_HISP DEMO_HISP_LAB
replace DEMO_HISP = 0 if HISP == 0
replace DEMO_HISP = 1 if HISP == 1
replace DEMO_HISP = 99 if HISP == 99 
replace DEMO_HISP = 99 if HISP == 999
/*cleaning/recoding DEMO_HISP responses*/


/*cleaned race as 1 of 5 race categories, more than one race, and unknown or not reported*/
gen DEMO_RACE = . 
lab var DEMO_RACE "Cleaned race variable for enrollment reporting"
lab def DEMO_RACE_LAB 1"American Indian/Alaska Native" 2"Asian" 3"Native Hawaiian or Other Pacific Islander" 4"Black or African American" 5"White" 6"More than one race" 99"Unknown or not reported"
lab val DEMO_RACE DEMO_RACE_LAB
replace DEMO_RACE = 1 if RACE == 1
replace DEMO_RACE = 2 if RACE == 2
replace DEMO_RACE = 2 if RACE == 5
replace DEMO_RACE = 3 if RACE == 4
replace DEMO_RACE = 4 if RACE == 3
replace DEMO_RACE = 5 if RACE == 6
replace DEMO_RACE = 6 if RACE == 7
replace DEMO_RACE = 99 if RACE == 99
replace DEMO_RACE = 99 if RACE == 999
/*cleaning/recoding DEMO_RACE responses*/


/*cleaned racial minority or not dummy variable for NIMH enrollment reporting*/
gen DEMO_RACEMIN = . 
lab var DEMO_RACEMIN "Cleaned racial minority y/n variable for enrollment reporting to NIMH"
lab val DEMO_RACEMIN YN_DK_LAB
replace DEMO_RACEMIN = 1 if DEMO_RACE != 5 & DEMO_RACE != 99 & DEMO_RACE != .
replace DEMO_RACEMIN = 0 if DEMO_RACE == 5
replace DEMO_RACEMIN = . if DEMO_RACE == . 
replace DEMO_RACEMIN = 99 if DEMO_RACE == 99
/*adjustements to DEMO_RACEMIN responses*/
replace DEMO_RACEMIN = 1 if PID == 1015

/*cis gender yn variable gen*/
gen GENDER_CISYN = 0
order GENDER_CISYN, after(GENDER_OTHER_TEXT)
lab var GENDER_CISYN "Cis gender dummy variable (yes if biosex=gender)"
lab val GENDER_CISYN YNONLY_LAB
replace GENDER_CISYN = 1 if GENDER_M==1 & SEX==1 & GENDER_TM==. & GENDER_TF==. & GENDER_GQNC ==. & GENDER_OTHER==. 
replace GENDER_CISYN = 1 if GENDER_F==1 & SEX==2 & GENDER_TM==. & GENDER_TF==. & GENDER_GQNC ==. & GENDER_OTHER==. 
replace GENDER_CISYN = 999 if GENDER_M == . & GENDER_F == . & GENDER_TM == . & GENDER_TF == . & GENDER_GQNC == . & GENDER_OTHER == .


