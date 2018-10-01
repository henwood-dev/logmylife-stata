version 15

//reorder variables how I like them...
order INTNAME-CONSENT first
order PID first
order RESPOSNEID after PID


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
drop RECIPIENT EMAIL
drop EXTERNALREFERENCE

lab var LOCATIONLATITUDE "Location of survey - latitude"
lab var LOCATIONLONGITUDE "Location of survey - longitude"
lab var DISTRIBUTIONCHANNEL "Qualtrics Distrubution Channel (anonymous link/preview link/etc)"
lab var USERLANGUAGE "User language"
lab var INTNAME "Interviewer Name"
lab var DATE "Interview date (entered by interviewer MM/DD/YYYY)"
lab var PID "Participant ID"

lab var SURVEY-TYPE "Survey type, housed/not housed"
lab def SURVEY-TYPE_LAB 1"Housed" 2"Unhoused" -99"Seen but not answered"
lab val SURVEY-TYPE SURVEY-TYPE_LAB

//make sure to add new sites as we go. 
lab var SITE_HOUSED "Recruitment site, housed"
lab def SITE_HOUSED_LAB 1"Jovenes TLP" 2"Jovenes SH (Progress Place)" 4"Jovenes Scattered Site SH" 5"CRCD Epworth Apts SH" 6"CRCD 28th Street Apts SH" 7"Young Burlington SH" 8"Covenant House TLP" 9"Ruth's Place TLP" 77"Other (please specify) -99"Seen but not answered", modify
lab val SITE_HOUSED SITE_HOUSED_LAB

lab var SITE_UNHOUSED "Recruitment site, unhoused"
lab def SITE_UNHOUSED_LAB 1"Jovenes ES" 2"Jovenes-OTHER" 4"CRCD Ruth's Place Drop-in" 77"Other, (please specify)" -99"Seen but not answered"
lab val SITE_UNHOUSED SITE_UNHOUSED_LAB


lab var CONSENTCOMP "Consent comprehension questions asked y/n"
lab def YNONLY_LAB 1"Yes" 0"No" -99"Seen but not answered"
lab val CONSENTCOMP YNONLY_LAB

lab var CONSENT "Consent signed y/n"
lab val CONSENT YNONLY_LAB

lab var DOB "birthdate"

lab var HISP "hispanic/latino"
lab def YN-DK_LAB 1"Yes" 0"No" 99"Don't know" -99"Seen but not answered"
lab val HISP YN_DK_LAB

lab var RACE "race"
lab def RACE_LAB 1"American Indian or Alaska Native" 2"Asian" 3"Black or African American" 4"Native Hawaiian or other Pacific Islander" 5"South Asian" 6"White" 7"Bi/Multi Racial or Ethnic" 8"Other, please specify" 99"I don't know" -99"Seen but not answered"
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


lab var RESEARCH_LAST "Last research study involvement"
lab def RESEARCH_LAST_LAB 1"Less than 1 month ago" 2"1-3 months ago" 3"4-6 months ago" 4"6-12 months ago" 5"1-3 years ago" 0"I have never participated in a research study before this" -99"Seen but not answered"
lab val RESEARCH_LAST RESEARCH_LAST_LAB

rename RESEARCH_TYPES_1 RESEARCHTYPE_HIV
lab var RESEARCHTYPE_HIV "Type of research involved in: HIV prevention or risk selected"
rename RESEARCH_TYPES_2 RESEARCHTYPE_SU
lab var RESEARCHTYPE_SU "Type of research involved in: Substance use selected"
rename RESEARCH_TYPES_3 RESEARCH_TYPES_SEX
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
lab var REASONHOMELESS_17_text "Cause of homelessness: OTHER text entry"

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
lab var HOUSINGPROGS_EVER_20_text "Places lived since becoming homeless: OTHER text entry"

lab var TIMEHOMELESS_EVER "total duration of homelessness over lifetime"
lab def HMLS-HOUSEDTIME_LAB 1"Less than 1 month" 2"1-3 months" 3"4-6 months" 4"7-9 months" 5"10-11 months" 6"1-2 years" 7"3-4 years" 8"5-6 years" 9"7-8 years" 10"9 or more years" -99"Seen but not answered"
lab val TIMEHOMELESS_EVER HMLS-HOUSEDTIME_LAB

lab var TIMEHOUSED "length of stay at current housing program"
lab val TIMEHOUSED HMLS-HOUSEDTIME_LAB

lab var STAYBEFOREHOUSED "place of stay most of the time immediately before being housed"
lab def STAYBEFOREHOUSED_LAB 1"family home" 2"foster family home" 3"relative's home" 4"friend's home" 5"home of romantic/intimate partner" 6"group home" 7"adult emergency/short-term shelter (<30 days)" 8"youth emergency/short-term shelter (<30 days)" 9"adult longer-term shelter (>30 days)" 10"Youth-only longer-term shelter (>30 days)" 11"hotel/motel" 12"sober living facility" 13"juvenile detention center or jail" 14"TLP" 15"PSH/SH program" 16"own apartment" 17"street/park/beach/outside" 18"abandoned building/squat" 19"car/bus/light rail/metro" 20"Other please specify" -99"Seen but not answered"
lab val STAYBEFOREHOUSED STAYBEFOREHOUSED_LAB

rename var STAYBEFOREHOUSED_20_TEXT STAYBEFOREHOUSED_OTHER
lab var STAYBEFOREHOUSED_OTHER "place of stay most of the time immediately before being housed_other text entry"

lab var TIMEHOMELESS_BEFOREH "duration of most recent homeless episode for HOUSED SP"
lab val TIMEHOMELESS_BEFOREH HMLS-HOUSEDTIME_LAB

lab var TIMEHOMELESS_RECENT "duration of current/most recent homeless episode for UNHOUSED SP"
lab val TIMEHOMELESS_RECENT HMLS-HOUSEDTIME_LAB

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

/*
STRESS_STREETS
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
HIV_ST
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
SU_INST
SUTYPES_EVER
OTHERSU_TYPE
TOBACCO_LAST
TOBACCO_TYPES
TOBACCO_SMOKEFREQ
TOBACCO_DAILYAMT
TOBACCO_WEEKLYAMT
TOBACCO_SMOKELESSFREQ
TOBACCO_VAPEFREQ
ALC_LAST
ALC_30
ALC_30_BINGE_F
ALC_30_BINGE_M
MARJ_LAST
MARJ_30
MARJ_30_TYPES
MARJ_30_ROA
MARJ_FREQCURR
MARJ_HPD30D
MARJ_FREQACCPT
MARJ_AMTWK
MARJ_ACCESS
MARJ_CARD
METH_LAST
METH_30
METH_30_ROA
MDMA_LAST
MDMA_30
MDMA_30_ROA
SYNTHMJ_LAST
SYNTHMJ_30
HALLUC_LAST
HALLUC_30
HALLUC_30_TYPES
PDM_INSTR
PDM_LAST
PDM_30
PDM_30_ROA
PDM_30_TYPES
HEROIN_LAST
HEROIN_30
HEROIN_30_ROA
COCAINE_LAST
COCAINE_30
COCAINE_30_ROA
CRACK_LAST
CRACK_30
CRACK_30_ROA
INHAL_LAST
INHAL_30
STEROID_LAST
STEROID_30
STEROID_30_ROA
NITROUS_LAST
NITROUS_30
KETA_LAST
KETA_30
PCP_LAST
PCP_30
PCP_30_ROA
OTHERSU_LAST
OTHERSU_30
OTHERSU_30_ROA
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
drop if RESPONSEID == "R_3dLBmeVaJN1KDsD" | RESPONSEID == "R_3HRMuFtiDaFj7RD"


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
replace SITE_HOUSED = 9 if PID == 1021
replace SITE_UNHOUSED = . if PID == 1021

//Combine partial surveys:
/* combine 1004's two surveys into one (response ID "R_1o0ursi841wl4tT" is first half;  "R_72GUjPfXIWKYOlP" is second half) */ 

/* combine 1014's two surveys or drop one of the two: "R_eaPtOykJQhKLnOh" "R_3nvdffglc9gRmC7" */


// Make known changes to baseline survey responses:
/* fix 4008's (formerly 2008's) SUcost_30d_marj response to $20 or more (but don't have that response option... $50 or less? --> */ 
replace SUCOST_30DMARJ = . 

/* fix 2002's resposne to alc_30_binge_m to 0 */ 
replace ALC_30_BINGE_M = 0 if responseid == "R_2pKaU8QjbpCuDr9" & pid == 2002



/* merge in other surveys from other files? */ 


