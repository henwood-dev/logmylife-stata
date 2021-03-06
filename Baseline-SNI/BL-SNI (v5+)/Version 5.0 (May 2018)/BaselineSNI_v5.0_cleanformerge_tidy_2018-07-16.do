///*mac remote login*/version 14.1
/*in-office version*/ version 15


clear

//import raw, formattted csv file for all who took Baseline Version 4
///*mac remote login*/import delimited "/Volumes/Share/LML_Share/USC LOG MY LIFE STUDY/Data/Quant/Raw Data-Cleaning/Qualtrics Survey Data/Baseline/Version 5.0 (May 2018)/LogMyLife Baseline-SNI+Questionnaire_ver5.0 (May2018)_July+ 15, 2018_14.58_formatted.csv", delimiter(comma) varnames(1) case(upper)
/*in-office path*/ import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Baseline\Version 5.0 (May 2018)\LogMyLife Baseline-SNI+Questionnaire_ver5.0 (May2018)_July+ 15, 2018_14.58_formatted", delimiter (comma) varnames (1) case (upper)

//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)
sort PID

/*Delete all test responses or mistake responses and fix mislabeled PID*/
drop if PID == 9999 | PID == 9999999 | PID == 1100

//add survey version variable for all obs=4
gen BLVERSION=5
order BLVERSION, after(DATE)




//label variables and values
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
lab var INTNAME "Interviewer Name"
lab var DATE "Interview date (entered by interviewer MM/DD/YYYY)"
lab var PID "Participant ID"

lab var SURVEYTYPE "Survey type, housed/not housed"
lab def SURVEYTYPE_LAB 1"Housed" 2"Unhoused" -99"Seen but not answered"
lab val SURVEYTYPE SURVEYTYPE_LAB

//make sure to add new sites as we go. 
lab var SITE_HOUSED "Recruitment site, housed"
lab def SITE_HOUSED_LAB 1"Jovenes TLP" 2"Jovenes SH (Progress Place)" 4"Jovenes Scattered Site SH" 5"CRCD Epworth Apts SH" 6"CRCD 28th Street Apts SH" 7"Young Burlington SH" 8"Covenant House RoP TLP" 9"CRCD Ruth's Place TLP" 10"Harbor Interfaith-SPA8 Rapid Rehousing" -10"Hathaway Sycamores TLP" 11"Penny Lane North Hills TLPs" 12"Penny Lane North Hills PSH" 13"Penny Lane MoonlightPSH" 14"Penny Lane Antelope Valley TLPs" 15"LA LGBT Center TLP" 16"David & Margaret Cedar Springs PSH" 17"Covenant House SAP Apts" 35"David & Margaret THP" 36"St. Anne's PSH" 77"Other (please specify)" -99"Seen but not answered", modify
lab val SITE_HOUSED SITE_HOUSED_LAB

lab var SITE_UNHOUSED "Recruitment site, unhoused"
lab def SITE_UNHOUSED_LAB 1"Jovenes ES" 2"Jovenes-OTHER" 4"CRCD Ruth's Place Drop-in" 77"Other, (please specify)" -99"Seen but not answered"
lab val SITE_UNHOUSED SITE_UNHOUSED_LAB

lab def YNONLY_LAB 1"Yes" 0"No" -99"Seen but not answered" 999"Missing"

lab var CONSENT "Consent signed y/n"
lab val CONSENT YNONLY_LAB

lab var DOB "birthdate"

lab var HISP "hispanic/latino"
lab def YN_DK_LAB 1"Yes" 0"No" 99"Don't know" -99"Seen but not answered" 999"Missing Data"
lab val HISP YN_DK_LAB

lab var RACE "race"
lab def RACE_LAB 1"American Indian or Alaska Native" 2"Asian" 3"Black or African American" 4"Native Hawaiian or other Pacific Islander" 5"South Asian" 6"White" 7"Bi/Multi Racial or Ethnic" 9"Hispanic/Latino ONLY, no race ID" 8"Other, please specify" 99"I don't know" -99"Seen but not answered" 999"MISSING"
lab val RACE RACE_LAB

lab var RACE_8_TEXT "Race_other (text entry)"

lab var BIRACE_1 "Bi/multi-racial/ethnic: American Indian or Alaska Native selected"
lab var BIRACE_2 "Bi/multi-racial/ethnic: Asian selected"
lab var BIRACE_3 "Bi/multi-racial/ethnic: Black or African American selected"
lab var BIRACE_4 "Bi/multi-racial/ethnic: Hispanic/Latino selected"
lab var BIRACE_5 "Bi/multi-racial/ethnic: Native Hawaiian or other Pacific Islander selected"
lab var BIRACE_6 "Bi/multi-racial/ethnic: South Asian selected"
lab var BIRACE_7 "Bi/multi-racial/ethnic: White selected"
lab var BIRACE_8 "Bi/multi-racial/ethnic: Other, please specify:___ selected"
lab var BIRACE_99 "Bi/multi-racial/ethnic: Don't know selected"

lab var BIRACE_8_TEXT "Bi/multi-racial/ethnic-OTHER (text entry)"

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

lab var GENDER_1 "Gender: Male selected"
lab var GENDER_2 "Gender: Female selected"
lab var GENDER_3 "Gender: Trans male/Trans man selected"
lab var GENDER_4 "Gender: Trans female/Trans woman selected"
lab var GENDER_5 "Gender: Genderqueer/gender non-conforming selected"
lab var GENDER_6 "Gender: Different identity (please state) selected"
lab var GENDER_6_TEXT "Gender: Different identity (please state) TEXT ENTRY"

lab var SEXORI "Sexual orientation identity"
lab def SEXORI_LAB 1"Gay or lesbian" 2"Bisexual" 3"Heterosexual or straight" 4"Questioning or unsure" 5"Asexual" 6"Another sexual orientation, please specify" -99"Seen but not answered"
lab val SEXORI SEXORI_LAB

lab var SEXORI_6_TEXT "Another sexual orientation please specify: _____ (TEXT ENTRY)"

lab var SEXATTR "Sexual attraction preferences"
lab def SEXATTR_LAB 1"Only attracted to females" 2"Mostly attracted to females" 3"Equally attracted to females and males" 4"Mostly attracted to males" 5"Only attracted to males" 99"Not sure" -99"Seen but not answered"
lab val SEXATTR SEXATTR_LAB

lab var RESEARCH_LAST "Last research study involvement"
lab def RESEARCH_LAST_LAB 1"Less than 1 month ago" 2"1-3 months ago" 3"4-6 months ago" 4"6-12 months ago" 5"1-3 years ago" 0"I have never participated in a research study before this" -99"Seen but not answered"
lab val RESEARCH_LAST RESEARCH_LAST_LAB

lab var RESEARCH_TYPES_1 "Type of research involved in: HIV prevention or risk selected"
lab var RESEARCH_TYPES_2 "Type of research involved in: Substance use selected"
lab var RESEARCH_TYPES_3 "Type of research involved in: Sexual behavior selected"
lab var RESEARCH_TYPES_4 "Type of research involved in: Other, please specify selected"
lab var RESEARCH_TYPES_99 "Type of research involved in: Don't know/can't remember selected"
lab var RESEARCH_TYPES_4_TEXT "Type of research involved in: Other text entry"

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

lab var ROMREL_PTNRSGNDR_1 "Gender(s) of partners: Male selected"
lab var ROMREL_PTNRSGNDR_2 "Gender(s) of partners: Female selected"
lab var ROMREL_PTNRSGNDR_3 "Gender(s) of partners: Trans male/trans man selected"
lab var ROMREL_PTNRSGNDR_4 "Gender(s) of partners: Trans female/trans woman selected"
lab var ROMREL_PTNRSGNDR_5 "Gender(s) of partners: Genderqueer/gender non-comforming selected"
lab var ROMREL_PTNRSGNDR_6 "Gender(s) of partners: Other selected"
lab var ROMREL_PTNRSGNDR_6_TEXT "Gender(s) of partners: Other (text input)"

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

lab var STAYBEFOREHOUSED_20_TEXT "place of stay most of the time immediately before being housed_other text entry"

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

//need to label HFIAS variables and ttl income benefits, etc. above
lab val HFIAS_1 YNONLY_LAB
lab val HFIAS_2 YNONLY_LAB
lab val HFIAS_3 YNONLY_LAB
lab val HFIAS_4 YNONLY_LAB
lab val HFIAS_5 YNONLY_LAB
lab val HFIAS_6 YNONLY_LAB
lab val HFIAS_7 YNONLY_LAB
lab val HFIAS_8 YNONLY_LAB
lab val HFIAS_9 YNONLY_LAB

lab def HFIAS_A_LAB 1"Rarely (1-2x in past 30days)" 2"Sometimes (3-10x in past 30days)" 3"Often(more than 10x in past 30days)"
lab val HFIAS_1_A HFIAS_A_LAB
lab val HFIAS_2_A HFIAS_A_LAB
lab val HFIAS_3_A HFIAS_A_LAB
lab val HFIAS_4_A HFIAS_A_LAB
lab val HFIAS_5_A HFIAS_A_LAB
lab val HFIAS_6_A HFIAS_A_LAB
lab val HFIAS_7_A HFIAS_A_LAB
lab val HFIAS_8_A HFIAS_A_LAB
lab val HFIAS_9_A HFIAS_A_LAB

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

lab var MH_DX_MH_DX_1 "Ever diagnosed with ADHD"
lab var MH_DX_MH_DX_2 "Ever diagnosed with PTSD"
lab var MH_DX_MH_DX_3 "Ever diagnosed with OPPOSITIONAL DEFIANT/CONDUCT DISORDER"
lab var MH_DX_MH_DX_4 "Ever diagnosed with MAJOR DEPRESSION"
lab var MH_DX_MH_DX_5 "Ever diagnosed with BIPOLAR DISORDER"
lab var MH_DX_MH_DX_6 "Ever diagnosed with SCHIZOPHRENIA/SCHIZOAFFECTIVE DISORDER"
lab var MH_DX_MH_DX_7 "Ever diagnosed with ANXIETY/PANIC DISORDER"
lab var MH_DX_MH_DX_8 "Ever diagnosed with PERSONALITY DISORDER"
lab var MH_DX_MH_DX_9 "Ever diagnosed with OTHER MH CONDITION(S) NOT LISTED"
lab val MH_DX_MH_DX_1-MH_DX_MH_DX_9 YNONLY_LAB

lab var MH_DX_OTHER "Other mental health conditions diagnosed with: text entry"

lab var MH_CURRENT "Past 30day extent of issues w/ mental health"

/*LABELS FOR F/U'S IN BL VERSION 1: (use once appended)
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

lab var MED_12MO "12month taken Rx for MH cond." 
lab var THER_12MO "12month received outpatient MH care"
lab var ER_12MO "12month emergency room treatment for MH issue"
lab var HOSPIT_12MO "12month inpatient MH care"
lab var UNMET_12MO "12 month unmet MH care need"
lab val MED_12MO-UNMET_12MO YNONLY_LAB

lab var MHNEED_PERCEIVE "Currently feel in-need of mentalhealth treatment"
lab def MHNEED_LAB 1"Yes" 0"No" 3"I am currently receiving treatment" 99"Not sure" -99"Seen but not answered"

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


lab var MOSEX_PARTGNDR_1 "3mo sex partners gender(s): MALE selected"
lab var MOSEX_PARTGNDR_2 "3mo sex partners gender(s): FEMALE selected"
lab var MOSEX_PARTGNDR_3 "3mo sex partners gender(s): TRANS MALE/TRANS MAN selected"
lab var MOSEX_PARTGNDR_4 "3mo sex partners gender(s): TRANS FEMALE/TRANS WOMAN selected"
lab var MOSEX_PARTGNDR_5 "3mo sex partners gender(s): GENDERQUEER/GENDER NON-CONFORMING selected"
lab var MOSEX_PARTGNDR_6 "3mo sex partners gender(s): DIFFERENT IDENTITY selected"
lab var MOSEX_PARTGNDR_6_TEXT "3mo sex partners gender(s): DIFFERENT IDENTITY TEXT ENTRY"

lab var MOSEX_TYPES_1 "3mo sex types: ANAL W/ CONDOM selected"
lab var MOSEX_TYPES_2 "3mo sex types: ANAL NO CONDOM selected"
lab var MOSEX_TYPES_3 "3mo sex types: ORAL W/ CONDOM/DAM selected"
lab var MOSEX_TYPES_4 "3mo sex types: ORAL NO CONDOM/DAM selected"
lab var MOSEX_TYPES_5 "3mo sex types: VAGINAL W/ CONDOM selected"
lab var MOSEX_TYPES_6 "3mo sex types: VAGINAL NO CONDOM selected"

lab var MOSEX_PARTNUM "3mo # of vaginal/anal sex partners"
lab val MOSEX_PARTNUM PARTNUM_LAB

lab var MOSEX_PARTBIOSEX "3mo sex partner(s) biological sex(es)"
lab def BIOSEX_LAB 1"Men only" 2"Women only" 3"Both men and women"
lab val MOSEX_PARTBIOSEX BIOSEX_LAB

lab var MOSEX_CONDOMFREQ "3mo frequency of condum use during anal/vaginal sex"
lab def SEXFREQ_LAB 0"Never" 1"Less than half the time" 2"Half the time" 3"More than half the time" 4"Every Time"
lab val MOSEX_CONDOMFREQ SEXFREQ_LAB

lab var MOSEX_CNTRCPTV_1 "3mo contraceptive method to prevent pregnancy: NO METHOD USED selected" 
lab var MOSEX_CNTRCPTV_2 "3mo contraceptive method to prevent pregnancy: CONDOMS (M/F) selected" 
lab var MOSEX_CNTRCPTV_3 "3mo contraceptive method to prevent pregnancy: BIRTH CONTROL PILLS selected" 
lab var MOSEX_CNTRCPTV_4 "3mo contraceptive method to prevent pregnancy: BIRTH CONTROL PATCH selected" 
lab var MOSEX_CNTRCPTV_5 "3mo contraceptive method to prevent pregnancy: IUD/IMPLANT selected" 
lab var MOSEX_CNTRCPTV_6 "3mo contraceptive method to prevent pregnancy: PULLING OUT/WITHDRAWAL selected" 
lab var MOSEX_CNTRCPTV_7 "3mo contraceptive method to prevent pregnancy: FERTILITY AWARENESS METHODS selected" 
lab var MOSEX_CNTRCPTV_8 "3mo contraceptive method to prevent pregnancy: SOME OTHER METHOD selected" 
lab var MOSEX_CNTRCPTV_99 "3mo contraceptive method to prevent pregnancy: NOT SURE selected" 
lab var MOSEX_CNTRCPTV_9_TEXT "3mo contraceptive method to prevent pregnancy: SOME OTHER METHOD TEXT ENTRY" 

lab var MOSEX_CNTRCPTV_FAM "3mo use app to help with fertility awareness methods"
lab val MOSEX_CNTRCPTV_FAM YN_DK_LAB

lab var MOSEX_CNTRCPTV_PLAN "3mo you or partner used emergency contraception/plan-b to prevent pregnancy"
lab val MOSEX_CNTRCPTV_PLAN YN_DK_LAB

lab var MOSEX_SUIFREQ "3mo frequency of sex under the influence of drugs/alcohol"
lab val MOSEX_SUIFREQ SEXFREQ_LAB

lab var MOSEX_HIVCONVO "3mo had sex w/o condom w/o first having conversation about HIV status"
lab val MOSEX_HIVCONVO YNONLY_LAB

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

lab var HIVP_TESTLOC_9_TEXT "Other location where first tested HIV+ TEXT ENTRY"

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
lab var STI_POS_7 "Ever tested + for STI's: OTHER selected"
lab var STI_POS_7_TEXT "Ever tested + for STI's: OTHER text entry"
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



//need to add variables for new stigma options for prep barriers here and hivpwhynot's above



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

lab var SUTYPES_USE_EVER_0 "Lifetime substance use: no substances used in lifetime selected"
lab var SUTYPES_USE_EVER_1 "Lifetime substance use: tobacco selected"
lab var SUTYPES_USE_EVER_2 "Lifetime substance use: alcohol selected"
lab var SUTYPES_USE_EVER_3 "Lifetime substance use: marijuana selected"
lab var SUTYPES_USE_EVER_4 "Lifetime substance use: meth selected"
lab var SUTYPES_USE_EVER_5 "Lifetime substance use: Ecstacy/mdma/'molly' selected"
lab var SUTYPES_USE_EVER_6 "Lifetime substance use: synthetic marijuana (k2, spice, fake weed) selected"
lab var SUTYPES_USE_EVER_7 "Lifetime substance use: hallucinogens/psychedelics selected"
lab var SUTYPES_USE_EVER_8 "Lifetime substance use: prescription drugs that were not prescribed or in higher doses than prescribed selected"
lab var SUTYPES_USE_EVER_9 "Lifetime substance use: heroin selected"
lab var SUTYPES_USE_EVER_10 "Lifetime substance use: cocaine (powdered) selected"
lab var SUTYPES_USE_EVER_11 "Lifetime substance use: crack/freebase cocaine selected"
lab var SUTYPES_USE_EVER_12 "Lifetime substance use: inhalants (sniffed/huffed glue, paint, markers, etc) selected"
lab var SUTYPES_USE_EVER_13 "Lifetime substance use: steroid pills or shots without a prescription selected"
lab var SUTYPES_USE_EVER_14 "Lifetime substance use: nitrous oxide (whippets/laughing gas/hippy crack/etc) selected"
lab var SUTYPES_USE_EVER_15 "Lifetime substance use: ketamine selected"
lab var SUTYPES_USE_EVER_16 "Lifetime substance use: pcp selected"
lab var SUTYPES_USE_EVER_17 "Lifetime substance use: something else not listed here selected"
lab var OTHERSU_TYPE "Lifetime substance use: other text response"

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

lab var TOBACCO_VEPFREQ "Current ecig/vaped tobacco use frequency"
lab val TOBACCO_VEPFREQ SMOKEFREQ_LAB

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
lab var MARJ_AMTWK_MARJ_AMTWK_1 "Approx amt of MARIJUANA PLANT MATERIAL used per week over past 30days"
lab def MARJPLNTAMT_LAB 1"None" 2"Less than 1/8oz (3.5g)" 3"Between 1/8-1/2oz (3.5-14g)" 4"Between 1/2-1oz (14-27g)" 5"More than 1oz (28g)" -99"Seen but not answered"
lab val MARJ_AMTWK_MARJ_AMTWK_1 MARJPLNTAMT_LAB
lab var MARJ_AMTWK_MARJ_AMTWK_2 "Approx amt of MARIJUANA CONCENTRATES used per week over past 30days"
lab def MARJCONCAMT_LAB 1"None" 2"Less than 0.5 grams" 3"0.5-1 gram" 4"1-2 grams" 5"More than 2 grams" -99"Seen but not answered"
lab val MARJ_AMTWK_MARJ_AMTWK_2 MARJCONCAMT_LAB

lab var MARJ_ACCESS_8 "30day marijuana source: I bought from a recreational marijuana shop/dispensary/collective (SP18-on)" /*added in v3*/
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

lab var IVDU_NEEDLEEXH "Ever used needle exchange/clean needle program"
lab val IVDU_NEEDLEEXH YNONLY_LAB
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

lab var SYTX_PASTYEAR "Received treatment/counseling for alcohol/drug use IN PAST YEAR"
lab val SYTX_PASTYEAR YNONLY_LAB

lab var CAGE2 "ANNOYED by others criticizing alcohol/drug use"
lab var CAGE1 "feel that I ought to CUT DOWN on alcohol/drug use"
lab var CAGE3 "feel bad or GUILTY about alcohol/drug use"
lab var CAGE4 "(EYE-OPENER) felt need to drink/use drugs first thing in the morning"
lab val CAGE2-CAGE4 YNONLY_LAB

lab var SUCOST_30D_ALCOHOL "30day amt spent on alcohol"
lab def SUCOST_LAB 1"Less than $50 (allows text entry)" 2"$51-$250" 3"$251-$500" 4"$501-750" 5"$751-$1000" 6"$1001-$1250" 7"$1251-$1500" 8"$1501-$1750" 9"$1751-$2000" 10"$2001-$2250" 11"$2251-$2500" 12"$2501-$2750" 13"$2751-$3000" 14"More than $3000" -99"Seen but not answered"
lab val SUCOST_30D_ALCOHOL SUCOST_LAB
lab var SUCOST_30D_ALCOHOL_1_TEXT "Less than $50 text response"

lab var SUCOST_30D_MARJ "30day amt spent on marijuana"
lab val SUCOST_30D_MARJ SUCOST_LAB
lab var SUCOST_30D_MARJ_X1_TEXT "Less than $50 text response"

lab var SUCOST_30D_ILDRUG "30day amt spent on illegal drugs"
lab val SUCOST_30D_ILDRUG SUCOST_LAB
lab var SUCOST_30D_ILDRUG_XX1_TEXT "Less than $50 text response"

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
lab var CELL_BILL_6_TEXT "Who pays your cellphone bill: ANOTHER FAMILY MEMBER TEXT ENTRY"
lab var CELL_BILL_7_TEXT "Who pays your cellphone bill: OTHER TEXT ENTRY"

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

lab var VICT_IPV_VIC "VICTIM of intimate partner violence since homeless"
lab def VICT_IPV_LAB 0"No" 1"Yes" 99"Have not been in relationship during this time period"
lab val VICT_IPV_VIC VICT_IPV_LAB

lab var VICT_IPV_PERP "PERPETRATED intimate partner violence since homeless"
lab var VICT_ASSLT "VICTIM of physical assault (non-IPV)"
lab var PERP_ASSLT "PERPETRATED physical assault"

lab var GANG_CUR "Current or former member of a gang"
lab var GANG_FMR "Currently active member of a gang"
lab val VICT_IPV_PERP-GANG_FMR YNONLY_LAB

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




//rename v5.0 raw varnames to clean tidyverse varnames

rename	STARTDATE	QUALTRICS_DATE_START_BL
rename	ENDDATE	QUALTRICS_DATE_END_BL
rename	STATUS	QUALTRICS_STATUS
drop	IPADDRESS	
rename	PROGRESS	QUALTRICS_PROGRESS_BL
rename	DURATIONINSECONDS	QUALTRICS_DURATION_SECONDS_BL
rename	FINISHED	QUALTRICS_FINISHED_BL
rename	RECORDEDDATE	QUALTRICS_DATE_RECORDED_BL
rename	RESPONSEID	QUALTRICS_RESPONSE_ID_BL
//	RECIPIENTLASTNAME	
//	RECIPIENTFIRSTNAME	
//	RECIPIENTEMAIL	
//	EXTERNALREFERENCE	
rename	LOCATIONLATITUDE	QUALTRICS_LOCATION_LATITUDE_BL
rename	LOCATIONLONGITUDE	QUALTRICS_LOCATION_LONGITUDE_BL
rename	DISTRIBUTIONCHANNEL	QUALTRICS_DISTRIBUTION_TYPE_BL
rename	USERLANGUAGE	QUALTRICS_USER_LANGUAGE_BL
rename	INTNAME	INTERVIEWER_BL
rename	DATE	DATE_BL
rename	PID	PID_BL
rename	SURVEYTYPE	SURVEY_TYPE_H_UH_BL
//	SITE_HOUSED	
//	SITE_HOUSED_3_TEXT	
//	SITE_UNHOUSED	
//	SITE_UNHOUSED_3_TEXT	
//	N/A	
//	CONSENT	
rename	DOB	BIRTHDATE
rename	HISP	HISPANIC_LATINX
rename	RACE	RACE_SINGLE
rename	RACE_8_TEXT	RACE_OTHER_TEXT
rename	BIRACE_1	RACE_BIRACE_ETH_AMERINDIAN_AKNTV
rename	BIRACE_2	RACE_BIRACE_ETH_ASIAN
rename	BIRACE_3	RACE_BIRACE_ETH_BLACK
rename	BIRACE_4	RACE_BIRACE_ETH_HISPANIC_LATINO
rename	BIRACE_5	RACE_BIRACE_ETH_NATIVE_HI_PAC_IS
rename	BIRACE_6	RACE_BIRACE_ETH_SOUTH_ASIAN
rename	BIRACE_7	RACE_BIRACE_ETH_WHITE
rename	BIRACE_8	RACE_BIRACE_ETH_OTHER_SELECTED
rename	BIRACE_99	RACE_BIRACE_ETH_DONT_KNOW
rename	BIRACE_8_TEXT	RACE_BIRACE_ETH_OTHER_TEXT
rename	INSCHOOL	EDUCATION_SCHOOL_NOW
rename	INSCHOOL_TYPE	EDUCATION_SCHOOL_NOW_TYPE
rename	INSCHOOL_TYPE_4_TEXT	EDUCATION_SCHOOL_NOW_TYPE_OTHER
rename	EDUC	EDUCATION_HIGHEST_GRADE_COMPLETE
rename	SEX	SEX_AT_BIRTH
rename	GENDER_1	GENDER_ID_MALE_SELECTED
rename	GENDER_2	GENDER_ID_FEMALE_SELECTED
rename	GENDER_3	GENDER_ID_TRANSMALE_SELECTED
rename	GENDER_4	GENDER_ID_TRANSFEMALE_SELECTED
rename	GENDER_5	GENDER_ID_GQNC_SELECTED
rename	GENDER_6	GENDER_ID_OTHER_SELECTED
rename	GENDER_6_TEXT	GENDER_ID_OTHER_TEXT
rename	SEXORI	SEXUAL_ORIENTATION_ID
rename	SEXORI_6_TEXT	SEXUAL_ORIENTATION_ID_OTHER
rename	SEXATTR_FORMALES	SEXUAL_ORIENTATION_ATTRACTION
//	GISCALE_1	GAY_IDENTITY_SCALE_1
//	GISCALE_2	GAY_IDENTITY_SCALE_2
//	GISCALE_3	GAY_IDENTITY_SCALE_3
//	GISCALE_4	GAY_IDENTITY_SCALE_4
//	GISCALE_5	GAY_IDENTITY_SCALE_5
//	GISCALE_6	GAY_IDENTITY_SCALE_6
//	GISCALE_7	GAY_IDENTITY_SCALE_7
rename	RESEARCH_LAST	RESEARCH_LAST_EVER
rename	RESEARCH_TYPES_1	RESEARCH_TYPE_HIV
rename	RESEARCH_TYPES_2	RESEARCH_TYPE_SUBSTANCE_USE
rename	RESEARCH_TYPES_3	RESEARCH_TYPE_SEX_BEHAVIOR
rename	RESEARCH_TYPES_4	RESEARCH_TYPE_OTHER
rename	RESEARCH_TYPES_99	RESEARCH_TYPE_DONT_KNOW
rename	RESEARCH_TYPES_4_TEXT	RESEARCH_TYPE_OTHER_TEXT
rename	RESEARCH_PASTYR	RESEARCH_12MO_NUM_STUDIES
rename	ROMREL_MARR	MARRIED_CURRENT
rename	ROMREL_CURR	ROMANTIC_REL_CURRENT
rename	ROMREL_PTNRS	ROMANTIC_REL_POLYAMOROUS
rename	ROMREL_PTNRSGNDR_1	ROMANTIC_REL_PARTNERGENDER_M
rename	ROMREL_PTNRSGNDR_2	ROMANTIC_REL_PARTNERGENDER_F
rename	ROMREL_PTNRSGNDR_3	ROMANTIC_REL_PARTNERGENDER_TM
rename	ROMREL_PTNRSGNDR_4	ROMANTIC_REL_PARTNERGENDER_TF
rename	ROMREL_PTNRSGNDR_5	ROMANTIC_REL_PARTNERGENDER_GQNC
rename	ROMREL_PTNRSGNDR_6	ROMANTIC_REL_PARTNERGENDER_OTHER
rename	ROMREL_PTNRSGNDR_6_TEXT	ROMANTIC_REL_PARTNERGENDER_OTEXT
rename	ROMREL_DUR	ROMANTIC_REL_DURATION
rename	ROMREL_SEX_1	ROMANTIC_REL_SEX_MONOGAMY_ALWAYS
rename	ROMREL_SEX_2	ROMANTIC_REL_SEX_MONOGAMY_SOME
rename	ROMREL_SEX_3	ROMANTIC_REL_SEX_GROUPSEX
rename	ROMREL_SEX_4	ROMANTIC_REL_SEX_SP_WOTHERS
rename	ROMREL_SEX_5	ROMANTIC_REL_SEX_PARTNER_WOTHERS
rename	ROMREL_SEX_6	ROMANTIC_REL_SEX_DONT_ASK_TELL
rename	ROMREL_SEX_7	ROMANTIC_REL_SEX_SP_CHEATED
rename	ROMREL_SEX_8	ROMANTIC_REL_SEX_PARTNER_CHEATED
rename	ROMREL_SEX_0	ROMANTIC_RELATIONSHIP_SEX_NO_SEX
rename	FIRSTHOMELESS	HOMELESS_AGE_FIRST_EPISODE
rename	REASONHOMELESS_1	HOMELESS_CAUSES_KICKOUT_FAMHOME
rename	REASONHOMELESS_2	HOMELESS_CAUSES_KICKOUT_FOSTHOME
rename	REASONHOMELESS_3	HOMELESS_CAUSES_KICKOUT_RELHOME
rename	REASONHOMELESS_4	HOMELESS_CAUSES_KICKOUT_GRPHOME
rename	REASONHOMELESS_5	HOMELESS_CAUSES_RANAWAY_FAMHOME
rename	REASONHOMELESS_6	HOMELESS_CAUSES_RANAWAY_FOSTHOME
rename	REASONHOMELESS_7	HOMELESS_CAUSES_RANAWAY_RELHOME
rename	REASONHOMELESS_8	HOMELESS_CAUSES_RAN_AWAY_GRPHOME
rename	REASONHOMELESS_9	HOMELESS_CAUSES_AGEOUT_FOSTER
rename	REASONHOMELESS_10	HOMELESS_CAUSES_COULDNT_PAY_RENT
rename	REASONHOMELESS_11	HOMELESS_CAUSES_NOPLACE_POSTJAIL
rename	REASONHOMELESS_12	HOMELESS_CAUSES_NOPLACE_POSTHOSP
rename	REASONHOMELESS_13	HOMELESS_CAUSES_DOMESTICVIOLENCE
rename	REASONHOMELESS_14	HOMELESS_CAUSES_GANGGANGVIOLENCE
rename	REASONHOMELESS_15	HOMELESS_CAUSES_FAMHMLS_UNSTABLE
rename	REASONHOMELESS_16	HOMELESS_CAUSES_MOVEDHERE_NOHOME
rename	REASONHOMELESS_17	HOMELESS_CAUSES_OTHER_SELECTED
rename	REASONHOMELESS_17_TEXT	HOMELESS_CAUSES_OTHER_TEXT
rename	HOUSINGPROGS_EVER_1	PLACESLIVED_SINCEHMLS_FAMHOME
rename	HOUSINGPROGS_EVER_2	PLACESLIVED_SINCEHMLS_FOSTHOME
rename	HOUSINGPROGS_EVER_3	PLACESLIVED_SINCEHMLS_RELHOME
rename	HOUSINGPROGS_EVER_4	PLACESLIVED_SINCEHMLS_FRIENDHOME
rename	HOUSINGPROGS_EVER_5	PLACESLIVED_SINCEHMLS_PARTNRHOME
//	HOUSINGPROGS_EVER_21	PLACESLIVED_SINCEHMLS_STRNGRHOME
rename	HOUSINGPROGS_EVER_6	PLACESLIVED_SINCEHMLS_GROUPHOME
rename	HOUSINGPROGS_EVER_7	PLACESLIVED_SINCEHMLS_SHELTER_AS
rename	HOUSINGPROGS_EVER_8	PLACESLIVED_SINCEHMLS_SHELTER_YS
rename	HOUSINGPROGS_EVER_9	PLACESLIVED_SINCEHMLS_SHELTER_AL
rename	HOUSINGPROGS_EVER_10	PLACESLIVED_SINCEHMLS_SHELTER_YL
rename	HOUSINGPROGS_EVER_11	PLACESLIVED_SINCEHMLS_HOTELMOTEL
rename	HOUSINGPROGS_EVER_12	PLACESLIVED_SINCEHMLS_SOBERLIVE
rename	HOUSINGPROGS_EVER_13	PLACESLIVED_SINCEHMLS_JAIL
rename	HOUSINGPROGS_EVER_14	PLACESLIVED_SINCEHMLS_TLP
rename	HOUSINGPROGS_EVER_15	PLACESLIVED_SINCEHMLS_PSH
rename	HOUSINGPROGS_EVER_16	PLACESLIVED_SINCEHMLS_MYAPARTMNT
rename	HOUSINGPROGS_EVER_17	PLACESLIVED_SINCEHMLS_STREET
rename	HOUSINGPROGS_EVER_18	PLACESLIVED_SINCEHMLS_SQUAT
rename	HOUSINGPROGS_EVER_19	PLACESLIVED_SINCEHMLS_VEHICMETRO
rename	HOUSINGPROGS_EVER_20	PLACESLIVED_SINCEHMLS_OTHER
rename	HOUSINGPROGS_EVER_20_TEXT	PLACESLIVED_SINCEHMLS_OTHER_TEXT
rename	TIMEHOMELESS_EVER	DURATION_HOMELESSNESS_LIFETIME
rename	TIMEHOUSED	DURATION_HOUSED_CURRENT_PROGRAM
rename	STAYBEFOREHOUSED	PLACESLIVED_H_MAIN_PREHOUSED
rename	STAYBEFOREHOUSED_20_TEXT	PLACESLIVED_H_MAIN_PREHOUSEDTEXT
rename	TIMEHOMELESS_BEFOREH	HOMELESS_DURATION_H_PREHOUSEDEP
rename	TIMEHOMELESS_RECENT	HOMELESS_DURATION_UH_CURRENTEP
rename	UH_LIVSIT_3MO_1	PLACESLIVED_UH_3MO_STREET
rename	UH_LIVSIT_3MO_2	LIVING_SITUATIONS_UH_3MO_SQUAT
rename	UH_LIVSIT_3MO_3	PLACESLIVED_UH_3MO_VEHICLEMETRO
rename	UH_LIVSIT_3MO_4	PLACESLIVED_UH_3MO_FAMHOME
rename	UH_LIVSIT_3MO_5	PLACESLIVED_UH_3MO_FOSTHOME
rename	UH_LIVSIT_3MO_6	PLACESLIVED_UH_3MO_RELHOME
rename	UH_LIVSIT_3MO_7	PLACESLIVED_UH_3MO_FRIENDHOME
rename	UH_LIVSIT_3MO_8	PLACESLIVED_UH_3MO_PARTNERHOME
rename	UH_LIVSIT_3MO_21	PLACESLIVED_UH_3MO_STRANGER_HOME
rename	UH_LIVSIT_3MO_9	PLACESLIVED_UH_3MO_GROUP_HOME
rename	UH_LIVSIT_3MO_10	PLACESLIVED_UH_3MO_SHELTER_Y_30D
//	UH_LIVSIT_3MO_11	PLACESLIVED_UH_3MO_SHELTER_A_30D
rename	UH_LIVSIT_3MO_12	PLACESLIVED_UH_3MO_SHELTER_A_LT
rename	UH_LIVSIT_3MO_13	PLACESLIVED_UH_3MO_SHELTER_Y_LT
rename	UH_LIVSIT_3MO_14	PLACESLIVED_UH_3MO_HOTEL_MOTEL
rename	UH_LIVSIT_3MO_15	PLACESLIVED_UH_3MO_SOBER_LIVING
rename	UH_LIVSIT_3MO_16	PLACESLIVED_UH_3MO_JAIL
rename	UH_LIVSIT_3MO_17	PLACESLIVED_UH_3MO_TLP
rename	UH_LIVSIT_3MO_18	PLACESLIVED_UH_3MO_PSH
rename	UH_LIVSIT_3MO_19	PLACESLIVED_UH_3MO_MYAPARTMENT
rename	UH_LIVSIT_3MO_20	PLACESLIVED_UH_3MO_OTHER
rename	UH_LIVSIT_3MO_20_TEXT	PLACESLIVED_UH_3MO_OTHER_TEXT
rename	UH_LIVSIT_CURR	PLACESLIVED_UH_CURRENT_MAIN
rename	UH_LIVSIT_CURR_20_TEXT	PLACESLIVED_UH_CURRENT_MAIN_TEXT
rename	FC_EVER	FOSTER_CARE_EVER
rename	FC_PLACEMENTS	FOSTER_CARE_EVER_PLACEMENTS
rename	JJS_EVER	JUSTICE_INVOLVE_JUVENILE_EVER
rename	JJS_AGEOUT	JUSTICE_INVOLVE_JUVENILE_AGEOUT
rename	ARREST_EVER	JUSTICE_INVOLVE_ADULT_ARRESTED
rename	JAIL_EVER	JUSTICE_INVOLVE_ADULT_JAILPRISON
rename	STRESS_STREETS_1	STRESS_STREETS_1_ACCESSFOOD
rename	STRESS_STREETS_2	STRESS_STREETS_2_SOCIAL_GETALONG
rename	STRESS_STREETS_3	STRESS_STREETS_3_ARRESTED
rename	STRESS_STREETS_4	STRESS_STREETS_4_FIND_WORK
rename	STRESS_STREETS_5	STRESS_STREETS_5_ASSAULT_PHYS
rename	STRESS_STREETS_6	STRESS_STREETS_6_PLACETOSLEEP
rename	STRESS_STREETS_7	STRESS_STREETS_7_HEALTHCARE
rename	STRESS_STREETS_8	STRESS_STREETS_8_SOCIETYMISTREAT
rename	STRESS_STREETS_9	STRESS_STREETS_9_PURPOSE_IN_LIFE
rename	STRESS_STREETS_10	STRESS_STREETS_10_EDUCATION
rename	STRESS_STREETS_11	STRESS_STREETS_11_BATHSHOWER
rename	STRESS_STREETS_12	STRESS_STREETS_12_LAUNDRY
rename	STRESS_STREETS_13	STRESS_STREETS_13_SOCIAL_HANGOUT
rename	STRESS_STREETS_14	STRESS_STREETS_14_ASSAULT_SEXUAL
rename	STRESS_STREETS_15	STRESS_STREETS_15_EARN_MONEY
rename	MSE_RELPROV	MSE_PROVIDER_POSITIVE_RELSHIP
rename	MSE_TALKTO	MSE_PROVIDER_TALK_SYSTEMSSUPPORT
rename	MSE_HOUSINGOPTS	MSE_KNOW_HOUSING_OPTIONS
rename	MSEPROGENGAGE_1	MSE_ACTIVITIES_EVER_1_EDUCATION
rename	MSEPROGENGAGE_2	MSE_ACTIVITIES_EVER_2_EMPLOYMENT
rename	MSEPROGENGAGE_3	MSE_ACTIVITIES_EVER_3_PAIDWORK
rename	MSEPROGENGAGE_4	MSE_ACTIVITIES_EVER_4_EDJOBEVENT
rename	MSEPROGENGAGE_5	MSE_ACTIVITIES_EVER_5_ART_MUSIC
rename	MSEPROGENGAGE_6	MSE_ACTIVITIES_EVER_6_YOGAMEDITA
rename	MSEPROGENGAGE_7	MSE_ACTIVITIES_EVER_7_PARENTPREG
rename	MSEPROGENGAGE_8	MSE_ACTIVITIES_EVER_8_COUNSL_GRP
rename	MSEPROGENGAGE_9	MSE_ACTIVITIES_EVER_9_LEGAL_AID
rename	MSEPROGENGAGE_10	MSE_ACTIVITIES_EVER_10_OTHER
rename	MSEPROGENGAGE_0	MSE_ACTIVITIES_EVER_0_NONE
rename	MSEPROGENGAGE_10_TEXT	MSE_ACTIVITIES_EVER_10_OTHER_TXT
rename	MSE_DROPINACCESS	MSE_PERCEIVED_ACCESS_DROPINS
rename	MSE_SHELTERACCESS	MSE_PERCEIVED_ACCESS_SHELTERS
rename	MSE_TXACCESS	MSE_PERCEIVED_ACCESS_TREATMENT
rename	INCMGEN_30DAY_1	INCOME_30DAY_TYPES_JOB_FT
rename	INCMGEN_30DAY_2	INCOME_30DAY_TYPES_JOB_PT_FTHRS
rename	INCMGEN_30DAY_3	INCOME_30DAY_TYPES_JOB_PT_PTHRS
rename	INCMGEN_30DAY_4	INCOME_30DAY_TYPES_TEMP_WORK
rename	INCMGEN_30DAY_5	INCOME_30DAY_TYPES_UNDER_TABLE
rename	INCMGEN_30DAY_15	INCOME_30DAY_TYPES_BENEFITS
rename	INCMGEN_30DAY_6	INCOME_30DAY_TYPES_SELLSELFMADE
rename	INCMGEN_30DAY_7	INCOME_30DAY_TYPES_FRIENDS
rename	INCMGEN_30DAY_8	INCOME_30DAY_TYPES_RELATIVES
rename	INCMGEN_30DAY_9	INCOME_30DAY_TYPES_PANHANDLING
rename	INCMGEN_30DAY_10	INCOME_30DAY_TYPES_SELLPERSONAL
rename	INCMGEN_30DAY_11	INCOME_30DAY_TYPES_RECYCLING
rename	INCMGEN_30DAY_12	INCOME_30DAY_TYPES_SELLBLOOD
rename	INCMGEN_30DAY_13	INCOME_30DAY_TYPES_SELLDRUGS
rename	INCMGEN_30DAY_14	INCOME_30DAY_TYPES_EXCHANGE_SEX
rename	INCMGEN_30DAY_16	INCOME_30DAY_TYPES_GAMBLING
rename	INCMGEN_30DAY_17	INCOME_30DAY_TYPES_STEALING
rename	INCMGEN_30DAY_18	INCOME_30DAY_TYPES_SELLSTOLEN
rename	EMPLOY_PAIDJOBS	EMPLOY_CURRENT_PAID_NUMBER_JOBS
rename	EMPLOY_TTLPAIDHRS	EMPLOY_CURRENT_PAID_HRS_WEEK
rename	TTLINCOME_EMPLOY	INCOME_TOTAL_MONTHLY_PAID_WORK
rename	TTLINCOME_BENEFITS	INCOME_TOTAL_MONTHLY_BENEFITS
rename	TTLINCOME_INFORMAL	INCOME_TOTAL_MONTHLY_INFORMAL
rename	HFIAS_1	HFIAS_30DAY_1_SUPPLY_WORRY
rename	HFIAS_1_A	HFIAS_FREQ_1_SUPPLY_WORRY
rename	HFIAS_2	HFIAS_30DAY_2_LIMITED_KINDS
rename	HFIAS_2_A	HFIAS_FREQ_2_LIMITED_KINDS
rename	HFIAS_3	HFIAS_30DAY_3_LIMITED_VARIETY
rename	HFIAS_3_A	HFIAS_FREQ_3_LIMITED_VARIETY
rename	HFIAS_4	HFIAS_30DAY_4_
rename	HFIAS_4_A	HFIAS_FREQ_4
rename	HFIAS_5	HFIAS_30DAY_5_MEALS_TOO_SMALL
rename	HFIAS_5_A	HFIAS_FREQ_5_MEALS_TOO_SMALL
rename	HFIAS_6	HFIAS_30DAY_6_MEALS_MISSED
rename	HFIAS_6_A	HFIAS_FREQ_6_MEALS_MISSED
rename	HFIAS_7	HFIAS_30DAY_7_NO_FOOD_IN_HOUSE
rename	HFIAS_7_A	HFIAS_FREQ_7_NO_FOOD_IN_HOUSE
rename	HFIAS_8	HFIAS_30DAY_8_SLEEP_HUNGRY
rename	HFIAS_8_A	HFIAS_FREQ_8_SLEEP_HUNGRY
rename	HFIAS_9	HFIAS_30DAY_9_NO_FOOD_DAY_NIGHT
rename	HFIAS_9_A	HFIAS_FREQ_9_NO_FOOD_DAY_NIGHT
rename	UCLA_PTSD_DISASTER	UCLA_TRAUMA_HX_1_DISASTER
rename	UCLA_PTSD_ACCIDENT	UCLA_TRAUMA_HX_2_ACCIDENT
rename	UCLA_PTSD_WAR	UCLA_TRAUMA_HX_3_WAR
rename	UCLA_PTSD_PHYSABUSE	UCLA_TRAUMA_HX_4_PHYSICALABUSE
rename	UCLA_PTSD_WITNESS	UCLA_TRAUMA_HX_5_WITNESSABUSE
rename	UCLA_PTSD_COMMVICT	UCLA_TRAUMA_HX_6_COMMUNITYTHREAT
rename	UCLA_PTSD_COMMWIT	UCLA_TRAUMA_HX_7_WITNESSVIOLENCE
rename	UCLA_PTSD_DEADBODY	UCLA_TRAUMA_HX_8_DEADBODY
rename	UCLA_PTSD_SEXABUSE	UCLA_TRAUMA_HX_9_SEXABUSE
rename	UCLA_PTSD_FAMILYVICT	UCLA_TRAUMA_HX_10_CLOSEVIOLENCE
rename	UCLA_PTSD_INJURY	UCLA_TRAUMA_HX_11_MEDICALTRAUMA
rename	UCLA_PTSD_FORCEDSEX	UCLA_TRAUMA_HX_12_FORCEDSEX
rename	UCLA_PTSD_DEATH	UCLA_TRAUMA_HX_13_CLOSEDEATH
rename	HEALTH	HEALTH_GENERAL
rename	CHRONICDX_1	DX_CHRONIC_RESPIRATORY
rename	CHRONICDX_2	DX_CHRONIC_DIABETES
rename	CHRONICDX_3	DX_CHRONIC_HYPERTENSION
rename	CHRONICDX_4	DX_CHRONIC_HEARTMURMUR
rename	CHRONICDX_5	DX_CHRONIC_CHOLESTEROL
rename	CHRONICDX_6	DX_CHRONIC_OBESITY
rename	CHRONICDX_7	DX_CHRONIC_CARDIOVASCULAR
rename	CHRONICDX_8	DX_CHRONIC_ANEMIA
rename	CHRONICDX_9	DX_CHRONIC_SEIZURES
rename	CHRONICDX_10	DX_CHRONIC_MIGRAINES
rename	CHRONICDX_11	DX_CHRONIC_SLEEPAPNEA
rename	CHRONICDX_12	DX_CHRONIC_INSOMNIA
rename	CHRONICDX_13	DX_CHRONIC_HEARING
rename	CHRONICDX_14	DX_CHRONIC_BLINDNESS
rename	CHRONICDX_15	DX_CHRONIC_ARTHRITIS
rename	CHRONICDX_16	DX_CHRONIC_SCOLIOSIS
rename	CHRONICDX_17	DX_CHRONIC_SCIATICA
rename	CHRONICDX_18	DX_CHRONIC_TB
rename	CHRONICDX_19	DX_CHRONIC_CANCER
rename	CHRONICDX_20	DX_CHRONIC_CIRRHOSIS
rename	CHRONICDX_21	DX_CHRONIC_KIDNEY
rename	CHRONICDX_22	DX_CHRONIC_THYROID
rename	CHRONICDX_23	DX_CHRONIC_OTHER_SELECTED
rename	CHRONICDX_0	DX_CHRONIC_NONE_SELECTED
rename	CHRONICDX_22_TEXT	DX_CHRONIC_OTHER_TEXT
rename	HEALTHNEEDS_1	HEALTHCARE_ACCESS_NEEDS_VISION
rename	HEALTHNEEDS_2	HEALTHCARE_ACCESS_NEEDS_DENTAL
rename	HEALTHNEEDS_3	HEALTHCARE_ACCESS_NEEDS_PRIMARY
rename	HEALTHNEEDS_4	HEALTHCARE_ACCESS_NEEDS_SEXREPRO
rename	HEALTHNEEDS_5	HEALTHCARE_ACCESS_NEEDS_PAIN
rename	HEALTHNEEDS_6	HEALTHCARE_ACCESS_NEEDS_PTREHAB
rename	HEALTHNEEDS_7	HEALTHCARE_ACCESS_NEEDS_WEIGHT
rename	HEALTHNEEDS_8	HEALTHCARE_ACCESS_NEEDS_HEARING
rename	HEALTHNEEDS_9	HEALTHCARE_ACCESS_NEEDS_SLEEP
rename	HEALTHNEEDS_10	HEALTHCARE_ACCESS_NEEDS_OTHER
rename	HEALTHNEEDS_10_TEXT	HEALTHCARE_ACCESS_NEEDS_OTHERTXT
rename	SD_SF1	SLEEP_DISTURBANCE_SF4A_1_QUALITY
rename	SD_SF2	SLEEP_DISTURBANCE_SF4A_2_REFRESH
rename	SD_SF3	SLEEP_DISTURBANCE_SF4A_3_PROBLEM
rename	SD_SF4	SLEEP_DISTURBANCE_SF4A_4_FALLSLP
rename	SD_SINCE	SLEEP_SINCE_HOUSED_QUALITY
rename	ISI7SRI	SLEEP_DAYTIMEIMPAIR_CURRENT_ISI7
rename	ISI7SRI_SINCE	SLEEP_SINCE_HOUSED_DAYTIMEIMPAIR
rename	SLEEP_SAFE	SLEEP_LOCATION_SAFE
rename	PHQ9_1	DEPRESSION_PHQ9_1_BL
rename	PHQ9_2	DEPRESSION_PHQ9_2_BL
rename	PHQ9_3	DEPRESSION_PHQ9_3_BL
rename	PHQ9_4	DEPRESSION_PHQ9_4_BL
rename	PHQ9_5	DEPRESSION_PHQ9_5_BL
rename	PHQ9_6	DEPRESSION_PHQ9_6_BL
rename	PHQ9_7	DEPRESSION_PHQ9_7_BL
rename	PHQ9_8	DEPRESSION_PHQ9_8_BL
rename	PHQ9_9	DEPRESSION_PHQ9_9_BL
rename	GAD7_1	ANXIETY_GAD7_1_BL
rename	GAD7_2	ANXIETY_GAD7_2_BL
rename	GAD7_3	ANXIETY_GAD7_3_BL
rename	GAD7_4	ANXIETY_GAD7_4_BL
rename	GAD7_5	ANXIETY_GAD7_5_BL
rename	GAD7_6	ANXIETY_GAD7_6_BL
rename	GAD7_7	ANXIETY_GAD7_7_BL
rename	GAD7_8	ANXIETY_GAD7_8_BL
rename	PTSD_1	PTSD_PCSCREEN_1
rename	PTSD_2	PTSD_PCSCREEN_2
rename	PTSD_3	PTSD_PCSCREEN_3
rename	PTSD_4	PTSD_PCSCREEN_4
rename	MH_DX_MH_DX_1	DX_MENTAL_ADHD
rename	MH_DX_MH_DX_2	DX_MENTAL_PTSD
rename	MH_DX_MH_DX_3	DX_MENTAL_ODCD
rename	MH_DX_MH_DX_4	DX_MENTAL_MAJORDEPRESSION
rename	MH_DX_MH_DX_5	DX_MENTAL_BIPOLAR
rename	MH_DX_MH_DX_6	DX_MENTAL_SCHIZOPHRENIAAFFECTIVE
rename	MH_DX_MH_DX_7	DX_MENTAL_ANXIETYPANIC
rename	MH_DX_MH_DX_8	DX_MENTAL_PERSONALITYD
rename	MH_DX_MH_DX_9	DX_MENTAL_OTHER_SELECTED
rename	MH_DX_OTHER	DX_MENTAL_OTHER_TEXT
rename	MH_CURRENT	MENTAL_HEALTH_ISSUES_30DAYEXTENT
rename	SUIC_THOUGHT	SUICIDE_THOUGHT_12MO
rename	SUIC_ATTEMPT	SUICIDE_ATTEMPT_12MO
rename	MED_12MO	MENTAL_HEALTH_TX_12MO_MEDICATION
rename	THER_12MO	MENTAL_HEALTH_TX_12MO_THERAPY
rename	ER_12MO	MENTAL_HEALTH_TX_12MO_ER
rename	HOSPIT_12MO	MENTAL_HEALTH_TX_12MO_INPATIENT
rename	UNMET_12MO	MENTAL_HEALTH_TX_12MO_UNMETNEED
rename	MHNEED_PERCEIVE	MENTAL_HEALTH_TX_CURRENT_NEED
rename	DERS_SF_DERS_SF_1	DERS_SF_AWARENESS_1_BL
rename	DERS_SF_DERS_SF_2	DERS_SF_CLARITY_2_BL
rename	DERS_SF_DERS_SF_6	DERS_SF_CLARITY_3_BL
rename	DERS_SF_DERS_SF_4	DERS_SF_AWARENESS_4_BL
rename	DERS_SF_DERS_SF_5	DERS_SF_CLARITY_5_BL
rename	DERS_SF_DERS_SF_3	DERS_SF_AWARENESS_6_BL
rename	DERS_SF_DERS_SF_8	DERS_SF_NONACCEPT_7
rename	DERS_SF_DERS_SF_9	DERS_SF_GOALS_8
rename	DERS_SF_DERS_SF_10	DERS_SF_IMPULSE_9
rename	DERS_SF_DERS_SF_11	DERS_SF_STRATEGIES_10
rename	DERS_SF_DERS_SF_12	DERS_SF_GOALS_11
rename	DERS_SF_DERS_SF_13	DERS_SF_NONACCEPT_12
rename	DERS_SF_DERS_SF_14	DERS_SF_GOALS_13
rename	DERS_SF_DERS_SF_15	DERS_SF_IMPULSE_14
rename	DERS_SF_DERS_SF_16	DERS_SF_STRATEGIES_15
rename	DERS_SF_DERS_SF_17	DERS_SF_NONACCEPT_16
rename	DERS_SF_DERS_SF_18	DERS_SF_IMPULSE_17
rename	DERS_SF_DERS_SF_19	DERS_SF_STRATEGIES_18
rename	PSS_1	PERCEIVED_STRESS_COHEN_1
rename	PSS_2	PERCEIVED_STRESS_COHEN_2
rename	PSS_3	PERCEIVED_STRESS_COHEN_3
rename	PSS_4	PERCEIVED_STRESS_COHEN_4
rename	COPING_1	COPING_STRATEGY_3MO_PROBLEMSOLVE
rename	COPING_2	COPING_STRATEGY_3MO_THINKTHROUGH
rename	COPING_3	COPING_STRATEGY_3MO_AVOIDTHINK
rename	COPING_4	COPING_STRATEGY_3MO_SLEEP
rename	COPING_5	COPING_STRATEGY_3MO_CONFIDE
rename	COPING_6	COPING_STRATEGY_3MO_THINKISOLATE
rename	COPING_7	COPING_STRATEGY_3MO_LEARN
rename	COPING_8	COPING_STRATEGY_3MO_USEANGER
rename	COPING_9	COPING_STRATEGY_3MO_SUBSTANCEUSE
rename	COPING_10	COPING_STRATEGY_3MO_HOBBY
rename	COPING_11	COPING_STRATEGY_3MO_VALUESELF
rename	COPING_12	COPING_STRATEGY_3MO_STRENGTH
rename	COPING_13	COPING_STRATEGY_3MO_FUTUREBETTER
rename	COPING_14	COPING_STRATEGY_3MO_SPIRITUAL
rename	COPING_0	COPING_STRATEGY_3MO_NONE
rename	LIFESEX_BEH	SEXUAL_ORIENTATION_BEHAVIOR_LIFE
rename	LIFESEX_PARTNUM	SEX_LIFETIME_PARTNER_NUM
rename	DESCRIBE_3MOPARTNER_3	SEX_3MO_PARTNER_TYPE_SERIOUS
rename	DESCRIBE_3MOPARTNER_2	SEX_3MO_PARTNER_TYPE_CASUAL
rename	DESCRIBE_3MOPARTNER_1	SEX_3MO_PARTNER_TYPE_HOOKUP
rename	DESCRIBE_3MOPARTNER_0	SEX_3MO_PARTNER_TYPE_NOSEX
rename	DESCRIBE_3MOPARTNER_4	SEX_3MO_PARTNER_TYPE_OTHER
rename	MOSEX_PARTGNDR_1	SEX_3MO_PARTNER_GENDER_MALE
rename	MOSEX_PARTGNDR_2	SEX_3MO_PARTNER_GENDER_FEMALE
rename	MOSEX_PARTGNDR_3	SEX_3MO_PARTNER_GENDER_TRANSMALE
rename	MOSEX_PARTGNDR_4	SEX_3MO_PARTNER_GENDER_TRANSFEML
rename	MOSEX_PARTGNDR_5	SEX_3MO_PARTNER_GENDER_GQNC
rename	MOSEX_PARTGNDR_6	SEX_3MO_PARTNER_GENDER_OTHER
rename	MOSEX_PARTGNDR_6_TEXT	SEX_3MO_PARTNER_GENDER_OTHER_TXT
rename	MOSEX_TYPES_1	SEX_3MO_TYPES_ANAL_WCONDOM
rename	MOSEX_TYPES_2	SEX_3MO_TYPES_ANAL_NOCONDOM
rename	MOSEX_TYPES_3	SEX_3MO_TYPES_ORAL_WCONDOM
rename	MOSEX_TYPES_4	SEX_3MO_TYPES_ORAL_NOCONDOM
rename	MOSEX_TYPES_5	SEX_3MO_TYPES_VAGINAL_WCONDOM
rename	MOSEX_TYPES_6	SEX_3MO_TYPES_VAGINAL_NOCONDOM
rename	MOSEX_PARTNUM	SEX_3MO_PARTNER_NUM_VAGINAL_ANAL
rename	MOSEX_PARTBIOSEX	SEX_3MO_PARTNER_BIOSEX
rename	MOSEX_CONDOMFREQ	SEX_3MO_CONDOM_FREQ
rename	MOSEX_CNTRCPTV_1	SEX_3MO_CONTRACEPTYPES_NONE
rename	MOSEX_CNTRCPTV_2	SEX_3MO_CONTRACEPTYPES_CONDOMS
rename	MOSEX_CNTRCPTV_3	SEX_3MO_CONTRACEPTYPES_BC_ORAL
rename	MOSEX_CNTRCPTV_4	SEX_3MO_CONTRACEPTYPES_BC_PATCH
rename	MOSEX_CNTRCPTV_5	SEX_3MO_CONTRACEPTYPES_IUD
rename	MOSEX_CNTRCPTV_6	SEX_3MO_CONTRACEPTYPES_WITHDRAW
rename	MOSEX_CNTRCPTV_7	SEX_3MO_CONTRACEPTYPES_FAM
rename	MOSEX_CNTRCPTV_8	SEX_3MO_CONTRACEPTYPES_OTHER
rename	MOSEX_CNTRCPTV_99	SEX_3MO_CONTRACEPTYPES_UNSURE
rename	MOSEX_CNTRCPTV_9_TEXT	SEX_3MO_CONTRACEPTYPES_OTHER_TXT
rename	MOSEX_CNTRCPTV_FAM	SEX_3MO_CONTRACEPTYPES_FAM_APP
rename	MOSEX_CNTRCPTV_PLAN	SEX_3MO_CONTRACEPTYPES_PLANB
rename	MOSEX_SUIFREQ	SEX_3MO_INTOXICATED_FREQ
rename	MOSEX_HIVCONVO	SEX_3MO_NO_HIV_TALK_BEFORE
rename	EXCHSEX_3MO	SEX_3MO_EXCHANGE_SEX
rename	EXCHSEX_TYPES_1	SEX_3MO_EXCHNGSEX_TYPE_A_WCONDOM
rename	EXCHSEX_TYPES_2	SEX_3MO_EXCHNGSEX_TYPE_A_NOCNDM
rename	EXCHSEX_TYPES_3	SEX_3MO_EXCHNGSEX_TYPE_O_WCONDOM
rename	EXCHSEX_TYPES_4	SEX_3MO_EXCHNGSEX_TYPE_O_NOCNDM
rename	EXCHSEX_TYPES_5	SEX_3MO_EXCHNGSEX_TYPE_V_WCNDM
rename	EXCHSEX_TYPES_6	SEX_3MO_EXCHNGSEX_TYPE_V_NOCONDM
rename	EXCHSEX_3MO_FORCED	SEX_3MO_EXCHANGE_SEX_FORCED
rename	FORCEDSEX_3MO	SEX_3MO_FORCED_SEX
rename	FORCEDSEXATTEMPT_3MO	SEX_3MO_FORCED_ATTEMPT
rename	HIV_ST	HIV_POS_EVER
rename	HIVP_WHEN	HIV_POS_TESTED_WHEN
rename	HIVP_TESTLOC	HIV_POS_TESTED_WHERE
rename	HIVP_TESTLOC_9_TEXT	HIV_POS_TESTED_WHERE_OTHER
rename	HIVP_PTCOUNSEL	HIV_POS_POSTTEST_COUNSEL
rename	HIVP_TX	HIV_POS_TX_CURRENT
rename	HIVP_TX_WHY_1	HIV_POS_TX_NOW_WHYNOT_CANMANAGE
rename	HIVP_TX_WHY_2	HIV_POS_TX_NOW_WHYNOT_EFFORT
rename	HIVP_TX_WHY_3	HIV_POS_TX_NOW_WHYNOT_MISTRUST
rename	HIVP_TX_WHY_4	HIV_POS_TX_NOW_WHYNOT_NOTINSURED
rename	HIVP_TX_WHY_6	HIV_POS_TX_NOW_WHYNOT_STIGMA
rename	HIVP_TX_WHY_5	HIV_POS_TX_NOW_WHYNOT_OTHER
rename	HIVP_TX_WHY_5_TEXT	HIV_POS_TX_NOW_WHYNOT_OTHERTXT
rename	HIVP_MEDS	HIV_POS_MEDS_NOW
rename	HIVP_MEDS_WHYNOT_1	HIV_POS_MEDS_NOW_WHYNOT_EFFORT
rename	HIVP_MEDS_WHYNOT_2	HIV_POS_MEDS_NOW_WHYNOT_SIDEFX
rename	HIVP_MEDS_WHYNOT_3	HIV_POS_MEDS_NOW_WHYNOT_RXBARR
rename	HIVP_MEDS_WHYNOT_4	HIV_POS_MEDS_NOW_WHYNOT_STORAGE
rename	HIVP_MEDS_WHYNOT_5	HIV_POS_MEDS_NOW_WHYNOT_EXPENSE
rename	HIVP_MEDS_WHYNOT_7	HIV_POS_MEDS_NOW_WHYNOT_STIGMA
rename	HIVP_MEDS_WHYNOT_6	HIV_POS_MEDS_NOW_WHYNOT_OTHER
rename	HIVP_MEDS_WHYNOT_6_TEXT	HIV_POS_MEDS_NOW_WHYNOT_OTHERTXT
rename	HIVN_LASTTEST	HIV_NEG_LASTTEST_WHEN
rename	HIVN_TESTLOC	HIV_NEG_LASTTEST_WHERE
rename	HIVN_TESTLOC_9_TEXT	HIV_NEG_LASTTEST_WHERE_TXT
rename	HIVN_GOTRESULT	HIV_NEG_LASTTEST_GOT_RESULT
rename	HIVN_PTCOUNSEL	HIV_NEG_LASTTEST_POST_COUNSEL
rename	STI_LAST	STI_LAST_TESTED
rename	STI_POS_1	STI_POSEVER_CHALMYDIA
rename	STI_POS_2	STI_POSEVER_GONORRHEA
rename	STI_POS_3	STI_POSEVER_SYPHILIS
rename	STI_POS_4	STI_POSEVER_HERPES
rename	STI_POS_5	STI_POSEVER_HPV
rename	STI_POS_6	STI_POSEVER_HEPB
rename	STI_POS_7	STI_POSEVER_OTHER_SELECTED
rename	STI_POS_88	STI_POSEVER_NO_RESULTS_RETRIEVED
rename	STI_POS_0	STI_POSEVER_NONE
rename	STI_POS_7_TEXT	STI_POSEVER_OTHER_TEXT
rename	CHLAM_POS_LAST	STI_POSEVER_CHALMYDIA_LASTPOS
rename	GONO_POS_LAST	STI_POSEVER_GONORRHEA_LASTPOS
rename	SYPH_POS_LAST	STI_POSEVER_SYPHILIS_LASTPOS
rename	HERP_POS_LAST	STI_POSEVER_HERPES_LASTPOS
rename	HPV_POS_LAST	STI_POSEVER_HPV_LASTPOS
rename	HEPB_POS_LAST	STI_POSEVER_HEPB_LASTPOS
rename	OTHER_POS_LAST	STI_POSEVER_OTHER_LASTPOS_TEXT
rename	HCV_LASTTEST	HCV_LAST_TESTED
rename	HCV_STATUS	HCV_LAST_TEST_POSITIVE
rename	HCV_TX	HCV_POSITIVE_CURRENT_TX
rename	PREP_KNOW	PREP_KNOWLEDGE
rename	PREP_WHERELEARD_1	PREP_WHERE_LEARNED_DOCTOR
rename	PREP_WHERELEARD_2	PREP_WHERE_LEARNED_AD
rename	PREP_WHERELEARD_3	PREP_WHERE_LEARNED_FRIEND
rename	PREP_WHERELEARD_4	PREP_WHERE_LEARNED_FAMILY
rename	PREP_WHERELEARD_5	PREP_WHERE_LEARNED_SEXPARTNER
rename	PREP_WHERELEARD_6	PREP_WHERE_LEARNED_INTERNET
rename	PREP_WHERELEARD_7	PREP_WHERE_LEARNED_PROVIDER
rename	PREP_WHERELEARD_8	PREP_WHERE_LEARNED_RESEARCHSTUDY
rename	PREP_WHERELEARD_9	PREP_WHERE_LEARNED_OTHER
rename	PREP_WHERELEARD_9_TEXT	PREP_WHERE_LEARNED_OTHER_TEXT
rename	PREP_SOCIAL	PREP_ALTER_TAKING
rename	PREP_SOCIAL_WHO_1	PREP_ALTER_TYPE_FRIEND_PREHMLS
rename	PREP_SOCIAL_WHO_2	PREP_ALTER_TYPE_FRIEND_STREET
rename	PREP_SOCIAL_WHO_3	PREP_ALTER_TYPE_FAMILY
rename	PREP_SOCIAL_WHO_4	PREP_ALTER_TYPE_SEXPARTNER
rename	PREP_SOCIAL_WHO_5	PREP_ALTER_TYPE_PROVIDER
rename	PREP_SOCIAL_WHO_6	PREP_ALTER_TYPE_CLASSMATE
rename	PREP_SOCIAL_WHO_7	PREP_ALTER_TYPE_COWORKER
rename	PREP_RX_EVER	PREP_EVER_RX
rename	PREP_CURRENTLYTAKING	PREP_CURRENTLY_TAKING
rename	PREP_INTEREST	PREP_NOTTAKING_INTEREST
rename	PREP_BARRIERS_1	PREP_NOTTAKING_BARRIER_LOWRISK
rename	PREP_BARRIERS_2	PREP_NOTTAKING_BARRIER_KNOWLEDGE
rename	PREP_BARRIERS_3	PREP_NOTTAKING_BARRIER_ANTIRX
rename	PREP_BARRIERS_4	PREP_NOTTAKING_BARRIER_EFFORT
rename	PREP_BARRIERS_5	PREP_NOTTAKING_BARRIER_SIDE_FX
rename	PREP_BARRIERS_6	PREP_NOTTAKING_BARRIER_GETTINGRX
rename	PREP_BARRIERS_7	PREP_NOTTAKING_BARRIER_EXPENSE
rename	PREP_BARRIERS_8	PREP_NOTTAKING_BARRIER_OTHMETHOD
rename	PREP_BARRIERS_11	PREP_NOTTAKING_BARRIER_STIGMA
rename	PREP_BARRIERS_9	PREP_NOTTAKING_BARRIER_OTHER
rename	PREP_BARRIERS_10	PREP_NOTTAKING_BARRIER_NONE
rename	PREP_BARRIERS_9_TEXT	PREP_NOTTAKING_BARRIER_OTHER_TXT
rename	PREG_FREQ	PREGNANCIES_EVER_TOTAL
rename	PREG_UNPLAN	PREGNANCIES_EVER_UNPLANNED
rename	PREG_CHILD	CHILDREN_EVER_TOTAL
rename	PREG_LIVE	CHILDREN_CURRENT_LIVEWITH
rename	SUTYPES_USE_EVER_1	TOBACCO_EVER
rename	SUTYPES_USE_EVER_2	ALCOHOL_EVER
rename	SUTYPES_USE_EVER_3	MARIJUANA_EVER
rename	SUTYPES_USE_EVER_4	METH_EVER
rename	SUTYPES_USE_EVER_5	MDMA_EVER
rename	SUTYPES_USE_EVER_6	SYNTHETIC_MJ_EVER
rename	SUTYPES_USE_EVER_7	HALLUCINOGEN_EVER
rename	SUTYPES_USE_EVER_8	RXMISUSE_EVER
rename	SUTYPES_USE_EVER_9	HEROIN_EVER
rename	SUTYPES_USE_EVER_10	COCAINE_EVER
rename	SUTYPES_USE_EVER_11	CRACK_EVER
rename	SUTYPES_USE_EVER_12	INHALANTS_EVER
rename	SUTYPES_USE_EVER_13	STEROID_EVER
rename	SUTYPES_USE_EVER_14	NITROUS_EVER
rename	SUTYPES_USE_EVER_15	KETAMINE_EVER
rename	SUTYPES_USE_EVER_16	PCP_EVER
rename	SUTYPES_USE_EVER_17	OTHERDRUG_EVER_SELECTED
rename	SUTYPES_USE_EVER_0	NO_SUBSTANCE_USE_EVER
rename	OTHERSU_TYPE	OTHERDRUG_EVER_TEXT
rename	TOBACCO_LAST	TOBACCO_LAST_USE
rename	TOBACCO_TYPES_1	TOBACCO_30DAY_TYPES_SMOKED
rename	TOBACCO_TYPES_2	TOBACCO_30DAY_TYPES_VAPED
rename	TOBACCO_TYPES_3	TOBACCO_30DAY_TYPES_CHEWING
rename	TOBACCO_TYPES_4	TOBACCO_30DAY_TYPES_OTHER
rename	TOBACCO_TYPES_4_TEXT	TOBACCO_30DAY_TYPES_OTHER_TEXT
rename	TOBACCO_SMOKEFREQ	TOBACCO_FREQ_SMOKE
rename	TOBACCO_DAILYAMT_1	TOBACCO_QUANT_SMOKE_DAILY_CIG
rename	TOBACCO_DAILYAMT_2	TOBACCO_QUANT_SMOKE_DAILY_ROLLED
rename	TOBACCO_DAILYAMT_3	TOBACCO_QUANT_SMOKE_DAILY_KRETEK
rename	TOBACCO_DAILYAMT_4	TOBACCO_QUANT_SMOKE_DAILY_PIPE
rename	TOBACCO_DAILYAMT_5	TOBACCO_QUANT_SMOKE_DAILY_CIGARS
rename	TOBACCO_DAILYAMT_6	TOBACCO_QUANT_SMOKE_DAILY_HOOKAH
rename	TOBACCO_DAILYAMT_7	TOBACCO_QUANT_SMOKE_DAILY_OTHTXT
rename	TOBACCO_DAILYAMT_8	TOBACCO_QUANT_SMOKE_DAILY_OTHAMT
rename	TOBACCO_WEEKLYAMT_1	TOBACCO_QUANT_SMOKE_WEEK_CIG
rename	TOBACCO_WEEKLYAMT_2	TOBACCO_QUANT_SMOKE_WEEK_ROLLCIG
rename	TOBACCO_WEEKLYAMT_3	TOBACCO_QUANT_SMOKE_WEEK_KRETEK
rename	TOBACCO_WEEKLYAMT_4	TOBACCO_QUANT_SMOKE_WEEK_PIPE
rename	TOBACCO_WEEKLYAMT_5	TOBACCO_QUANT_SMOKE_WEEK_CIGARS
rename	TOBACCO_WEEKLYAMT_6	TOBACCO_QUANT_SMOKE_WEEK_HOOKAH
rename	TOBACCO_WEEKLYAMT_7	TOBACCO_QUANT_SMOKE_WEEK_OTHTEXT
rename	TOBACCO_WEEKLYAMT_8	TOBACCO_QUANT_SMOKE_WEEK_OTHAMT
rename	TOBACCO_SMOKELESSFRE	TOBACCO_FREQ_SMOKELESS
rename	TOBACCO_VEPFREQ	TOBACCO_FREQ_VAPE
rename	ALC_LAST	ALCOHOL_LAST_USE
rename	ALC_30	ALCOHOL_30DAY_FREQ
rename	ALC_30_BINGE_F	ALCOHOL_30DAY_FREQ_BINGE_F
rename	ALC_30_BINGE_M	ALCOHOL_30DAY_FREQ_BINGE_M
rename	MARJ_LAST	MARIJUANA_LAST_USE
rename	MARJ_30	MARIJUANA_30DAY_FREQ
rename	MARJ_30_TYPES_1	MARIJUANA_30DAY_TYPE_PLANT
rename	MARJ_30_TYPES_2	MARIJUANA_30DAY_TYPE_CONCENTRATE
rename	MARJ_30_TYPES_3	MARIJUANA_30DAY_TYPE_EDIBLE
rename	MARJ_30_TYPES_4	MARIJUANA_30DAY_TYPE_SPRAY
rename	MARJ_30_TYPES_5	MARIJUANA_30DAY_TYPE_OTHER
rename	MARJ_30_TYPES_2_TEXT	MARIJUANA_30DAY_TYPE_OTHER_TEXT
rename	MARJ_30_ROA_1	MARIJUANA_30DAY_ROA_PIPE
rename	MARJ_30_ROA_2	MARIJUANA_30DAY_ROA_BONG
rename	MARJ_30_ROA_3	MARIJUANA_30DAY_ROA_JOINT
rename	MARJ_30_ROA_4	MARIJUANA_30DAY_ROA_BLUNT
rename	MARJ_30_ROA_5	MARIJUANA_30DAY_ROA_SPLIFF
rename	MARJ_30_ROA_6	MARIJUANA_30DAY_ROA_VAPEPLANT
rename	MARJ_30_ROA_7	MARIJUANA_30DAY_ROA_VAPEPEN
rename	MARJ_30_ROA_8	MARIJUANA_30DAY_ROA_DABS
rename	MARJ_30_ROA_9	MARIJUANA_30DAY_ROA_EDIBLE
rename	MARJ_30_ROA_10	MARIJUANA_30DAY_ROA_OTHER
rename	MARJ_30_ROA_11_TEXT	MARIJUANA_30DAY_ROA_OTHER_TEXT
rename	MARJ_FREQ_CURR	MARIJUANA_FREQ_CURRENT
rename	MARJ_HPD30D	MARIJUANA_QUANT_30DAY_HITSPERDAY
rename	MARJ_FREQACCPT	MARIJUANA_PERCEIVE_ACCEPTABLEUSE
rename	MARJ_AMTWK_MARJ_AMTWK_1	MARIJUANA_QUANT_30DAY_PLANTPERWK
rename	MARJ_AMTWK_MARJ_AMTWK_2	MARIJUANA_QUANT_30DAY_CONCPERWK
rename	MARJ_ACCESS_8	MARIJUANA_ACCESS_REC_SHOP
rename	MARJ_ACCESS_1	MARIJUANA_ACCESS_MED_SHOP
rename	MARJ_ACCESS_2	MARIJUANA_ACCESS_MED_DELIVERY
rename	MARJ_ACCESS_3	MARIJUANA_ACCESS_DEALER_MEDICAL
rename	MARJ_ACCESS_4	MARIJUANA_ACCESS_FRIEND_MEDICAL
rename	MARJ_ACCESS_5	MARIJUANA_ACCESS_FAMILY_MEDICAL
rename	MARJ_ACCESS_6	MARIJUANA_ACCESS_NONLEGAL_SOURCE
rename	MARJ_ACCESS_7	MARIJUANA_ACCESS_GROW
rename	MARJ_CARD	MARIJAUNA_MEDICAL_CARD
rename	METH_LAST	METH_LAST_USE
rename	METH_30	METH_30DAY_FREQ
rename	METH_30_ROA_1	METH_30DAY_ROA_SMOKED
rename	METH_30_ROA_2	METH_30DAY_ROA_NASAL
rename	METH_30_ROA_3	METH_30DAY_ROA_INTRAVENOUS
rename	METH_30_ROA_4	METH_30DAY_ROA_ORAL
rename	METH_30_ROA_5	METH_30DAY_ROA_OTHER
rename	MDMA_LAST	MDMA_LAST_USE
rename	MDMA_30	MDMA_30DAY_FREQ
rename	MDMA_30_ROA_2	MDMA_30DAY_ROA_NASAL
rename	MDMA_30_ROA_3	MDMA_30DAY_ROA_INTRAVENOUS
rename	MDMA_30_ROA_4	MDMA_30DAY_ROA_ORAL
rename	MDMA_30_ROA_5	MDMA_30DAY_ROA_OTHER
rename	SYNTHMJ_LAST	SYNTHETIC_MJ_LAST_USE
rename	SYNTHMJ_30	SYNTHETIC_MJ_30DAY_FREQ
rename	HALLUC_LAST	HALLUCINOGEN_LAST_USE
rename	HALLUC_30	HALLUCINOGEN_30DAY_FREQ
rename	HALLUC_30_TYPES_1	HALLUCINOGEN_30DAY_TYPE_LSD
rename	HALLUC_30_TYPES_2	HALLUCINOGEN_30DAY_TYPE_SHROOMS
rename	HALLUC_30_TYPES_3	HALLUCINOGEN_30DAY_TYPE_DMT
rename	HALLUC_30_TYPES_4	HALLUCINOGEN_30DAY_TYPE_PEYOTE
rename	HALLUC_30_TYPES_5	HALLUCINOGEN_30DAY_TYPE_OTHER
rename	HALLUC_30_TYPES_5_TEXT	HALLUCINOGEN_30DAY_TYPE_OTHERTXT
rename	PDM_LAST	RXMISUSE_LAST_USE
rename	PDM_30	RXMISUSE_30DAY_FREQ
rename	PDM_30_ROA_4	RXMISUSE_30DAY_ROA_ORAL
rename	PDM_30_ROA_2	RXMISUSE_30DAY_ROA_NASAL
rename	PDM_30_ROA_3	RXMISUSE_30DAY_ROA_INTRAVENOUS
rename	PDM_30_ROA_1	RXMISUSE_30DAY_ROA_SMOKED
rename	PDM_30_ROA_5	RXMISUSE_30DAY_ROA_OTHER
rename	PDM_30_TYPES_1	RXMISUSE_30DAY_TYPE_STIMULANTS
rename	PDM_30_TYPES_2	RXMISUSE_30DAY_TYPE_SEDATIVES
rename	PDM_30_TYPES_3	RXMISUSE_30DAY_TYPE_OPIODS
rename	PDM_30_TYPES_4	RXMISUSE_30DAY_TYPE_OTHER
rename	PDM_30_TYPES_4_TEXT	RXMISUSE_30DAY_TYPE_OTHER_TEXT
rename	HEROIN_LAST	HEROIN_LAST_USE
rename	HEROIN_30	HEROIN_30DAY_FREQ
rename	HEROIN_30_ROA_2	HEROIN_30DAY_ROA_NASAL
rename	HEROIN_30_ROA_3	HEROIN_30DAY_ROA_INTRAVENOUS
rename	HEROIN_30_ROA_1	HEROIN_30DAY_ROA_SMOKED
rename	HEROIN_30_ROA_5	HEROIN_30DAY_ROA_OTHER
rename	COCAINE_LAST	COCAINE_LAST_USE
rename	COCAINE_30	COCAINE_30DAY_FREQ
rename	COCAINE_30_ROA_2	COCAINE_30DAY_ROA_NASAL
rename	COCAINE_30_ROA_3	COCAINE_30DAY_ROA_INTRAVENOUS
rename	COCAINE_30_ROA_1	COCAINE_30DAY_ROA_SMOKED
rename	COCAINE_30_ROA_4	COCAINE_30DAY_ROA_ORALGUMS
rename	COCAINE_30_ROA_5	COCAINE_30DAY_ROA_OTHER
rename	CRACK_LAST	CRACK_LAST_USE
rename	CRACK_30	CRACK_30DAY_FREQ
rename	CRACK_30_ROA_1	CRACK_30DAY_ROA_SMOKED
rename	CRACK_30_ROA_2	CRACK_30DAY_ROA_NASAL
rename	CRACK_30_ROA_3	CRACK_30DAY_ROA_INTRAVENOUS
rename	CRACK_30_ROA_5	CRACK_30DAY_ROA_OTHER
rename	INHAL_LAST	INHALANTS_LAST_USE
rename	INHAL_30	INHALANTS_30DAY_FREQ
rename	STEROID_LAST	STEROID_LAST_USE
rename	STEROID_30	STEROID_30DAY_FREQ
rename	STEROID_30_ROA_4	STEROID_30DAY_ROA_ORAL
rename	STEROID_30_ROA_3	STEROID_30DAY_ROA_INTRAVENOUS
rename	STEROID_30_ROA_5	STEROID_30DAY_ROA_OTHER
rename	NITROUS_LAST	NITROUS_LAST_USE
rename	NITROUS_30	NITROUS_30DAY_FREQ
rename	KETA_LAST	KETAMINE_LAST_USE
rename	KETA_30	KETAMINE_30DAY_FREQ
rename	PCP_LAST	PCP_LAST_USE
rename	PCP_30	PCP_30DAY_FREQ
rename	PCP_30_ROA_1	PCP_30DAY_ROA_SMOKED
rename	PCP_30_ROA_2	PCP_30DAY_ROA_NASAL
rename	PCP_30_ROA_4	PCP_30DAY_ROA_ORAL
rename	PCP_30_ROA_3	PCP_30DAY_ROA_INTRAVENOUS
rename	PCP_30_ROA_5	PCP_30DAY_ROA_OTHER
rename	OTHERSU_LAST	OTHERDRUG_LAST_USE
rename	OTHERSU_30	OTHERDRUG_30DAY_FREQ
rename	OTHERSU_30_ROA_1	OTHERDRUG_30DAY_ROA_SMOKED
rename	OTHERSU_30_ROA_2	OTHERDRUG_30DAY_ROA_NASAL
rename	OTHERSU_30_ROA_4	OTHERDRUG_30DAY_ROA_ORAL
rename	OTHERSU_30_ROA_3	OTHERDRUG_30DAY_ROA_INTRAVENOUS
rename	OTHERSU_30_ROA_5	OTHERDRUG_30DAY_ROA_OTHER
rename	OTHERSU_30_ROA_5_TEXT	OTHERDRUG_30DAY_ROA_OTHER_TEXT
rename	IVDU_NEEDLEEXH	NEEDLE_EXCHANGE_USE_EVER
rename	IVDU_NEEDLEPURCH	NEEDLE_PURCHASE_NONMEDICAL
rename	EXCH_30DAYS	NEEDLE_EXCHANGE_USE_30DAY
rename	EXCH_WHERE_1	NEEDLE_ACCESS_MOBILE_CLINIC
rename	EXCH_WHERE_2	NEEDLE_ACCESS_HOSPITAL
rename	EXCH_WHERE_3	NEEDLE_ACCESS_PUBLICHEALTHCENTER
rename	EXCH_WHERE_4	NEEDLE_ACCESS_FREE_CLINIC
rename	EXCH_WHERE_5	NEEDLE_ACCESS_DROPIN
rename	EXCH_WHERE_6	NEEDLE_ACCESS_HIV_HCV_TXPLACE
rename	EXCH_WHERE_7	NEEDLE_ACCCESS_OTHER_SELECTED
rename	EXCH_WHERE_7_TEXT	NEEDLE_ACCESS_OTHER_TEXT
rename	IVDU_EVER	INJECTDRUG_EVER
rename	IVDU_30DAY	INJECTDRUG_30DAY_FREQ
rename	IVDU_SHARE	INJECTDRUG_30DAY_NEEDLE_SHARE
rename	IVDU_REUSE	INJECTDRUG_30DAY_NEEDLEREUSE
rename	IVDU_REUSE_QUANT	INJECTDRUG_30DAY_NEEDLEREUSE_NUM
rename	SUTX_EVER	SU_TREATMENT_EVER
rename	SYTX_PASTYEAR	SU_TREATMENT_PAST_YEAR
rename	CAGE2	CAGE_2_ANNOYEDBYCRITICISM
rename	CAGE1	CAGE_1_CUTDOWN
rename	CAGE3	CAGE_3_GUILTY
rename	CAGE4	CAGE_4_EYEOPENER
rename	SUCOST_30D_ALCOHOL	SPEND_SU_30DAY_ALCOHOL
rename	SUCOST_30D_ALCOHOL_1_TEXT	SPEND_SU_30DAY_ALCOHOL_SUB50TXT
rename	SUCOST_30D_MARJ	SPEND_SU_30DAY_MARIJUANA
rename	SUCOST_30D_MARJ_X1_TEXT	SPEND_SU_30DAY_MARIJUANA_SUB50TX
rename	SUCOST_30D_ILDRUG	SPEND_SU_30DAY_OTHDRUGS
rename	SUCOST_30D_ILDRUG_XX1_TEXT	SPEND_SU_30DAY_OTHDRUGS_SUB50TXT
rename	TECHACCESS_1	TECH_OWN_SMARTPHONE
rename	TECHACCESS_2	TECH_OWN_CELLPHONE
rename	TECHACCESS_3	TECH_OWN_COMPUTER
rename	TECHACCESS_4	TECH_OWN_TABLET
rename	TECHACCESS_0	TECH_OWN_NONE
rename	TECH_ACCESS_NOOWN_1	TECH_ACCESS_ONLY_SMARTPHONE
rename	TECH_ACCESS_NOOWN_2	TECH_ACCESS_ONLY_CELLPHONE
rename	TECH_ACCESS_NOOWN_3	TECH_ACCESS_ONLY_COMPUTER
rename	TECH_ACCESS_NOOWN_4	TECH_ACCESS_ONLY_TABLET
rename	TECH_ACCESS_NOOWN_0	TECH_ACCESS_ONLY_NONE
rename	TECH_ACCESS_WHERE_1	TECH_ACCESS_WHERE_YOUTH_AGENCY
rename	TECH_ACCESS_WHERE_2	TECH_ACCESS_WHERE_LIBRARY
rename	TECH_ACCESS_WHERE_3	TECH_ACCESS_WHERE_PLACE_OF_STAY
rename	TECH_ACCESS_WHERE_4	TECH_ACCESS_WHERE_BORROW_FRIENDS
rename	TECH_ACCESS_WHERE_5	TECH_ACCESS_WHERE_SCHOOL
rename	TECH_ACCESS_WHERE_6	TECH_ACCESS_WHERE_WORK
rename	TECH_ACCESS_WHERE_7	TECH_ACCESS_WHERE_INTERNET_CAFE
rename	TECH_ACCESS_WHERE_9	TECH_ACCESS_WHERE_FAMILY
rename	TECH_ACCESS_WHERE_8	TECH_ACCESS_WHERE_OTHER_SELECTED
rename	TECH_ACCESS_WHERE_8_TEXT	TECH_ACCESS_WHERE_OTHER_TEXT
rename	CELL_PLAN	PHONE_PLAN_TYPE
rename	CELL_BILL_1	PHONE_PAYBILL_ME
rename	CELL_BILL_2	PHONE_PAYBILL_PARENT
rename	CELL_BILL_3	PHONE_PAYBILL_PARTNER
rename	CELL_BILL_4	PHONE_PAYBILL_BOSS
rename	CELL_BILL_5	PHONE_PAYBILL_FRIEND
rename	CELL_BILL_6	PHONE_PAYBILL_SIBLING
rename	CELL_BILL_7	PHONE_PAYBILL_FAMILYOTHER
rename	CELL_BILL_8	PHONE_PAYBILL_OTHER
rename	CELL_BILL_6_TEXT	PHONE_PAYBILL_FAMILYOTHER_TEXT
rename	CELL_BILL_7_TEXT	PHONE_PAYBILL_OTHER_TEXT
rename	CELL_TURNOVER	PHONE_TURNOVER_QUANT_12MO
rename	CEL_USE_1	PHONE_USES_TEXTCALL_FRIENDS
rename	CEL_USE_2	PHONE_USES_TEXTCALL_FAMILY
rename	CEL_USE_3	PHONE_USES_EMAIL
rename	CEL_USE_4	PHONE_USES_INTERNET
rename	CEL_USE_5	PHONE_USES_FINDSERVICES
rename	CEL_USE_6	PHONE_USES_FINDJOBS
rename	CEL_USE_7	PHONE_USES_SOCIALMEDIA
rename	CEL_USE_8	PHONE_USES_DATINGAPPS
rename	CEL_USE_9	PHONE_USES_NAVIGATION
rename	CEL_USE_10	PHONE_USES_MUSIC
rename	CEL_USE_11	PHONE_USES_VIDEO
rename	CEL_USE_12	PHONE_USES_EMERGENCYONLY
rename	CEL_USE_13	PHONE_USES_OTHER_SELECTED
rename	CEL_USE_13_TEXT	PHONE_USES_OTHER_TEXT
rename	CELL_CHARGE	PHONE_CHARGE_DIFFICULTY
rename	CELL_CHARGE_ACCESS_1	PHONE_CHARGE_ACCESS_YOUTHAGENCY
rename	CELL_CHARGE_ACCESS_2	PHONE_CHARGE_ACCESS_LIBRARY
rename	CELL_CHARGE_ACCESS_3	PHONE_CHARGE_ACCESS_MYPLACE
rename	CELL_CHARGE_ACCESS_4	PHONE_CHARGE_ACCESS_FRIENDSPLACE
rename	CELL_CHARGE_ACCESS_5	PHONE_CHARGE_ACCESS_FAMILYPLACE
rename	CELL_CHARGE_ACCESS_6	PHONE_CHARGE_ACCESS_WIFISPACE
rename	CELL_CHARGE_ACCESS_7	PHONE_CHARGE_ACCESS_SCHOOL
rename	CELL_CHARGE_ACCESS_8	PHONE_CHARGE_ACCESS_WORK
rename	CELL_CHARGE_ACCESS_9	PHONE_CHARGE_ACCESS_OPENOUTLET
rename	CELL_CHARGE_ACCESS_77	PHONE_CHARGE_ACCESS_NOCHARGENEED
rename	TECH_BARRIERS_1	PHONE_BENEFITS_INTOUCH_FRIENDS
rename	TECH_BARRIERS_2	PHONE_BENEFITS_INTOUCH_FAMILY
rename	TECH_BARRIERS_3	PHONE_BENEFITS_FIND_SERVICES
rename	TECH_BARRIERS_4	PHONE_BENEFITS_FIND_JOBS
rename	TECH_BARRIERS_5	PHONE_BENEFITS_SOCIALDATING
rename	TECH_BARRIERS_6	PHONE_BENEFITS_NAVIGATION
rename	TECH_BARRIERS_7	PHONE_BENEFITS_MUSIC
rename	TECH_BARRIERS_8	PHONE_BENEFITS_VIDEO
rename	TECH_BARRIERS_9	PHONE_BENEFITS_EMERGENCYSERVICES
rename	TECH_BARRIERS_10	PHONE_BENEFITS_OTHER_SELECTED
rename	TECH_BARRIERS_10_TEXT	PHONE_BENEFITS_OTHER_TEXT
rename	VICT_ROBBERY	VICTIM_ROBBERY_SINCE_HOMELESS
rename	VICT_IPV_VIC	VICTIM_IPV_SINCE_HOMELESS
rename	VICT_IPV_PERP	PERPETRATE_IPV_SINCE_HOMELESS
rename	VICT_ASSLT	VICTIM_ASSAULT_SINCE_HOMELESS
rename	PERP_ASSLT	PERPETRATE_ASSAULT_SINCEHOMELESS
rename	GANG_CUR	GANG_MEMBER_EVER
rename	GANG_FMR	GANG_MEMBER_CURRENT
rename	GANG_AGE_1	GANG_AGE_JOINED
rename	GANG_AFF_1	GANG_AFFILIATE_CLOSEFRIEND
rename	GANG_AFF_2	GANG_AFFILIATE_FAMILY
rename	GANG_AFF_3	GANG_AFFILIATE_PARTNER
rename	GANG_AFF_4	GANG_AFFILIATE_OTHER_SELECTED
rename	GANG_AFF_0	GANG_AFFILIATE_NONE
rename	GANG_AFF_4_TEXT	GANG_AFFILIATE_OTHER_TEXT
rename	STREETFAMILY	STREET_FAMILY
rename	POLICEINTGEN	POLICE_GENERAL_INTERACT
rename	POLICEINT_3MO	POLICE_3MO_INTERACT_QUANT
rename	POLICEIN_3MO_EXP	POLICE_3MO_EXPERIENCE
rename	POLICEIN_3MO_WHY_1	POLICE_3MO_CNTXT_CALLED_FOROTHER
rename	POLICEIN_3MO_WHY_2	POLICE_3MO_CNTXT_CALLED_FORME
rename	POLICEIN_3MO_WHY_3	POLICE_3MO_CNTXT_STOPPEDSUSPECT
rename	POLICEIN_3MO_WHY_4	POLICE_3MO_CNTXT_STOPPEDNOREASON
rename	POLICEIN_3MO_WHY_5	POLICE_3MO_CNTXT_STOPPEDWHOIAM
rename	POLICEIN_3MO_WHY_6	POLICE_3MO_CNTXT_OTHER
rename	AVOIDPOLICE	POLICE_GENERAL_AVOID
rename	CASEY_LOCUSCONTROL	CASEY_FORWARD_LOCUS_OF_CONTROL
rename	CASEY_FUTURETHINK	CASEY_FORWARD_FUTURE_VISION
rename	CASEY_RELATIONSHIPS	CASEY_FORWARD_TRUSTED_ADULT
rename	CASEY_MODELING	CASEY_FORWARD_HELP_OTHER_YOUTH
rename	CASEY_SUCCESSREL	CASEY_FORWARD_SUCCESSFULRELSHIPS
rename	CASEY_TRANSITION	CASEY_FORWARD_NEXT_PHASE_READY
rename	CASEY_PRIDE	CASEY_FORWARD_PROUD_DAILY_LIFE
rename	CASEY_SELFEFFICACY	CASEY_FORWARD_SELF_EFFICACY
drop	Q523	
//	N/A	SPECIAL_NOTE_BL_ANY
//	N/A	SPECIAL_NOTE_BL_TEXT
//	N/A	
//	N/A	
//	N/A	QUALTRICS_DATE_START_SNI
//	N/A	QUALTRICS_DATE_END_SNI
//	N/A	QUALTRICS_STATUS_SNI
//	N/A	
//	N/A	QUALTRICS_PROGRESS_SNI
//	N/A	QUALTRICS_DURATION_SECONDS_SNI
//	N/A	QUALTRICS_FINISHED_SNI
//	N/A	QUALTRICS_DATE_RECORDED_SNI
//	N/A	QUALTRICS_RESPONSE_ID_SNI
//	N/A	
//	N/A	
//	N/A	
//	N/A	
//	N/A	QUALTRICS_LOCATION_LATITUDE_SNI
//	N/A	QUALTRICS_LOCATION_LONGITUDE_SNI
//	N/A	QUALTRICS_DISTRIBUTION_TYPE_SNI
//	N/A	QUALTRICS_USER_LANGUAGE_SNI
//	N/A	SURVEY_TYPE_H_UH_SNI
//	N/A	PID_SNI
rename	SNI_INST_GEN_29_TEXT	A1_ID_SNI
rename	SNI_INST_GEN_30_TEXT	A2_ID_SNI
rename	SNI_INST_GEN_31_TEXT	A3_ID_SNI
rename	SNI_INST_GEN_32_TEXT	A4_ID_SNI
rename	SNI_INST_GEN_33_TEXT	A5_ID_SNI
rename	SNI_GEN_X29	A1_GENDER
drop	SNI_GEN_X29_TEXT	
rename	SNI_GEN_X30	A2_GENDER
drop	SNI_GEN_X30_TEXT	
rename	SNI_GEN_X31	A3_GENDER
drop	SNI_GEN_X31_TEXT	
rename	SNI_GEN_X32	A4_GENDER
drop	SNI_GEN_X32_TEXT	
rename	SNI_GEN_X33	A5_GENDER
drop	SNI_GEN_X33_TEXT	
rename	SNI_AGE_X29	A1_AGE
drop	SNI_AGE_X29_TEXT	
rename	SNI_AGE_X30	A2_AGE
drop	SNI_AGE_X30_TEXT	
rename	SNI_AGE_X31	A3_AGE
drop	SNI_AGE_X31_TEXT	
rename	SNI_AGE_X32	A4_AGE
drop	SNI_AGE_X32_TEXT	
rename	SNI_AGE_X33	A5_AGE
drop	SNI_AGE_X33_TEXT	
rename	SNI_SEXORI_X29	A1_SEXUAL_ORIENTATION_IDENTITY
drop	SNI_SEXORI_X29_TEXT	
rename	SNI_SEXORI_X30	A2_SEXUAL_ORIENTATION_IDENTITY
drop	SNI_SEXORI_X30_TEXT	
rename	SNI_SEXORI_X31	A3_SEXUAL_ORIENTATION_IDENTITY
drop	SNI_SEXORI_X31_TEXT	
rename	SNI_SEXORI_X32	A4_SEXUAL_ORIENTATION_IDENTITY
drop	SNI_SEXORI_X32_TEXT	
rename	SNI_SEXORI_X33	A5_SEXUAL_ORIENTATION_IDENTITY
drop	SNI_SEXORI_X33_TEXT	
rename	SNI_SAMERACE_2	A0_SAME_RACE_NO_ALTERS
rename	SNI_SAMERACE_31	A1_SAME_RACE
rename	SNI_SAMERACE_32	A2_SAME_RACE
rename	SNI_SAMERACE_33	A3_SAME_RACE
rename	SNI_SAMERACE_34	A4_SAME_RACE
rename	SNI_SAMERACE_35	A5_SAME_RACE
drop	SNI_SAMERACE_X29_TEXT	
drop	SNI_SAMERACE_X30_TEXT	
drop	SNI_SAMERACE_X31_TEXT	
drop	SNI_SAMERACE_X32_TEXT	
drop	SNI_SAMERACE_X33_TEXT	
rename	SNI_REL_UH_SNI_REL_UH_X29	A1_RELATIONTYPE_UNHOUSED
drop	SNI_REL_UH_SNI_REL_UH_X29_TEXT	
rename	SNI_REL_UH_SNI_REL_UH_X30	A2_RELATIONTYPE_UNHOUSED
drop	SNI_REL_UH_SNI_REL_UH_X30_TEXT	
rename	SNI_REL_UH_SNI_REL_UH_X31	A3_RELATIONTYPE_UNHOUSED
drop	SNI_REL_UH_SNI_REL_UH_X31_TEXT	
rename	SNI_REL_UH_SNI_REL_UH_X32	A4_RELATIONTYPE_UNHOUSED
drop	SNI_REL_UH_SNI_REL_UH_X32_TEXT	
rename	SNI_REL_UH_SNI_REL_UH_X33	A5_RELATIONTYPE_UNHOUSED
drop	SNI_REL_UH_SNI_REL_UH_X33_TEXT	
rename	SNI_REL_H_SNI_REL_H_X29	A1_RELATIONTYPE_HOUSED
drop	SNI_REL_H_SNI_REL_H_X29_TEXT	
rename	SNI_REL_H_SNI_REL_H_X30	A2_RELATIONTYPE_HOUSED
drop	SNI_REL_H_SNI_REL_H_X30_TEXT	
rename	SNI_REL_H_SNI_REL_H_X31	A3_RELATIONTYPE_HOUSED
drop	SNI_REL_H_SNI_REL_H_X31_TEXT	
rename	SNI_REL_H_SNI_REL_H_X32	A4_RELATIONTYPE_HOUSED
drop	SNI_REL_H_SNI_REL_H_X32_TEXT	
rename	SNI_REL_H_SNI_REL_H_X33	A5_RELATIONTYPE_HOUSED
drop	SNI_REL_H_SNI_REL_H_X33_TEXT	
rename	SNI_REL_UH_OTH1	A1_RELATIONTYPE_UNHOUSED_TEXT
rename	SNI_REL_UH_OTH2	A2_RELATIONTYPE_UNHOUSED_TEXT
rename	SNI_REL_UH_OTH3	A3_RELATIONTYPE_UNHOUSED_TEXT
rename	SNI_REL_UH_OTH4	A4_RELATIONTYPE_UNHOUSED_TEXT
rename	SNI_REL_UH_OTH5	A5_RELATIONTYPE_UNHOUSED_TEXT
rename	SNI_REL_H_OTH1	A1_RELATIONTYPE_HOUSED_TEXT
rename	SNI_REL_H_OTH2	A2_RELATIONTYPE_HOUSED_TEXT
rename	SNI_REL_H_OTH3	A3_RELATIONTYPE_HOUSED_TEXT
rename	SNI_REL_H_OTH4	A4_RELATIONTYPE_HOUSED_TEXT
rename	SNI_REL_H_OTH5	A5_RELATIONTYPE_HOUSED_TEXT
rename	SNI_NOR_2	A0_SAME_PLACE_HOUSINGPROG_NOALTS
rename	SNI_NOR_31	A1_SAME_PLACE_HOUSINGPROG
rename	SNI_NOR_32	A2_SAME_PLACE_HOUSINGPROG
rename	SNI_NOR_33	A3_SAME_PLACE_HOUSINGPROG
rename	SNI_NOR_34	A4_SAME_PLACE_HOUSINGPROG
rename	SNI_NOR_35	A5_SAME_PLACE_HOUSINGPROG
drop	SNI_NOR_X29_TEXT	
drop	SNI_NOR_X30_TEXT	
drop	SNI_NOR_X31_TEXT	
drop	SNI_NOR_X32_TEXT	
drop	SNI_NOR_X33_TEXT	
rename	SNI_NOR_UH_2	A0_SAME_PLACE_UNHOUSED_NO_ALTERS
rename	SNI_NOR_UH_31	A1_SAME_PLACE_UNHOUSED_PLACE
rename	SNI_NOR_UH_32	A2_SAME_PLACE_UNHOUSED_PLACE
rename	SNI_NOR_UH_33	A3_SAME_PLACE_UNHOUSED_PLACE
rename	SNI_NOR_UH_34	A4_SAME_PLACE_UNHOUSED_PLACE
rename	SNI_NOR_UH_35	A5_SAME_PLACE_UNHOUSED_PLACE
drop	SNI_NOR_UH_X29_TEXT	
drop	SNI_NOR_UH_X30_TEXT	
drop	SNI_NOR_UH_X31_TEXT	
drop	SNI_NOR_UH_X32_TEXT	
drop	SNI_NOR_UH_X33_TEXT	
rename	SNI_RMATE_2	A0_ROOMMATE_NO_ALTERS
rename	SNI_RMATE_31	A1_ROOMMATE
rename	SNI_RMATE_32	A2_ROOMMATE
rename	SNI_RMATE_33	A3_ROOMMATE
rename	SNI_RMATE_34	A4_ROOMMATE
rename	SNI_RMATE_35	A5_ROOMMATE
drop	SNI_RMATE_X29_TEXT	
drop	SNI_RMATE_X30_TEXT	
drop	SNI_RMATE_X31_TEXT	
drop	SNI_RMATE_X32_TEXT	
drop	SNI_RMATE_X33_TEXT	
rename	SNI_SEEWKLY_2	A0_INTERACT_WEEKLY_NO_ALTERS
rename	SNI_SEEWKLY_31	A1_INTERACT_WEEKLY
rename	SNI_SEEWKLY_32	A2_INTERACT_WEEKLY
rename	SNI_SEEWKLY_33	A3_INTERACT_WEEKLY
rename	SNI_SEEWKLY_34	A4_INTERACT_WEEKLY
rename	SNI_SEEWKLY_35	A5_INTERACT_WEEKLY
drop	SNI_SEEWKLY_X29_TEXT	
drop	SNI_SEEWKLY_X30_TEXT	
drop	SNI_SEEWKLY_X31_TEXT	
drop	SNI_SEEWKLY_X32_TEXT	
drop	SNI_SEEWKLY_X33_TEXT	
rename	SNI_HANG3MO_1	A0_INTERACT_IN_PERSON__3MO_NOALT
rename	SNI_HANG3MO_30	A1_INTERACT_IN_PERSON__3MO
rename	SNI_HANG3MO_31	A2_INTERACT_IN_PERSON__3MO
rename	SNI_HANG3MO_32	A3_INTERACT_IN_PERSON__3MO
rename	SNI_HANG3MO_33	A4_INTERACT_IN_PERSON__3MO
rename	SNI_HANG3MO_34	A5_INTERACT_IN_PERSON__3MO
drop	SNI_HANG3MO_X29_TEXT	
drop	SNI_HANG3MO_X30_TEXT	
drop	SNI_HANG3MO_X31_TEXT	
drop	SNI_HANG3MO_X32_TEXT	
drop	SNI_HANG3MO_X33_TEXT	
rename	SNI_PHONE3MO_1	A0_INTERACT_PHONE__3MO_NO_ALTERS
rename	SNI_PHONE3MO_30	A1_INTERACT_PHONE__3MO
rename	SNI_PHONE3MO_31	A2_INTERACT_PHONE__3MO
rename	SNI_PHONE3MO_32	A3_INTERACT_PHONE__3MO
rename	SNI_PHONE3MO_33	A4_INTERACT_PHONE__3MO
rename	SNI_PHONE3MO_34	A5_INTERACT_PHONE__3MO
drop	SNI_PHONE3MO_X29_TEXT	
drop	SNI_PHONE3MO_X30_TEXT	
drop	SNI_PHONE3MO_X31_TEXT	
drop	SNI_PHONE3MO_X32_TEXT	
drop	SNI_PHONE3MO_X33_TEXT	
rename	SNI_PCTAB3MO_1	A0_INTERACT_PCTABLET_3MO_NOALTRS
rename	SNI_PCTAB3MO_30	A1_INTERACT_PCTABLET_3MO
rename	SNI_PCTAB3MO_31	A2_INTERACT_PCTABLET_3MO
rename	SNI_PCTAB3MO_32	A3_INTERACT_PCTABLET_3MO
rename	SNI_PCTAB3MO_33	A4_INTERACT_PCTABLET_3MO
rename	SNI_PCTAB3MO_34	A5_INTERACT_PCTABLET_3MO
drop	SNI_PCTAB3MO_X29_TEXT	
drop	SNI_PCTAB3MO_X30_TEXT	
drop	SNI_PCTAB3MO_X31_TEXT	
drop	SNI_PCTAB3MO_X32_TEXT	
drop	SNI_PCTAB3MO_X33_TEXT	
rename	SNI_HMLSEVER_1	A0_HOMELESS_EVER_NO_ALTERS
rename	SNI_HMLSEVER_30	A1_HOMELESS_EVER
rename	SNI_HMLSEVER_31	A2_HOMELESS_EVER
rename	SNI_HMLSEVER_32	A3_HOMELESS_EVER
rename	SNI_HMLSEVER_33	A4_HOMELESS_EVER
rename	SNI_HMLSEVER_34	A5_HOMELESS_EVER
drop	SNI_HMLSEVER_X29_TEXT	
drop	SNI_HMLSEVER_X30_TEXT	
drop	SNI_HMLSEVER_X31_TEXT	
drop	SNI_HMLSEVER_X32_TEXT	
drop	SNI_HMLSEVER_X33_TEXT	
rename	SNI_HMLSNOW_1	A0_HOMELESS_CURRENT_NO_ALTERS
rename	SNI_HMLSNOW_30	A1_HOMELESS_CURRENT
rename	SNI_HMLSNOW_31	A2_HOMELESS_CURRENT
rename	SNI_HMLSNOW_32	A3_HOMELESS_CURRENT
rename	SNI_HMLSNOW_33	A4_HOMELESS_CURRENT
rename	SNI_HMLSNOW_34	A5_HOMELESS_CURRENT
drop	SNI_HMLSNOW_X29_TEXT	
drop	SNI_HMLSNOW_X30_TEXT	
drop	SNI_HMLSNOW_X31_TEXT	
drop	SNI_HMLSNOW_X32_TEXT	
drop	SNI_HMLSNOW_X33_TEXT	
rename	SNI_GANG_1	A0_GANG_EVER_NO_ALTERS
rename	SNI_GANG_30	A1_GANG_EVER
rename	SNI_GANG_31	A2_GANG_EVER
rename	SNI_GANG_32	A3_GANG_EVER
rename	SNI_GANG_33	A4_GANG_EVER
rename	SNI_GANG_34	A5_GANG_EVER
drop	SNI_GANG_X29_TEXT	
drop	SNI_GANG_X30_TEXT	
drop	SNI_GANG_X31_TEXT	
drop	SNI_GANG_X32_TEXT	
drop	SNI_GANG_X33_TEXT	
rename	SNI_DISSU_METH_1	A0_DISAPPROVE_METH_NO_ALTERS
rename	SNI_DISSU_METH_30	A1_DISAPPROVE_METH
rename	SNI_DISSU_METH_31	A2_DISAPPROVE_METH
rename	SNI_DISSU_METH_32	A3_DISAPPROVE_METH
rename	SNI_DISSU_METH_33	A4_DISAPPROVE_METH
rename	SNI_DISSU_METH_34	A5_DISAPPROVE_METH
drop	SNI_DISSU_METH_X29_TEXT	
drop	SNI_DISSU_METH_X30_TEXT	
drop	SNI_DISSU_METH_X31_TEXT	
drop	SNI_DISSU_METH_X32_TEXT	
drop	SNI_DISSU_METH_X33_TEXT	
rename	SNI_DISSU_MDMA_1	A0_DISAPPROVE_MDMA_NO_ALTERS
rename	SNI_DISSU_MDMA_30	A1_DISAPPROVE_MDMA
rename	SNI_DISSU_MDMA_31	A2_DISAPPROVE_MDMA
rename	SNI_DISSU_MDMA_32	A3_DISAPPROVE_MDMA
rename	SNI_DISSU_MDMA_33	A4_DISAPPROVE_MDMA
rename	SNI_DISSU_MDMA_34	A5_DISAPPROVE_MDMA
drop	SNI_DISSU_MDMA_X29_TEXT	
drop	SNI_DISSU_MDMA_X30_TEXT	
drop	SNI_DISSU_MDMA_X31_TEXT	
drop	SNI_DISSU_MDMA_X32_TEXT	
drop	SNI_DISSU_MDMA_X33_TEXT	
rename	SNI_DISSU_SYNTHMJ_1	A0_DISAPPROVE_SYNTHETIC_MJ_NOALT
rename	SNI_DISSU_SYNTHMJ_30	A1_DISAPPROVE_SYNTHETIC_MJ
rename	SNI_DISSU_SYNTHMJ_31	A2_DISAPPROVE_SYNTHETIC_MJ
rename	SNI_DISSU_SYNTHMJ_32	A3_DISAPPROVE_SYNTHETIC_MJ
rename	SNI_DISSU_SYNTHMJ_33	A4_DISAPPROVE_SYNTHETIC_MJ
rename	SNI_DISSU_SYNTHMJ_34	A5_DISAPPROVE_SYNTHETIC_MJ
drop	SNI_DISSU_SYNTHMJ_X29_TEXT	
drop	SNI_DISSU_SYNTHMJ_X30_TEXT	
drop	SNI_DISSU_SYNTHMJ_X31_TEXT	
drop	SNI_DISSU_SYNTHMJ_X32_TEXT	
drop	SNI_DISSU_SYNTHMJ_X33_TEXT	
rename	SNI_DISSU_HALLUC_1	A0_DISAPPROVE_HALLUC_NO_ALTERS
rename	SNI_DISSU_HALLUC_30	A1_DISAPPROVE_HALLUC
rename	SNI_DISSU_HALLUC_31	A2_DISAPPROVE_HALLUC
rename	SNI_DISSU_HALLUC_32	A3_DISAPPROVE_HALLUC
rename	SNI_DISSU_HALLUC_33	A4_DISAPPROVE_HALLUC
rename	SNI_DISSU_HALLUC_34	A5_DISAPPROVE_HALLUC
drop	SNI_DISSU_HALLUC_X29_TEXT	
drop	SNI_DISSU_HALLUC_X30_TEXT	
drop	SNI_DISSU_HALLUC_X31_TEXT	
drop	SNI_DISSU_HALLUC_X32_TEXT	
drop	SNI_DISSU_HALLUC_X33_TEXT	
rename	SNI_DISSU_PDM_1	A0_DISAPPROVE_RX_MISUSE_NOALTERS
rename	SNI_DISSU_PDM_30	A1_DISAPPROVE_RX_MISUSE
rename	SNI_DISSU_PDM_31	A2_DISAPPROVE_RX_MISUSE
rename	SNI_DISSU_PDM_32	A3_DISAPPROVE_RX_MISUSE
rename	SNI_DISSU_PDM_33	A4_DISAPPROVE_RX_MISUSE
rename	SNI_DISSU_PDM_34	A5_DISAPPROVE_RX_MISUSE
drop	SNI_DISSU_PDM_X29_TEXT	
drop	SNI_DISSU_PDM_X30_TEXT	
drop	SNI_DISSU_PDM_X31_TEXT	
drop	SNI_DISSU_PDM_X32_TEXT	
drop	SNI_DISSU_PDM_X33_TEXT	
rename	SNI_DISSU_IDU_1	A0_DISAPPROVE_INJECTDRUG_NOALTRS
rename	SNI_DISSU_IDU_30	A1_DISAPPROVE_INJECTDRUG
rename	SNI_DISSU_IDU_31	A2_DISAPPROVE_INJECTDRUG
rename	SNI_DISSU_IDU_32	A3_DISAPPROVE_INJECTDRUG
rename	SNI_DISSU_IDU_33	A4_DISAPPROVE_INJECTDRUG
rename	SNI_DISSU_IDU_34	A5_DISAPPROVE_INJECTDRUG
drop	SNI_DISSU_IDU_X29_TEXT	
drop	SNI_DISSU_IDU_X30_TEXT	
drop	SNI_DISSU_IDU_X31_TEXT	
drop	SNI_DISSU_IDU_X32_TEXT	
drop	SNI_DISSU_IDU_X33_TEXT	
rename	SNI_SUEVER_TOB_1	A0_CO_USE_TOBACCO_EVER_NO_ALTERS
rename	SNI_SUEVER_TOB_30	A1_CO_USE_TOBACCO_EVER
rename	SNI_SUEVER_TOB_31	A2_CO_USE_TOBACCO_EVER
rename	SNI_SUEVER_TOB_32	A3_CO_USE_TOBACCO_EVER
rename	SNI_SUEVER_TOB_33	A4_CO_USE_TOBACCO_EVER
rename	SNI_SUEVER_TOB_34	A5_CO_USE_TOBACCO_EVER
drop	SNI_SUEVER_TOB_X29_TEXT	
drop	SNI_SUEVER_TOB_X30_TEXT	
drop	SNI_SUEVER_TOB_X31_TEXT	
drop	SNI_SUEVER_TOB_X32_TEXT	
drop	SNI_SUEVER_TOB_X33_TEXT	
rename	SNI_SU30_TOB_NULL_X1	A0_CO_USE_TOBACCO_30DAY_NOALTERS
rename	SNI_SU30_TOB_NULL_XX29	A1_CO_USE_TOBACCO_30DAY_FREQ
drop	SNI_SU30_TOB_NULL_XX29_TEXT	
rename	SNI_SU30_TOB_NULL_XX30	A2_CO_USE_TOBACCO_30DAY_FREQ
drop	SNI_SU30_TOB_NULL_XX30_TEXT	
rename	SNI_SU30_TOB_NULL_XX31	A3_CO_USE_TOBACCO_30DAY_FREQ
drop	SNI_SU30_TOB_NULL_XX31_TEXT	
rename	SNI_SU30_TOB_NULL_XX32	A4_CO_USE_TOBACCO_30DAY_FREQ
drop	SNI_SU30_TOB_NULL_XX32_TEXT	
rename	SNI_SU30_TOB_NULL_XX33	A5_CO_USE_TOBACCO_30DAY_FREQ
drop	SNI_SU30_TOB_NULL_XX33_TEXT	
rename	SNI_SUEVER_ALC_1	A0_CO_USE_ALCOHOL_EVER_NO_ALTERS
rename	SNI_SUEVER_ALC_30	A1_CO_USE_ALCOHOL_EVER
rename	SNI_SUEVER_ALC_31	A2_CO_USE_ALCOHOL_EVER
rename	SNI_SUEVER_ALC_32	A3_CO_USE_ALCOHOL_EVER
rename	SNI_SUEVER_ALC_33	A4_CO_USE_ALCOHOL_EVER
rename	SNI_SUEVER_ALC_34	A5_CO_USE_ALCOHOL_EVER
drop	SNI_SUEVER_ALC_X29_TEXT	
drop	SNI_SUEVER_ALC_X30_TEXT	
drop	SNI_SUEVER_ALC_X31_TEXT	
drop	SNI_SUEVER_ALC_X32_TEXT	
drop	SNI_SUEVER_ALC_X33_TEXT	
rename	SNI_SU30_ALC_NULL_X1	A0_CO_USE_ALCOHOL_30DAY_NOALTERS
rename	SNI_SU30_ALC_NULL_XX29	A1_CO_USE_ALCOHOL_30DAY_FREQ
drop	SNI_SU30_ALC_NULL_XX29_TEXT	
rename	SNI_SU30_ALC_NULL_XX30	A2_CO_USE_ALCOHOL_30DAY_FREQ
drop	SNI_SU30_ALC_NULL_XX30_TEXT	
rename	SNI_SU30_ALC_NULL_XX31	A3_CO_USE_ALCOHOL_30DAY_FREQ
drop	SNI_SU30_ALC_NULL_XX31_TEXT	
rename	SNI_SU30_ALC_NULL_XX32	A4_CO_USE_ALCOHOL_30DAY_FREQ
drop	SNI_SU30_ALC_NULL_XX32_TEXT	
rename	SNI_SU30_ALC_NULL_XX33	A5_CO_USE_ALCOHOL_30DAY_FREQ
drop	SNI_SU30_ALC_NULL_XX33_TEXT	
rename	SNI_SUEVER_MJ_1	A0_CO_USE_MARIJUANA_EVER_NOALTRS
rename	SNI_SUEVER_MJ_30	A1_CO_USE_MARIJUANA_EVER
rename	SNI_SUEVER_MJ_31	A2_CO_USE_MARIJUANA_EVER
rename	SNI_SUEVER_MJ_32	A3_CO_USE_MARIJUANA_EVER
rename	SNI_SUEVER_MJ_33	A4_CO_USE_MARIJUANA_EVER
rename	SNI_SUEVER_MJ_34	A5_CO_USE_MARIJUANA_EVER
drop	SNI_SUEVER_MJ_X29_TEXT	
drop	SNI_SUEVER_MJ_X30_TEXT	
drop	SNI_SUEVER_MJ_X31_TEXT	
drop	SNI_SUEVER_MJ_X32_TEXT	
drop	SNI_SUEVER_MJ_X33_TEXT	
rename	SNI_SU30_MJ_Q130_X1	A0_CO_USE_MARIJUANA_30DAY_NOALTS
rename	SNI_SU30_MJ_Q130_XX29	A1_CO_USE_MARIJUANA_30DAY_FREQ
drop	SNI_SU30_MJ_Q130_XX29_TEXT	
rename	SNI_SU30_MJ_Q130_XX30	A2_CO_USE_MARIJUANA_30DAY_FREQ
drop	SNI_SU30_MJ_Q130_XX30_TEXT	
rename	SNI_SU30_MJ_Q130_XX31	A3_CO_USE_MARIJUANA_30DAY_FREQ
drop	SNI_SU30_MJ_Q130_XX31_TEXT	
rename	SNI_SU30_MJ_Q130_XX32	A4_CO_USE_MARIJUANA_30DAY_FREQ
drop	SNI_SU30_MJ_Q130_XX32_TEXT	
rename	SNI_SU30_MJ_Q130_XX33	A5_CO_USE_MARIJUANA_30DAY_FREQ
drop	SNI_SU30_MJ_Q130_XX33_TEXT	
rename	SNI_SUEVER_METH_1	A0_CO_USE_METH_EVER_NO_ALTERS
rename	SNI_SUEVER_METH_30	A1_CO_USE_METH_EVER
rename	SNI_SUEVER_METH_31	A2_CO_USE_METH_EVER
rename	SNI_SUEVER_METH_32	A3_CO_USE_METH_EVER
rename	SNI_SUEVER_METH_33	A4_CO_USE_METH_EVER
rename	SNI_SUEVER_METH_34	A5_CO_USE_METH_EVER
drop	SNI_SUEVER_METH_X29_TEXT	
drop	SNI_SUEVER_METH_X30_TEXT	
drop	SNI_SUEVER_METH_X31_TEXT	
drop	SNI_SUEVER_METH_X32_TEXT	
drop	SNI_SUEVER_METH_X33_TEXT	
rename	SNI_SU30_METH_NULL_X1	A0_CO_USE_METH_30DAY_NO_ALTERS
rename	SNI_SU30_METH_NULL_XX29	A1_CO_USE_METH_30DAY_FREQUENCY
drop	SNI_SU30_METH_NULL_XX29_TEXT	
rename	SNI_SU30_METH_NULL_XX30	A2_CO_USE_METH_30DAY_FREQUENCY
drop	SNI_SU30_METH_NULL_XX30_TEXT	
rename	SNI_SU30_METH_NULL_XX31	A3_CO_USE_METH_30DAY_FREQUENCY
drop	SNI_SU30_METH_NULL_XX31_TEXT	
rename	SNI_SU30_METH_NULL_XX32	A4_CO_USE_METH_30DAY_FREQUENCY
drop	SNI_SU30_METH_NULL_XX32_TEXT	
rename	SNI_SU30_METH_NULL_XX33	A5_CO_USE_METH_30DAY_FREQUENCY
drop	SNI_SU30_METH_NULL_XX33_TEXT	
rename	SNI_SUEVER_MDMA_1	A0_CO_USE_MDMA_EVER_NO_ALTERS
rename	SNI_SUEVER_MDMA_30	A1_CO_USE_MDMA_EVER
rename	SNI_SUEVER_MDMA_31	A2_CO_USE_MDMA_EVER
rename	SNI_SUEVER_MDMA_32	A3_CO_USE_MDMA_EVER
rename	SNI_SUEVER_MDMA_33	A4_CO_USE_MDMA_EVER
rename	SNI_SUEVER_MDMA_34	A5_CO_USE_MDMA_EVER
drop	SNI_SUEVER_MDMA_X29_TEXT	
drop	SNI_SUEVER_MDMA_X30_TEXT	
drop	SNI_SUEVER_MDMA_X31_TEXT	
drop	SNI_SUEVER_MDMA_X32_TEXT	
drop	SNI_SUEVER_MDMA_X33_TEXT	
rename	SNI_SU30_MDMA_NULL_X1	A0_CO_USE_MDMA_30DAY_NO_ALTERS
rename	SNI_SU30_MDMA_NULL_XX29	A1_CO_USE_MDMA_30DAY_FREQUENCY
drop	SNI_SU30_MDMA_NULL_XX29_TEXT	
rename	SNI_SU30_MDMA_NULL_XX30	A2_CO_USE_MDMA_30DAY_FREQUENCY
drop	SNI_SU30_MDMA_NULL_XX30_TEXT	
rename	SNI_SU30_MDMA_NULL_XX31	A3_CO_USE_MDMA_30DAY_FREQUENCY
drop	SNI_SU30_MDMA_NULL_XX31_TEXT	
rename	SNI_SU30_MDMA_NULL_XX32	A4_CO_USE_MDMA_30DAY_FREQUENCY
drop	SNI_SU30_MDMA_NULL_XX32_TEXT	
rename	SNI_SU30_MDMA_NULL_XX33	A5_CO_USE_MDMA_30DAY_FREQUENCY
drop	SNI_SU30_MDMA_NULL_XX33_TEXT	
rename	SNI_SUEVER_SYNMJ_1	A0_CO_USE_SYNTHETIC_MJ_EVER_NONE
rename	SNI_SUEVER_SYNMJ_30	A1_CO_USE_SYNTHETIC_MJ_EVER
rename	SNI_SUEVER_SYNMJ_31	A2_CO_USE_SYNTHETIC_MJ_EVER
rename	SNI_SUEVER_SYNMJ_32	A3_CO_USE_SYNTHETIC_MJ_EVER
rename	SNI_SUEVER_SYNMJ_33	A4_CO_USE_SYNTHETIC_MJ_EVER
rename	SNI_SUEVER_SYNMJ_34	A5_CO_USE_SYNTHETIC_MJ_EVER
drop	SNI_SUEVER_SYNMJ_X29_TEXT	
drop	SNI_SUEVER_SYNMJ_X30_TEXT	
drop	SNI_SUEVER_SYNMJ_X31_TEXT	
drop	SNI_SUEVER_SYNMJ_X32_TEXT	
drop	SNI_SUEVER_SYNMJ_X33_TEXT	
rename	SNI_SU30_SYNMJ_NULL_X1	A0_CO_USE_SYNTHETIC_MJ_30DAYNONE
rename	SNI_SU30_SYNMJ_NULL_XX29	A1_CO_USE_SYNTHETIC_MJ_30DAYFREQ
drop	SNI_SU30_SYNMJ_NULL_XX29_TEXT	
rename	SNI_SU30_SYNMJ_NULL_XX30	A2_CO_USE_SYNTHETIC_MJ_30DAYFREQ
drop	SNI_SU30_SYNMJ_NULL_XX30_TEXT	
rename	SNI_SU30_SYNMJ_NULL_XX31	A3_CO_USE_SYNTHETIC_MJ_30DAYFREQ
drop	SNI_SU30_SYNMJ_NULL_XX31_TEXT	
rename	SNI_SU30_SYNMJ_NULL_XX32	A4_CO_USE_SYNTHETIC_MJ_30DAYFREQ
drop	SNI_SU30_SYNMJ_NULL_XX32_TEXT	
rename	SNI_SU30_SYNMJ_NULL_XX33	A5_CO_USE_SYNTHETIC_MJ_30DAYFREQ
drop	SNI_SU30_SYNMJ_NULL_XX33_TEXT	
rename	SNI_SUEVER_HALLUC_1	A0_CO_USE_HALLUC_EVER_NO_ALTERS
rename	SNI_SUEVER_HALLUC_30	A1_CO_USE_HALLUC_EVER
rename	SNI_SUEVER_HALLUC_31	A2_CO_USE_HALLUC_EVER
rename	SNI_SUEVER_HALLUC_32	A3_CO_USE_HALLUC_EVER
rename	SNI_SUEVER_HALLUC_33	A4_CO_USE_HALLUC_EVER
rename	SNI_SUEVER_HALLUC_34	A5_CO_USE_HALLUC_EVER
drop	SNI_SUEVER_HALLUC_X29_TEXT	
drop	SNI_SUEVER_HALLUC_X30_TEXT	
drop	SNI_SUEVER_HALLUC_X31_TEXT	
drop	SNI_SUEVER_HALLUC_X32_TEXT	
drop	SNI_SUEVER_HALLUC_X33_TEXT	
rename	SNI_SU30_HALLUC_NULL_X1	A0_CO_USE_HALLUC_30DAY_NO_ALTERS
rename	SNI_SU30_HALLUC_NULL_XX29	A1_CO_USE_HALLUC_30DAY_FREQUENCY
drop	SNI_SU30_HALLUC_NULL_XX29_TEXT	
rename	SNI_SU30_HALLUC_NULL_XX30	A2_CO_USE_HALLUC_30DAY_FREQUENCY
drop	SNI_SU30_HALLUC_NULL_XX30_TEXT	
rename	SNI_SU30_HALLUC_NULL_XX31	A3_CO_USE_HALLUC_30DAY_FREQUENCY
drop	SNI_SU30_HALLUC_NULL_XX31_TEXT	
rename	SNI_SU30_HALLUC_NULL_XX32	A4_CO_USE_HALLUC_30DAY_FREQUENCY
drop	SNI_SU30_HALLUC_NULL_XX32_TEXT	
rename	SNI_SU30_HALLUC_NULL_XX33	A5_CO_USE_HALLUC_30DAY_FREQUENCY
drop	SNI_SU30_HALLUC_NULL_XX33_TEXT	
rename	SNI_SUEVER_PDM_1	A0_CO_USE_RXMISUSE_EVER_NOALTERS
rename	SNI_SUEVER_PDM_30	A1_CO_USE_RXMISUSE_EVER
rename	SNI_SUEVER_PDM_31	A2_CO_USE_RXMISUSE_EVER
rename	SNI_SUEVER_PDM_32	A3_CO_USE_RXMISUSE_EVER
rename	SNI_SUEVER_PDM_33	A4_CO_USE_RXMISUSE_EVER
rename	SNI_SUEVER_PDM_34	A5_CO_USE_RXMISUSE_EVER
drop	SNI_SUEVER_PDM_X29_TEXT	
drop	SNI_SUEVER_PDM_X30_TEXT	
drop	SNI_SUEVER_PDM_X31_TEXT	
drop	SNI_SUEVER_PDM_X32_TEXT	
drop	SNI_SUEVER_PDM_X33_TEXT	
rename	SNI_SU30_PDM_NULL_X1	A0_CO_USE_RXMISUSE_30DAY_NOALTRS
rename	SNI_SU30_PDM_NULL_XX29	A1_CO_USE_RXMISUSE_30DAY_FREQ
drop	SNI_SU30_PDM_NULL_XX29_TEXT	
rename	SNI_SU30_PDM_NULL_XX30	A2_CO_USE_RXMISUSE_30DAY_FREQ
drop	SNI_SU30_PDM_NULL_XX30_TEXT	
rename	SNI_SU30_PDM_NULL_XX31	A3_CO_USE_RXMISUSE_30DAY_FREQ
drop	SNI_SU30_PDM_NULL_XX31_TEXT	
rename	SNI_SU30_PDM_NULL_XX32	A4_CO_USE_RXMISUSE_30DAY_FREQ
drop	SNI_SU30_PDM_NULL_XX32_TEXT	
rename	SNI_SU30_PDM_NULL_XX33	A5_CO_USE_RXMISUSE_30DAY_FREQ
drop	SNI_SU30_PDM_NULL_XX33_TEXT	
rename	SNI_SUEVER_HEROIN_1	A0_CO_USE_HEROIN_EVER_NO_ALTERS
rename	SNI_SUEVER_HEROIN_30	A1_CO_USE_HEROIN_EVER
rename	SNI_SUEVER_HEROIN_31	A2_CO_USE_HEROIN_EVER
rename	SNI_SUEVER_HEROIN_32	A3_CO_USE_HEROIN_EVER
rename	SNI_SUEVER_HEROIN_33	A4_CO_USE_HEROIN_EVER
rename	SNI_SUEVER_HEROIN_34	A5_CO_USE_HEROIN_EVER
drop	SNI_SUEVER_HEROIN_X29_TEXT	
drop	SNI_SUEVER_HEROIN_X30_TEXT	
drop	SNI_SUEVER_HEROIN_X31_TEXT	
drop	SNI_SUEVER_HEROIN_X32_TEXT	
drop	SNI_SUEVER_HEROIN_X33_TEXT	
rename	SNI_SU30_HEROIN_NULL_X1	A0_CO_USE_HEROIN_30DAY_NO_ALTERS
rename	SNI_SU30_HEROIN_NULL_XX29	A1_CO_USE_HEROIN_30DAY_FREQUENCY
drop	SNI_SU30_HEROIN_NULL_XX29_TEXT	
rename	SNI_SU30_HEROIN_NULL_XX30	A2_CO_USE_HEROIN_30DAY_FREQUENCY
drop	SNI_SU30_HEROIN_NULL_XX30_TEXT	
rename	SNI_SU30_HEROIN_NULL_XX31	A3_CO_USE_HEROIN_30DAY_FREQUENCY
drop	SNI_SU30_HEROIN_NULL_XX31_TEXT	
rename	SNI_SU30_HEROIN_NULL_XX32	A4_CO_USE_HEROIN_30DAY_FREQUENCY
drop	SNI_SU30_HEROIN_NULL_XX32_TEXT	
rename	SNI_SU30_HEROIN_NULL_XX33	A5_CO_USE_HEROIN_30DAY_FREQUENCY
drop	SNI_SU30_HEROIN_NULL_XX33_TEXT	
rename	SNI_SUEVER_COC_1	A0_CO_USE_COCAINE_EVER_NO_ALTERS
rename	SNI_SUEVER_COC_30	A1_CO_USE_COCAINE_EVER
rename	SNI_SUEVER_COC_31	A2_CO_USE_COCAINE_EVER
rename	SNI_SUEVER_COC_32	A3_CO_USE_COCAINE_EVER
rename	SNI_SUEVER_COC_33	A4_CO_USE_COCAINE_EVER
rename	SNI_SUEVER_COC_34	A5_CO_USE_COCAINE_EVER
drop	SNI_SUEVER_COC_X29_TEXT	
drop	SNI_SUEVER_COC_X30_TEXT	
drop	SNI_SUEVER_COC_X31_TEXT	
drop	SNI_SUEVER_COC_X32_TEXT	
drop	SNI_SUEVER_COC_X33_TEXT	
rename	SNI_SU30_COC_NULL_X1	A0_CO_USE_COCAINE_30DAY_NOALTERS
rename	SNI_SU30_COC_NULL_XX29	A1_CO_USE_COCAINE_30DAY_FREQ
drop	SNI_SU30_COC_NULL_XX29_TEXT	
rename	SNI_SU30_COC_NULL_XX30	A2_CO_USE_COCAINE_30DAY_FREQ
drop	SNI_SU30_COC_NULL_XX30_TEXT	
rename	SNI_SU30_COC_NULL_XX31	A3_CO_USE_COCAINE_30DAY_FREQ
drop	SNI_SU30_COC_NULL_XX31_TEXT	
rename	SNI_SU30_COC_NULL_XX32	A4_CO_USE_COCAINE_30DAY_FREQ
drop	SNI_SU30_COC_NULL_XX32_TEXT	
rename	SNI_SU30_COC_NULL_XX33	A5_CO_USE_COCAINE_30DAY_FREQ
drop	SNI_SU30_COC_NULL_XX33_TEXT	
rename	SNI_SUEVER_CRACK_1	A0_CO_USE_CRACK_EVER_NO_ALTERS
rename	SNI_SUEVER_CRACK_30	A1_CO_USE_CRACK_EVER
rename	SNI_SUEVER_CRACK_31	A2_CO_USE_CRACK_EVER
rename	SNI_SUEVER_CRACK_32	A3_CO_USE_CRACK_EVER
rename	SNI_SUEVER_CRACK_33	A4_CO_USE_CRACK_EVER
rename	SNI_SUEVER_CRACK_34	A5_CO_USE_CRACK_EVER
drop	SNI_SUEVER_CRACK_X29_TEXT	
drop	SNI_SUEVER_CRACK_X30_TEXT	
drop	SNI_SUEVER_CRACK_X31_TEXT	
drop	SNI_SUEVER_CRACK_X32_TEXT	
drop	SNI_SUEVER_CRACK_X33_TEXT	
rename	SNI_SU30_CRACK_NULL_X1	A0_CO_USE_CRACK_30DAY_NO_ALTERS
rename	SNI_SU30_CRACK_NULL_XX29	A1_CO_USE_CRACK_30DAY_FREQUENCY
drop	SNI_SU30_CRACK_NULL_XX29_TEXT	
rename	SNI_SU30_CRACK_NULL_XX30	A2_CO_USE_CRACK_30DAY_FREQUENCY
drop	SNI_SU30_CRACK_NULL_XX30_TEXT	
rename	SNI_SU30_CRACK_NULL_XX31	A3_CO_USE_CRACK_30DAY_FREQUENCY
drop	SNI_SU30_CRACK_NULL_XX31_TEXT	
rename	SNI_SU30_CRACK_NULL_XX32	A4_CO_USE_CRACK_30DAY_FREQUENCY
drop	SNI_SU30_CRACK_NULL_XX32_TEXT	
rename	SNI_SU30_CRACK_NULL_XX33	A5_CO_USE_CRACK_30DAY_FREQUENCY
drop	SNI_SU30_CRACK_NULL_XX33_TEXT	
rename	SNI_SUEVER_INHAL_1	A0_CO_USE_INHALLANTS_EVER_NOALTS
rename	SNI_SUEVER_INHAL_30	A1_CO_USE_INHALLANTS_EVER
rename	SNI_SUEVER_INHAL_31	A2_CO_USE_INHALLANTS_EVER
rename	SNI_SUEVER_INHAL_32	A3_CO_USE_INHALLANTS_EVER
rename	SNI_SUEVER_INHAL_33	A4_CO_USE_INHALLANTS_EVER
rename	SNI_SUEVER_INHAL_34	A5_CO_USE_INHALLANTS_EVER
drop	SNI_SUEVER_INHAL_X29_TEXT	
drop	SNI_SUEVER_INHAL_X30_TEXT	
drop	SNI_SUEVER_INHAL_X31_TEXT	
drop	SNI_SUEVER_INHAL_X32_TEXT	
drop	SNI_SUEVER_INHAL_X33_TEXT	
rename	SNI_SU30_INHAL_NULL_X1	A0_CO_USE_INHALLANTS_30DAY_NOALT
rename	SNI_SU30_INHAL_NULL_XX29	A1_CO_USE_INHALLANTS_30DAY_FREQ
drop	SNI_SU30_INHAL_NULL_XX29_TEXT	
rename	SNI_SU30_INHAL_NULL_XX30	A2_CO_USE_INHALLANTS_30DAY_FREQ
drop	SNI_SU30_INHAL_NULL_XX30_TEXT	
rename	SNI_SU30_INHAL_NULL_XX31	A3_CO_USE_INHALLANTS_30DAY_FREQ
drop	SNI_SU30_INHAL_NULL_XX31_TEXT	
rename	SNI_SU30_INHAL_NULL_XX32	A4_CO_USE_INHALLANTS_30DAY_FREQ
drop	SNI_SU30_INHAL_NULL_XX32_TEXT	
rename	SNI_SU30_INHAL_NULL_XX33	A5_CO_USE_INHALLANTS_30DAY_FREQ
drop	SNI_SU30_INHAL_NULL_XX33_TEXT	
rename	SNI_SUEVER_STER_1	A0_CO_USE_STEROIDS_EVER_NOALTERS
rename	SNI_SUEVER_STER_30	A1_CO_USE_STEROIDS_EVER
rename	SNI_SUEVER_STER_31	A2_CO_USE_STEROIDS_EVER
rename	SNI_SUEVER_STER_32	A3_CO_USE_STEROIDS_EVER
rename	SNI_SUEVER_STER_33	A4_CO_USE_STEROIDS_EVER
rename	SNI_SUEVER_STER_34	A5_CO_USE_STEROIDS_EVER
drop	SNI_SUEVER_STER_X29_TEXT	
drop	SNI_SUEVER_STER_X30_TEXT	
drop	SNI_SUEVER_STER_X31_TEXT	
drop	SNI_SUEVER_STER_X32_TEXT	
drop	SNI_SUEVER_STER_X33_TEXT	
rename	SNI_SU30_STER_NULL_X1	A0_CO_USE_STEROIDS_30DAY_NOALTRS
rename	SNI_SU30_STER_NULL_XX29	A1_CO_USE_STEROIDS_30DAY_FREQ
drop	SNI_SU30_STER_NULL_XX29_TEXT	
rename	SNI_SU30_STER_NULL_XX30	A2_CO_USE_STEROIDS_30DAY_FREQ
drop	SNI_SU30_STER_NULL_XX30_TEXT	
rename	SNI_SU30_STER_NULL_XX31	A3_CO_USE_STEROIDS_30DAY_FREQ
drop	SNI_SU30_STER_NULL_XX31_TEXT	
rename	SNI_SU30_STER_NULL_XX32	A4_CO_USE_STEROIDS_30DAY_FREQ
drop	SNI_SU30_STER_NULL_XX32_TEXT	
rename	SNI_SU30_STER_NULL_XX33	A5_CO_USE_STEROIDS_30DAY_FREQ
drop	SNI_SU30_STER_NULL_XX33_TEXT	
rename	SNI_SUEVER_NO2_1	A0_CO_USE_N2O_EVER_NO_ALTERS
rename	SNI_SUEVER_NO2_30	A1_CO_USE_N2O_EVER
rename	SNI_SUEVER_NO2_31	A2_CO_USE_N2O_EVER
rename	SNI_SUEVER_NO2_32	A3_CO_USE_N2O_EVER
rename	SNI_SUEVER_NO2_33	A4_CO_USE_N2O_EVER
rename	SNI_SUEVER_NO2_34	A5_CO_USE_N2O_EVER
drop	SNI_SUEVER_NO2_X29_TEXT	
drop	SNI_SUEVER_NO2_X30_TEXT	
drop	SNI_SUEVER_NO2_X31_TEXT	
drop	SNI_SUEVER_NO2_X32_TEXT	
drop	SNI_SUEVER_NO2_X33_TEXT	
rename	SNI_SU30_NO2_NULL_X1	A0_CO_USE_N2O_30DAY_NO_ALTERS
rename	SNI_SU30_NO2_NULL_XX29	A1_CO_USE_N2O_30DAY_FREQUENCY
drop	SNI_SU30_NO2_NULL_XX29_TEXT	
rename	SNI_SU30_NO2_NULL_XX30	A2_CO_USE_N2O_30DAY_FREQUENCY
drop	SNI_SU30_NO2_NULL_XX30_TEXT	
rename	SNI_SU30_NO2_NULL_XX31	A3_CO_USE_N2O_30DAY_FREQUENCY
drop	SNI_SU30_NO2_NULL_XX31_TEXT	
rename	SNI_SU30_NO2_NULL_XX32	A4_CO_USE_N2O_30DAY_FREQUENCY
drop	SNI_SU30_NO2_NULL_XX32_TEXT	
rename	SNI_SU30_NO2_NULL_XX33	A5_CO_USE_N2O_30DAY_FREQUENCY
drop	SNI_SU30_NO2_NULL_XX33_TEXT	
rename	SNI_SUEVER_KET_1	A0_CO_USE_KETAMINE_EVER_NOALTERS
rename	SNI_SUEVER_KET_30	A1_CO_USE_KETAMINE_EVER
rename	SNI_SUEVER_KET_31	A2_CO_USE_KETAMINE_EVER
rename	SNI_SUEVER_KET_32	A3_CO_USE_KETAMINE_EVER
rename	SNI_SUEVER_KET_33	A4_CO_USE_KETAMINE_EVER
rename	SNI_SUEVER_KET_34	A5_CO_USE_KETAMINE_EVER
drop	SNI_SUEVER_KET_X29_TEXT	
drop	SNI_SUEVER_KET_X30_TEXT	
drop	SNI_SUEVER_KET_X31_TEXT	
drop	SNI_SUEVER_KET_X32_TEXT	
drop	SNI_SUEVER_KET_X33_TEXT	
rename	SNI_SU30_KET_NULL_X1	A0_CO_USE_KETAMINE_30DAY_NOALTRS
rename	SNI_SU30_KET_NULL_XX29	A1_CO_USE_KETAMINE_30DAY_FREQ
drop	SNI_SU30_KET_NULL_XX29_TEXT	
rename	SNI_SU30_KET_NULL_XX30	A2_CO_USE_KETAMINE_30DAY_FREQ
drop	SNI_SU30_KET_NULL_XX30_TEXT	
rename	SNI_SU30_KET_NULL_XX31	A3_CO_USE_KETAMINE_30DAY_FREQ
drop	SNI_SU30_KET_NULL_XX31_TEXT	
rename	SNI_SU30_KET_NULL_XX32	A4_CO_USE_KETAMINE_30DAY_FREQ
drop	SNI_SU30_KET_NULL_XX32_TEXT	
rename	SNI_SU30_KET_NULL_XX33	A5_CO_USE_KETAMINE_30DAY_FREQ
drop	SNI_SU30_KET_NULL_XX33_TEXT	
rename	SNI_SUEVER_PCP_1	A0_CO_USE_PCP_EVER_NO_ALTERS
rename	SNI_SUEVER_PCP_30	A1_CO_USE_PCP_EVER
rename	SNI_SUEVER_PCP_31	A2_CO_USE_PCP_EVER
rename	SNI_SUEVER_PCP_32	A3_CO_USE_PCP_EVER
rename	SNI_SUEVER_PCP_33	A4_CO_USE_PCP_EVER
rename	SNI_SUEVER_PCP_34	A5_CO_USE_PCP_EVER
drop	SNI_SUEVER_PCP_X29_TEXT	
drop	SNI_SUEVER_PCP_X30_TEXT	
drop	SNI_SUEVER_PCP_X31_TEXT	
drop	SNI_SUEVER_PCP_X32_TEXT	
drop	SNI_SUEVER_PCP_X33_TEXT	
rename	SNI_SU30_PCP_NULL_X1	A0_CO_USE_PCP_30DAY_NO_ALTERS
rename	SNI_SU30_PCP_NULL_XX29	A1_CO_USE_PCP_30DAY_FREQUENCY
drop	SNI_SU30_PCP_NULL_XX29_TEXT	
rename	SNI_SU30_PCP_NULL_XX30	A2_CO_USE_PCP_30DAY_FREQUENCY
drop	SNI_SU30_PCP_NULL_XX30_TEXT	
rename	SNI_SU30_PCP_NULL_XX31	A3_CO_USE_PCP_30DAY_FREQUENCY
drop	SNI_SU30_PCP_NULL_XX31_TEXT	
rename	SNI_SU30_PCP_NULL_XX32	A4_CO_USE_PCP_30DAY_FREQUENCY
drop	SNI_SU30_PCP_NULL_XX32_TEXT	
rename	SNI_SU30_PCP_NULL_XX33	A5_CO_USE_PCP_30DAY_FREQUENCY
drop	SNI_SU30_PCP_NULL_XX33_TEXT	
rename	SNI_SAFESXSUP3MO_1	A0_TALK_3MO_SAFE_SEX_NO_ALTERS
rename	SNI_SAFESXSUP3MO_30	A1_TALK_3MO_SAFE_SEX
rename	SNI_SAFESXSUP3MO_31	A2_TALK_3MO_SAFE_SEX
rename	SNI_SAFESXSUP3MO_32	A3_TALK_3MO_SAFE_SEX
rename	SNI_SAFESXSUP3MO_33	A4_TALK_3MO_SAFE_SEX
rename	SNI_SAFESXSUP3MO_34	A5_TALK_3MO_SAFE_SEX
drop	SNI_SAFESXSUP3MO_X29_TEXT	
drop	SNI_SAFESXSUP3MO_X30_TEXT	
drop	SNI_SAFESXSUP3MO_X31_TEXT	
drop	SNI_SAFESXSUP3MO_X32_TEXT	
drop	SNI_SAFESXSUP3MO_X33_TEXT	
rename	SNI_BRTHCTRL3MO_1	A0_TALK_3MO_BIRTHCONTROL_NOALTRS
rename	SNI_BRTHCTRL3MO_30	A1_TALK_3MO_BIRTHCONTROL
rename	SNI_BRTHCTRL3MO_31	A2_TALK_3MO_BIRTHCONTROL
rename	SNI_BRTHCTRL3MO_32	A3_TALK_3MO_BIRTHCONTROL
rename	SNI_BRTHCTRL3MO_33	A4_TALK_3MO_BIRTHCONTROL
rename	SNI_BRTHCTRL3MO_34	A5_TALK_3MO_BIRTHCONTROL
drop	SNI_BRTHCTRL3MO_X29_TEXT	
drop	SNI_BRTHCTRL3MO_X30_TEXT	
drop	SNI_BRTHCTRL3MO_X31_TEXT	
drop	SNI_BRTHCTRL3MO_X32_TEXT	
drop	SNI_BRTHCTRL3MO_X33_TEXT	
rename	SNI_PREP3MO_1	A0_TALK_3MO_PREP_NO_ALTERS
rename	SNI_PREP3MO_30	A1_TALK_3MO_PREP
rename	SNI_PREP3MO_31	A2_TALK_3MO_PREP
rename	SNI_PREP3MO_32	A3_TALK_3MO_PREP
rename	SNI_PREP3MO_33	A4_TALK_3MO_PREP
rename	SNI_PREP3MO_34	A5_TALK_3MO_PREP
drop	SNI_PREP3MO_X29_TEXT	
drop	SNI_PREP3MO_X30_TEXT	
drop	SNI_PREP3MO_X31_TEXT	
drop	SNI_PREP3MO_X32_TEXT	
drop	SNI_PREP3MO_X33_TEXT	
rename	SNI_HIVTEST3MO_1	A0_SCREENED_3MO_HIV_NO_ALTERS
rename	SNI_HIVTEST3MO_30	A1_SCREENED_3MO_HIV
rename	SNI_HIVTEST3MO_31	A2_SCREENED_3MO_HIV
rename	SNI_HIVTEST3MO_32	A3_SCREENED_3MO_HIV
rename	SNI_HIVTEST3MO_33	A4_SCREENED_3MO_HIV
rename	SNI_HIVTEST3MO_34	A5_SCREENED_3MO_HIV
drop	SNI_HIVTEST3MO_X29_TEXT	
drop	SNI_HIVTEST3MO_X30_TEXT	
drop	SNI_HIVTEST3MO_X31_TEXT	
drop	SNI_HIVTEST3MO_X32_TEXT	
drop	SNI_HIVTEST3MO_X33_TEXT	
rename	SNI_STIRISKSUP_1	A0_TALK_3MO_HIV_STI_TEST_NOALTRS
rename	SNI_STIRISKSUP_30	A1_TALK_3MO_HIV_STI_TEST
rename	SNI_STIRISKSUP_31	A2_TALK_3MO_HIV_STI_TEST
rename	SNI_STIRISKSUP_32	A3_TALK_3MO_HIV_STI_TEST
rename	SNI_STIRISKSUP_33	A4_TALK_3MO_HIV_STI_TEST
rename	SNI_STIRISKSUP_34	A5_TALK_3MO_HIV_STI_TEST
drop	SNI_STIRISKSUP_X29_TEXT	
drop	SNI_STIRISKSUP_X30_TEXT	
drop	SNI_STIRISKSUP_X31_TEXT	
drop	SNI_STIRISKSUP_X32_TEXT	
drop	SNI_STIRISKSUP_X33_TEXT	
rename	SNI_TESTEVER_1	SNI_TESTEVER_HIV
rename	SNI_TESTEVER_2	SNI_TESTEVER_STI
rename	SNI_TESTEVER_3	STI_TESTEVER_NONE
rename	SNI_HIVDISC_1	A0_DISCLOSE_TESTRESULT_HIV_NOALT
rename	SNI_HIVDISC_30	A1_DISCLOSE_TESTRESULT_HIV
rename	SNI_HIVDISC_31	A2_DISCLOSE_TESTRESULT_HIV
rename	SNI_HIVDISC_32	A3_DISCLOSE_TESTRESULT_HIV
rename	SNI_HIVDISC_33	A4_DISCLOSE_TESTRESULT_HIV
rename	SNI_HIVDISC_34	A5_DISCLOSE_TESTRESULT_HIV
drop	SNI_HIVDISC_X29_TEXT	
drop	SNI_HIVDISC_X30_TEXT	
drop	SNI_HIVDISC_X31_TEXT	
drop	SNI_HIVDISC_X32_TEXT	
drop	SNI_HIVDISC_X33_TEXT	
rename	SNI_STIDISC_1	A0_DISCLOSE_TESTRESULT_STI_NOALT
rename	SNI_STIDISC_30	A1_DISCLOSE_TESTRESULT_STI
rename	SNI_STIDISC_31	A2_DISCLOSE_TESTRESULT_STI
rename	SNI_STIDISC_32	A3_DISCLOSE_TESTRESULT_STI
rename	SNI_STIDISC_33	A4_DISCLOSE_TESTRESULT_STI
rename	SNI_STIDISC_34	A5_DISCLOSE_TESTRESULT_STI
drop	SNI_STIDISC_X29_TEXT	
drop	SNI_STIDISC_X30_TEXT	
drop	SNI_STIDISC_X31_TEXT	
drop	SNI_STIDISC_X32_TEXT	
drop	SNI_STIDISC_X33_TEXT	
rename	SNI_POLICE_1	A0_TALK_POLICEISSUES_NO_ALTERS
rename	SNI_POLICE_30	A1_TALK_POLICEISSUES
rename	SNI_POLICE_31	A2_TALK_POLICEISSUES
rename	SNI_POLICE_32	A3_TALK_POLICEISSUES
rename	SNI_POLICE_33	A4_TALK_POLICEISSUES
rename	SNI_POLICE_34	A5_TALK_POLICEISSUES
drop	SNI_POLICE_X29_TEXT	
drop	SNI_POLICE_X30_TEXT	
drop	SNI_POLICE_X31_TEXT	
drop	SNI_POLICE_X32_TEXT	
drop	SNI_POLICE_X33_TEXT	
rename	SNI_MULTSEXP3MO_1	A0_3MO_SEXMULTPTNR_NO_ALTERS
rename	SNI_MULTSEXP3MO_30	A1_3MO_SEXMULTPTNR
rename	SNI_MULTSEXP3MO_31	A2_3MO_SEXMULTPTNR
rename	SNI_MULTSEXP3MO_32	A3_3MO_SEXMULTPTNR
rename	SNI_MULTSEXP3MO_33	A4_3MO_SEXMULTPTNR
rename	SNI_MULTSEXP3MO_34	A5_3MO_SEXMULTPTNR
drop	SNI_MULTSEXP3MO_X29_TEXT	
drop	SNI_MULTSEXP3MO_X30_TEXT	
drop	SNI_MULTSEXP3MO_X31_TEXT	
drop	SNI_MULTSEXP3MO_X32_TEXT	
drop	SNI_MULTSEXP3MO_X33_TEXT	
rename	SNI_SAFESEX3MO_1	A0_3MO_SAFESEX_ALWAYS_NO_ALTERS
rename	SNI_SAFESEX3MO_30	A1_3MO_SAFESEX_ALWAYS
rename	SNI_SAFESEX3MO_31	A2_3MO_SAFESEX_ALWAYS
rename	SNI_SAFESEX3MO_32	A3_3MO_SAFESEX_ALWAYS
rename	SNI_SAFESEX3MO_33	A4_3MO_SAFESEX_ALWAYS
rename	SNI_SAFESEX3MO_34	A5_3MO_SAFESEX_ALWAYS
drop	SNI_SAFESEX3MO_X29_TEXT	
drop	SNI_SAFESEX3MO_X30_TEXT	
drop	SNI_SAFESEX3MO_X31_TEXT	
drop	SNI_SAFESEX3MO_X32_TEXT	
drop	SNI_SAFESEX3MO_X33_TEXT	
rename	SNI_STITEST3MO_1	A0_3MO_STI_TEST_NOALTERS
rename	SNI_STITEST3MO_30	A1_3MO_STI_TEST
rename	SNI_STITEST3MO_31	A2_3MO_STI_TEST
rename	SNI_STITEST3MO_32	A3_3MO_STI_TEST
rename	SNI_STITEST3MO_33	A4_3MO_STI_TEST
rename	SNI_STITEST3MO_34	A5_3MO_STI_TEST
drop	SNI_STITEST3MO_X29_TEXT	
drop	SNI_STITEST3MO_X30_TEXT	
drop	SNI_STITEST3MO_X31_TEXT	
drop	SNI_STITEST3MO_X32_TEXT	
drop	SNI_STITEST3MO_X33_TEXT	
rename	SNI_MULTSEXPDIS_1	A0_DISAPPROVE_SEXMULTPTNR_NOALTS
rename	SNI_MULTSEXPDIS_30	A1_DISAPPROVE_SEXMULTPTNR
rename	SNI_MULTSEXPDIS_31	A2_DISAPPROVE_SEXMULTPTNR
rename	SNI_MULTSEXPDIS_32	A3_DISAPPROVE_SEXMULTPTNR
rename	SNI_MULTSEXPDIS_33	A4_DISAPPROVE_SEXMULTPTNR
rename	SNI_MULTSEXPDIS_34	A5_DISAPPROVE_SEXMULTPTNR
drop	SNI_MULTSEXPDIS_X29_TEXT	
drop	SNI_MULTSEXPDIS_X30_TEXT	
drop	SNI_MULTSEXPDIS_X31_TEXT	
drop	SNI_MULTSEXPDIS_X32_TEXT	
drop	SNI_MULTSEXPDIS_X33_TEXT	
rename	SNI_SAFESEXENC_1	A0_APPROVE_SAFESEX_NOALTERS
rename	SNI_SAFESEXENC_30	A1_APPROVE_SAFESEX
rename	SNI_SAFESEXENC_31	A2_APPROVE_SAFESEX
rename	SNI_SAFESEXENC_32	A3_APPROVE_SAFESEX
rename	SNI_SAFESEXENC_33	A4_APPROVE_SAFESEX
rename	SNI_SAFESEXENC_34	A5_APPROVE_SAFESEX
drop	SNI_SAFESEXENC_X29_TEXT	
drop	SNI_SAFESEXENC_X30_TEXT	
drop	SNI_SAFESEXENC_X31_TEXT	
drop	SNI_SAFESEXENC_X32_TEXT	
drop	SNI_SAFESEXENC_X33_TEXT	
rename	SNI_STITESTENC_1	A0_APPROVE_HIV_STI_TEST
rename	SNI_STITESTENC_30	A1_APPROVE_HIV_STI_TEST
rename	SNI_STITESTENC_31	A2_APPROVE_HIV_STI_TEST
rename	SNI_STITESTENC_32	A3_APPROVE_HIV_STI_TEST
rename	SNI_STITESTENC_33	A4_APPROVE_HIV_STI_TEST
rename	SNI_STITESTENC_34	A5_APPROVE_HIV_STI_TEST
drop	SNI_STITESTENC_X29_TEXT	
drop	SNI_STITESTENC_X30_TEXT	
drop	SNI_STITESTENC_X31_TEXT	
drop	SNI_STITESTENC_X32_TEXT	
drop	SNI_STITESTENC_X33_TEXT	
rename	SNI_HIVP_1	A0_DISCLOSE_HIV_POS_NOALTERS
rename	SNI_HIVP_30	A1_DISCLOSE_HIV_POS
rename	SNI_HIVP_31	A2_DISCLOSE_HIV_POS
rename	SNI_HIVP_32	A3_DISCLOSE_HIV_POS
rename	SNI_HIVP_33	A4_DISCLOSE_HIV_POS
rename	SNI_HIVP_34	A5_DISCLOSE_HIV_POS
drop	SNI_HIVP_X29_TEXT	
drop	SNI_HIVP_X30_TEXT	
drop	SNI_HIVP_X31_TEXT	
drop	SNI_HIVP_X32_TEXT	
drop	SNI_HIVP_X33_TEXT	
rename	SNI_EMSUP3MO_1	A0_3MO_SUPPORT_EMOTIONAL
rename	SNI_EMSUP3MO_30	A1_3MO_SUPPORT_EMOTIONAL
rename	SNI_EMSUP3MO_31	A2_3MO_SUPPORT_EMOTIONAL
rename	SNI_EMSUP3MO_32	A3_3MO_SUPPORT_EMOTIONAL
rename	SNI_EMSUP3MO_33	A4_3MO_SUPPORT_EMOTIONAL
rename	SNI_EMSUP3MO_34	A5_3MO_SUPPORT_EMOTIONAL
drop	SNI_EMSUP3MO_X29_TEXT	
drop	SNI_EMSUP3MO_X30_TEXT	
drop	SNI_EMSUP3MO_X31_TEXT	
drop	SNI_EMSUP3MO_X32_TEXT	
drop	SNI_EMSUP3MO_X33_TEXT	
rename	SNI_MATSUP3MO_1	A0_3MO_SUPPORT_MATERIAL
rename	SNI_MATSUP3MO_30	A1_3MO_SUPPORT_MATERIAL
rename	SNI_MATSUP3MO_31	A2_3MO_SUPPORT_MATERIAL
rename	SNI_MATSUP3MO_32	A3_3MO_SUPPORT_MATERIAL
rename	SNI_MATSUP3MO_33	A4_3MO_SUPPORT_MATERIAL
rename	SNI_MATSUP3MO_34	A5_3MO_SUPPORT_MATERIAL
drop	SNI_MATSUP3MO_X29_TEXT	
drop	SNI_MATSUP3MO_X30_TEXT	
drop	SNI_MATSUP3MO_X31_TEXT	
drop	SNI_MATSUP3MO_X32_TEXT	
drop	SNI_MATSUP3MO_X33_TEXT	
rename	SNI_SERVSUP3MO_1	A0_3MO_SUPPORT_SERVICES
rename	SNI_SERVSUP3MO_30	A1_3MO_SUPPORT_SERVICES
rename	SNI_SERVSUP3MO_31	A2_3MO_SUPPORT_SERVICES
rename	SNI_SERVSUP3MO_32	A3_3MO_SUPPORT_SERVICES
rename	SNI_SERVSUP3MO_33	A4_3MO_SUPPORT_SERVICES
rename	SNI_SERVSUP3MO_34	A5_3MO_SUPPORT_SERVICES
drop	SNI_SERVSUP3MO_X29_TEXT	
drop	SNI_SERVSUP3MO_X30_TEXT	
drop	SNI_SERVSUP3MO_X31_TEXT	
drop	SNI_SERVSUP3MO_X32_TEXT	
drop	SNI_SERVSUP3MO_X33_TEXT	
drop	Q569	
//		
drop	SNI_5_FOR_APP	
rename	Q524	SPECIAL_CIRCUMSTANCES_BL_SNI
rename	Q524_1_TEXT	SPECIAL_NOTE_BLSNI_TEXT
//		RACE_DEMO
//		RACE_MIN_DEMO
//		HISP_DEMO






/*cleaned ethnicity hisp/not/missing/unknown for v5 pre merge to match earlier versions*/
gen DEMO_HISP = . 
lab var DEMO_HISP "Cleaned ethnicity (hisp/not) variable for enrollment reporting"
lab def DEMO_HISP_LAB 0"Not Hispanic or Latino" 1"Hispanic or Latino" 99"Unknown or not reported"
lab val DEMO_HISP DEMO_HISP_LAB
replace DEMO_HISP = 1 if RACE_SINGLE == 9
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
replace DEMO_RACE = 1 if RACE_SINGLE == 1
replace DEMO_RACE = 2 if RACE_SINGLE == 2
replace DEMO_RACE = 2 if RACE_SINGLE == 5
replace DEMO_RACE = 3 if RACE_SINGLE == 4
replace DEMO_RACE = 4 if RACE_SINGLE == 3
replace DEMO_RACE = 5 if RACE_SINGLE == 6
replace DEMO_RACE = 6 if RACE_SINGLE == 7
replace DEMO_RACE = 99 if RACE_SINGLE == 9
replace DEMO_RACE = 99 if RACE_SINGLE == 99
replace DEMO_RACE = 99 if RACE_SINGLE == 999

//Recoding/cleaning DEMO_RACE
replace DEMO_RACE = 4 if PID == 2036 //Black according to Brian on 7/15/18; entered "Creole"
replace DEMO_RACE = 5 if PID == 2014 //She is white according to Sara on 7/15/18; entered "Human" race
replace DEMO_RACE = 99 if PID == 2007 //Vi say's he's white. come back to double check w/ SP?  entered "Creole"
replace DEMO_RACE = 99 if PID == 2019 //"OTHER" --> seen but not answered
replace DEMO_RACE = 99 if PID == 2024 //"other race" --> seen but not answered --> yes to hisp/latino
replace DEMO_RACE = 99 if PID == 1127 // "other race --> "Creol" --> recode to biracial? black? other?

/*cleaned racial minority or not dummy variable for NIMH enrollment reporting*/
//(generated in earlier versions) 
gen DEMO_RACEMIN = . 
lab var DEMO_RACEMIN "Cleaned racial minority y/n variable for enrollment reporting to NIMH"
lab val DEMO_RACEMIN YN_DK_LAB
replace DEMO_RACEMIN = 1 if DEMO_RACE != 5 & DEMO_RACE != 99 & DEMO_RACE != .
replace DEMO_RACEMIN = 0 if DEMO_RACE == 5
replace DEMO_RACEMIN = . if DEMO_RACE == . 
replace DEMO_RACEMIN = 99 if DEMO_RACE == 99

/*adjustements to DEMO_RACEMIN responses*/
replace DEMO_RACEMIN = 1 if PID == 2036 //Black according to Brian on 7/15/18; entered "Creole"
replace DEMO_RACEMIN = 0 if PID == 2014 //She is white according to Sara on 7/15/18; entered "Human" race
replace DEMO_RACEMIN = 1 if PID == 2007 //Vi say's he's white. come back to double check w/ SP?  entered "Creole" Creole seems like a racial minority...
replace DEMO_RACEMIN = 1 if PID == 2024 //HISP/LAT and "other" race... maybe come back to double check if should be "unknown"
replace DEMO_RACEMIN = 1 if PID == 1127 //Other --> "creol"

//cis gender yn variable gen --> need to clean
gen GENDER_CISYN = 0
order GENDER_CISYN, after(GENDER_ID_OTHER_TEXT)
lab var GENDER_CISYN "Cis gender dummy variable (yes if biosex=gender)"
lab val GENDER_CISYN YNONLY_LAB
replace GENDER_CISYN = 1 if GENDER_ID_MALE_SELECTED==1 & SEX_AT_BIRTH==1 & GENDER_ID_TRANSMALE_SELECTED==. & GENDER_ID_TRANSFEMALE_SELECTED==. & GENDER_ID_GQNC_SELECTED ==. & GENDER_ID_OTHER_SELECTED == .
replace GENDER_CISYN = 1 if GENDER_ID_FEMALE_SELECTED==1 & SEX_AT_BIRTH==2 & GENDER_ID_TRANSMALE_SELECTED==. & GENDER_ID_TRANSFEMALE_SELECTED==. & GENDER_ID_GQNC_SELECTED ==. & GENDER_ID_OTHER_SELECTED == .
replace GENDER_CISYN = 999 if GENDER_ID_MALE_SELECTED == . & GENDER_ID_FEMALE_SELECTED == . & GENDER_ID_TRANSMALE_SELECTED == . & GENDER_ID_TRANSFEMALE_SELECTED == . & GENDER_ID_GQNC_SELECTED == . & GENDER_ID_OTHER_SELECTED == .


//Create cage score since was summed in v1-4 clean
egen CAGESCORE = rowtotal(CAGE_2_ANNOYEDBYCRITICISM-CAGE_4_EYEOPENER), missing
order CAGESCORE, after(CAGE_4_EYEOPENER)
gen CAGE_CLIN=. 
replace CAGE_CLIN=1 if CAGESCORE >= 2 & CAGESCORE != .
replace CAGE_CLIN=0 if CAGESCORE == 0 | CAGESCORE == 1
lab var CAGE_CLIN "Clinically significant cage score (2 or greater)"



//append v1-4 cleantidy 
///*remote login mac version*/append using "/Volumes/Share/LML_Share/USC LOG MY LIFE STUDY/Data/Quant/Clean Datasets/Clean Baseline Questionnaire Datasets/Basline v1-4_cleantomerge_tidyverse_7.15.18.dta", force
/*in-office version*/ append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Clean Datasets\Clean Baseline Questionnaire Datasets\Basline v1-4_cleantomerge_tidyverse_7.15.18.dta", force


rename DEMO_RACE RACE_DEMO
rename DEMO_HISP HISP_DEMO
rename DEMO_RACEMIN RACE_MIN_DEMO

//quick housed/unhoused dummy
gen HOUSED = 1 if PID >999 & PID <2000
replace HOUSED = 1 if PID >2999 & PID <4000
replace HOUSED = 0 if PID > 1999 & PID < 3000
replace HOUSED = 0 if PID >3999 & PID <5000

sort PID
sort HOUSED
