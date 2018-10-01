version 15

clear

//import raw, formattted csv file **NEED TO CHANGE PATH FOR UPDATED FILES EVERY TIME WE UPDATE**
import delimited "U:\Log My Life Study\Survey Data\Qualtrics Data Exports\Baseline\LogMyLife Baseline Questionnaire - (edits 2017-07-11)_October 3, 2017_14.59_formatted", delimiter(comma) varnames(1) case(upper)


//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)



// TEMPORARY!!!! Add observations for any that don't have a survey file and label them with PID, then enter values for HISP, RACE and SEX for reporting
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


//END OF TEMPORARY INSERTIONS


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
lab def YNONLY_LAB 1"Yes" 0"No" -99"Seen but not answered" 999"Missing Data"
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
lab var GENDER_OTHER "Gender: Different identity (please state): selected"

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

lab def SOTS_LAB 1"None at all" 2"A little" 3"More than a little" 4"A lot"
lab val STRESS_STREETS_* SOTS_LAB

/*need to finish labeling variables, etc.:
MSE_REL-PROV
MSE_TALKTO
MSE_HOUSINGOPTS
MSE_PROGENGAGE
MSE_DROP-INACCESS
MSE_SHELTERACCESS
MSE_TXACCESS
INCOMEEMPL_CONFIDENT
INCMGEN_30DAY
EMPLOY_PAIDJOBS
EMPLOY_TTLPAIDHRS
TTLINCOME_EMPLOY
TTLINCOME_INFORMAL
UCLA_PTSD_INST
UCLA_PTSD_DISASTER
UCLA_PTSD_ACCIDENT
UCLA_PTSD_WAR
UCLA_PTSD_PHYSABUSE
UCLA_PTSD_WITNESS
UCLA_PTSD_COMMVICT
UCLA_PTSD_COMMWIT
UCLA_PTSD_DEADBODY
UCLA_PTSD_SEXABUSE
UCLA_PTSD_FAMILYVICT
UCLA_PTSD_INJURY
UCLA_PTSD_FORCEDSEX
UCLA_PTSD_DEATH
PH_INST
HEALTH
CHRONICDX
HEALTHNEEDS
SD_SF4A
SD_SF1
SD_SF2
SD_SF3
SD_SF4
SD_SINCE
ISI7_SRI
ISI7-SRI_SINCE
SLEEP_SAFE
PHQ-9_INST
PHQ9_1
PHQ9_2
PHQ9_3
PHQ9_4
PHQ9_5
PHQ9_6
PHQ9_7
PHQ9_8
PHQ9_9
GAD7_1
GAD7_2
GAD7_3
GAD7_4
GAD7_5
GAD7_6
GAD7_7
GAD7_8
PTSD_1
PTSD_2
PTSD_3
PTSD_4
MH_DX
MH_DX_OTHER
MH_CURRENT
SUIC_INST
SUIC_THOUGHT
SUIC_ATTEMPT
MHC_INST
MED_12MO
THER_12MO
ER_12MO
HOSPIT_12MO
UNMET_12MO
MHNEED_PERCEIVE
DERS-SF
PSS_INST
PSS_1
PSS_2
PSS_3
PSS_4
COPING
HALFWAY_BREAK
SEXINST_CONF
LIFESEX_BEH
LIFESEX_PARTNUM
3MO.SEX_INST
DESCRIBE_3MOPARTNER
3MOSEX_PARTGNDR
3MOSEX_TYPES
3MOSEX_PARTNUM
3MOSEX_PARTBIOSEX
3MOSEX_CONDOMFREQ
3MOSEX_CNTRCPTV
3MOSEX_CNTRCPTV_FAM
3MOSEX_CNTRCPTV_PLAN
3MOSEX_SUIFREQ
3MOSEX_HIVCONVO
EXCHSEX_3MO
EXCHSEX_TYPES
EXCHSEX_3MO_FORCED
FORCEDSEX_3MO
FORCEDSEXATTEMPT_3MO
HIVSTI_INST_CONF
*/

lab var HIV_ST "Ever tested HIV+"
lab val HIV_ST YNONLY_LAB

/*
HIVP_WHEN 
HIVP_TESTLOC
HIVP_TX
HIVP_TX_WHYNOT
HIVP_MEDS
HIVP_MEDS_WHYNOT

HIVN_LASTTEST
HIVN_TESTLOC
HIVN_GOTRESULT
HIVN_PTCOUNSEL

STI_LAST
STI-POS
CHLAM_POS_LAST
GONO_POS_LAST
SYPH_POS_LAST
HERP_POS_LAST
HPV_POS_LAST
HEPB_POS_LAST
STI_POS_OTHER
OTHER_POS_LAST
HCV_INST
HCV_LASTTEST
HCV_STATUS
PREP_INST
PREP_KNOW
PREP_INTEREST
PREP_WHERELEARNED
PREP_SOCIAL
PREP_SOCIAL_WHO
PREP_RX_EVER
PREP_CURRENTLYTAKING
PREP_BARRIERS
PREG_INST
PREG_FREQ
PREG_UNPLAN
PREG_CHILD
PREG_LIVE
*/


rename SUTYPES_USE_EVER_0 SUEVER_NONE
lab var SUEVER_NONE "Lifetime substance use: no substances used in lifetime selected"
rename SUTYPES_USE_EVER_1 SUEVER_TOB
lab var SUEVER_TOB "Lifetime substance use: tobacco selected
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

/*NEED TO LABEL
TOBACCO_TYPES
TOBACCO_SMOKEFREQ
TOBACCO_DAILYAMT
TOBACCO_WEEKLYAMT
TOBACCO_SMOKELESSFREQ
TOBACCO_VAPEFREQ
*/

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

/* NEED TO LABEL:
MARJ_FREQCURR
MARJ_HPD30D
MARJ_FREQACCPT
MARJ_AMTWK
MARJ_ACCESS
MARJ_CARD
*/

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

/*
IVDU_NEEDLEEXCH
IVDU_NEEDLEPURCH
EXCH_30DAYS
EXCH_WHERE
IVDU_EVER
IVDU_30DAY
IVDU_SHARE
IVDU_REUSE
IVDU_REUSE_QUANT
SUTX_EVER
SUTX_PASTYEAR
CAGE2
CAGE1
CAGE3
CAGE4
SUCOST_30D_ALCOHOL
SUCOST_30D_MARJ
SUCOST_30D_ILDRUG
TECH_INST
TECHACCESS
TECH_ACCESS_NOOWN
TECH_ACCESS_WHERE
CELL_PLAN
CELL_BILL
CELL_TURNOVER
CELL_USE
CELL_CHARGE
CELL_CHARGE_ACCESS
TECH_BARRIERS
VICT_INSTRUCT
VICT_ROBBERY
VICT_IPV_VIC
VICT_IPV_PERP
VICT_ASSLT
VICT_ASSLT_PERP
GANG_INST_CONF
GANG_CURR
GANG_FRMR
GANG_AGE
GANG_AFF
STREETFAMILY
POLICEINTGEN
POLICEINT_3MO
POLICEINT_3MO_EXP
POLICEIN_3MO_WHY
AVOIDPOLICE
CASEY_INST_INTRO
CASEY_LOCUSCONTROL
CASEY_FUTURETHINK
CASEY_RELATIONSHIPS
CASEY_MODELING
CASEY_SUCCESSREL
CASEY_TRANSITION
CASEY_PRIDE
CASEY_SELFEFFICACY
Q523
Q524
*/



/*Delete all test responses*/
drop if RESPONSEID == "R_3dLBmeVaJN1KDsD" | RESPONSEID == "R_3HRMuFtiDaFj7RD" | RESPONSEID == "R_1Q9lqUXMprXCHUH"


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

//Combine partial surveys:
/* combine 1004's two surveys into one (response ID "R_1o0ursi841wl4tT" is first half;  "R_72GUjPfXIWKYOlP" is second half) */ 

/* combine 1014's two surveys or drop one of the two: "R_eaPtOykJQhKLnOh" "R_3nvdffglc9gRmC7" */


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



