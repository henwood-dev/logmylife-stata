version 15

clear

//import raw, formattted csv file for all who took Baseline Version 2 (edits 2017-07-11; taken by all enrolled from July 2017-November 2017
import delimited "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Baseline\Version 2 (edits 2017-07-11)\LogMyLife Baseline Questionnaire - (edits 2017-07-11)_December 18, 2017_14.41_formatted", delimiter(comma) varnames(1) case(upper)


//reorder variables how I like them...
order INTNAME-CONSENT, first
order PID, first
order RESPONSEID, after(PID)

//insert observation for 3007 (SP that accidentally took HES + SNI instead of BL + SNI then was no-show for phone setup appt and never was able to be recontacted
insobs 1
replace PID = 3007 if PID == . 
replace SEX = 2 if PID == 3007
replace HISP = 999 if PID == 3007
replace RACE = 999 if PID == 3007
replace SURVEYTYPE = 1 if PID == 3007
replace SITE_HOUSED = 5 if PID == 3007

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


//drop unneccessary variables
drop RECIPIENTLASTNAME
drop RECIPIENTFIRSTNAME
drop RECIPIENTEMAIL
drop EXTERNALREFERENCE

//rename variables as needed to match all versions/corrected names
rename RACE_8_TEXT RACE_OTHER
rename BIRACE_8_TEXT BIRACE_OTHER
rename GENDER_1 GENDER_M
rename GENDER_2 GENDER_F
rename GENDER_3 GENDER_TM
rename GENDER_4 GENDER_TF
rename GENDER_5 GENDER_GQNC
rename GENDER_6 GENDER_OTHER
rename GENDER_6_TEXT GENDER_OTHER_TEXT
rename SEXORI_6_TEXT SEXORI_OTHER
rename SEXATTR_FORMALES SEXATTR
rename RESEARCH_TYPES_1 RESEARCHTYPE_HIV
rename RESEARCH_TYPES_2 RESEARCHTYPE_SU
rename RESEARCH_TYPES_3 RESEARCHTYPE_SEX
rename RESEARCH_TYPES_4 RESEARCHTYPE_OTHER
rename RESEARCH_TYPES_99 RESEARCHTYPE_DK
rename RESEARCH_TYPES_4_TEXT RESEARCHTYPE_OTHER_TEXT
rename ROMREL_PTNRSGNDR_1 ROMREL_PTNRSGNDR_M
rename ROMREL_PTNRSGNDR_2 ROMREL_PTNRSGNDR_F
rename ROMREL_PTNRSGNDR_3 ROMREL_PTNRSGNDR_TM
rename ROMREL_PTNRSGNDR_4 ROMREL_PTNRSGNDR_TF
rename ROMREL_PTNRSGNDR_5 ROMREL_PTNRSGNDR_GQ
rename ROMREL_PTNRSGNDR_6 ROMREL_PTNRSGNDR_OTHER
rename ROMREL_PTNRSGNDR_6_TEXT ROMREL_PTNRSGNDR_OTHER_TXT
rename STAYBEFOREHOUSED_20_TEXT STAYBEFOREHOUSED_OTHER
rename MH_DX_MH_DX_1 MHDX_ADHD
rename MH_DX_MH_DX_2 MHDX_PTSD
rename MH_DX_MH_DX_3 MHDX_ODCD
rename MH_DX_MH_DX_4 MHDX_MDD
rename MH_DX_MH_DX_5 MHDX_BPD
rename MH_DX_MH_DX_6 MHDX_SCHIZ
rename MH_DX_MH_DX_7 MHDX_ANX
rename MH_DX_MH_DX_8 MHDX_PD
rename MH_DX_MH_DX_9 MHDX_OTHER
rename MH_DX_OTHER MHDX_OTHER_TXT

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

rename MED_12MO MHC12MO_RX
rename THER_12MO MHC12MO_THER
rename ER_12MO MHC12MO_ER
rename HOSPIT_12MO MHC12MO_INPAT
rename UNMET_12MO MHC12MO_UNMET
rename MHNEED_PERCEIVE MHC_NEEDCURR 
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
/*dont forget to recode reverse scored items when gen sum score*/
rename MOSEX* SEX3MO*
rename HIVP_TESTLOC_9_TEXT HIVP_TESTLOC_OTHER
rename STI_POS_7 STI_POS_OTHER
rename STI_POS_7_TEXT STI_POS_OTHER_TXT
rename SUTYPES_USE_EVER_0 SUEVER_NONE
rename SUTYPES_USE_EVER_1 SUEVER_TOB
rename SUTYPES_USE_EVER_2 SUEVER_ALC
rename SUTYPES_USE_EVER_3 SUEVER_MJ
rename SUTYPES_USE_EVER_4 SUEVER_METH
rename SUTYPES_USE_EVER_5 SUEVER_MDMA
rename SUTYPES_USE_EVER_6 SUEVER_SMJ
rename SUTYPES_USE_EVER_7 SUEVER_HALL
rename SUTYPES_USE_EVER_8 SUEVER_PDM
rename SUTYPES_USE_EVER_9 SUEVER_HER
rename SUTYPES_USE_EVER_10 SUEVER_COC
rename SUTYPES_USE_EVER_11 SUEVER_CRACK
rename SUTYPES_USE_EVER_12 SUEVER_INHAL
rename SUTYPES_USE_EVER_13 SUEVER_STEROID
rename SUTYPES_USE_EVER_14 SUEVER_N20
rename SUTYPES_USE_EVER_15 SUEVER_KET
rename SUTYPES_USE_EVER_16 SUEVER_PCP
rename SUTYPES_USE_EVER_17 SUEVER_OTHER
rename OTHERSU_TYPE SUEVER_OTHER_TEXT
rename TOBACCO_VEPFREQ TOBACCO_VAPEFREQ
/*NOTE: just noticed that MARJ_FREQACCPT does not have a response option for not at all! Do we change it to add a response now? Or is it too late?*/
rename MARJ_AMTWK_1 MARJ_AMTWK_PLNT
rename MARJ_AMTWK_2 MARJ_AMTWK_CONC
rename IVDU_NEEDLEEXH IVDU_NEEDLEEXCH
rename SYTX_PASTYEAR SUTX_PASTYEAR
rename SUCOST_30D_ALCOHOL SUCOST_30D_ALC
rename SUCOST_30D_ALCOHOL_1_TEXT SUCOST_30D_ALC_UND50TXT
rename SUCOST_30D_MARJ_X1_TEXT SUCOST_30D_MARJ_UND50TXT
rename SUCOST_30D_ILDRUG_XX1_TEXT SUCOST_30D_ILDRUG_UND50TXT
rename CELL_BILL_6_TEXT CELL_BILL_OTHER1TXT
rename CELL_BILL_7_TEXT CELL_BILL_OTHER2TXT
rename VICT_IPV_VIC VICT_IPV
rename VICT_IPV_PERP PERP_IPV
rename GANG_CUR GANG_CURFMR
rename GANG_FMR GANG_CURACTV
rename Q524 INTERVIEWNOTE
rename Q524_1_TEXT INTERVIEWNOTE_TEXT
drop Q525

/*Delete all test responses*/
drop if RESPONSEID == "R_3dLBmeVaJN1KDsD" | RESPONSEID == "R_3HRMuFtiDaFj7RD" | RESPONSEID == "R_1Q9lqUXMprXCHUH"

//append data from Baseline Version 1 (cleaned)
append using "S:\LML_Share\USC LOG MY LIFE STUDY\Data\Quant\Raw Data-Cleaning\Qualtrics Survey Data\Baseline\Version 1 (edits 2017-05-30)\Cleaned 5-30-17 version dataset ready to merge.dta", nolabel force


/*Recode incorrect PIDs: 1 of 2 1024's to 2017; 4 BL onlys to 4008, 4016, 3003, 3025, 3046; 1 of 2 1034's to 1036*/
replace PID = 2017 if RESPONSEID == "R_1GUHNGNcf1AYuJY"
replace PID = 4008 if RESPONSEID == "R_1exDzqYGNb34xQq"
replace PID = 4016 if RESPONSEID == "R_1Fb1Tth45hmne1q"	
replace PID = 1036 if RESPONSEID == "R_2PmUtgGazr5a8z7"
replace PID = 3025 if RESPONSEID == "R_pFaeDxOuzvRPFkZ"
replace PID = 3003 if RESPONSEID == "R_wTrw4o4fQzrcgUh"
replace PID = 3046 if RESPONSEID == "R_2AQdJ7QXdBSRZDC"

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

/*harbor interfaith recoding (changed SITE_HOUSED = 10 to be SPA8RR, and SITE_HOUSED=-10 to hathaway sycamores TLP*/
replace SITE_HOUSED = -10 if PID == 1052

/*fix unhoused 2017 who had Jovenes-OTHER but was in ES*/
replace SITE_UNHOUSED=1 if PID == 2017

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

/*fix 1041's gender from female to male*/
replace GENDER_F=. if PID==1041
replace GENDER_M=1 if PID==1041

/* change 2004's SEXORI to heterosexual b/c replied "other" to sexori and wrote-in "Fuck ugly bitches nigga"*/
replace SEXORI = 3 if PID == 2004

//sort how I want it
sort PID

//Create demographic reporting variables for enrollment reports to NIH and NIMH

/*clean raw race/eth/sex variables as needed*/
replace RACE = 3 if PID == 1008
replace RACE = 99 if PID == 1009
replace RACE = 99 if PID == 1010
replace RACE = 99 if PID == 1011
replace RACE = 99 if PID == 1014
replace RACE = 999 if PID == 1015
replace RACE = 999 if PID == 3025
replace RACE = 6 if PID == 1032
replace RACE = 99 if PID == 2006
replace RACE = 7 if PID == 2009
replace RACE = 99 if PID == 2002
replace RACE = 99 if PID == 2003
replace RACE = 99 if PID == 2004

replace HISP = 1 if PID == 1037

replace SEX = 1 if PID == 1041
replace SEX = 1 if PID == 2005
replace SEX = 2 if PID == 4008 /*NEED TO REVISIT THIS: do we want to keep as recoded to female? or change back to seen but not answered since we don't know for 100% sure? or analyze as female but with * in methods section explaining?*/

/*cleaned ethnicity hisp/not/missing/unknown*/
gen DEMO_HISP = . 
/*lab var DEMO_HISP "Cleaned ethnicity (hisp/not) variable for enrollment reporting"
lab def DEMO_HISP_LAB 0"Not Hispanic or Latino" 1"Hispanic or Latino" 99"Unknown or not reported"
lab val DEMO_HISP DEMO_HISP_LAB*/
replace DEMO_HISP = 0 if HISP == 0
replace DEMO_HISP = 1 if HISP == 1
replace DEMO_HISP = 99 if HISP == 99 
replace DEMO_HISP = 99 if HISP == 999
/*cleaning/recoding DEMO_HISP responses*/

/*cleaned race as 1 of 5 race categories, more than one race, and unknown or not reported*/
gen DEMO_RACE = . 
/*lab var DEMO_RACE "Cleaned race variable for enrollment reporting"
lab def DEMO_RACE_LAB 1"American Indian/Alaska Native" 2"Asian" 3"Native Hawaiian or Other Pacific Islander" 4"Black or African American" 5"White" 6"More than one race" 99"Unknown or not reported"
lab val DEMO_RACE DEMO_RACE_LAB*/
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
/*lab var DEMO_RACEMIN "Cleaned racial minority y/n variable for enrollment reporting to NIMH"
lab val DEMO_RACEMIN YN_DK_LAB*/
replace DEMO_RACEMIN = 1 if DEMO_RACE != 5 & DEMO_RACE != 99 & DEMO_RACE != .
replace DEMO_RACEMIN = 0 if DEMO_RACE == 5
replace DEMO_RACEMIN = . if DEMO_RACE == . 
replace DEMO_RACEMIN = 99 if DEMO_RACE == 99
/*adjustements to DEMO_RACEMIN responses*/
replace DEMO_RACEMIN = 1 if PID == 1015

/*cis gender yn variable gen
gen GENDER_CISYN = 0
order GENDER_CISYN, after(GENDER_OTHER_TEXT)
lab var GENDER_CISYN "Cis gender dummy variable (yes if biosex=gender)"
lab val GENDER_CISYN YNONLY_LAB
replace GENDER_CISYN = 1 if GENDER_M==1 & SEX==1 & GENDER_TM==. & GENDER_TF==. & GENDER_GQNC ==. & GENDER_OTHER==. 
replace GENDER_CISYN = 1 if GENDER_F==1 & SEX==2 & GENDER_TM==. & GENDER_TF==. & GENDER_GQNC ==. & GENDER_OTHER==. 
replace GENDER_CISYN = 999 if GENDER_M == . & GENDER_F == . & GENDER_TM == . & GENDER_TF == . & GENDER_GQNC == . & GENDER_OTHER == .
[going to do all this in updated .do file after appending this data*/

/*clean DOB convert to date, gen age var*/ 
replace DOB = "9/05/1994" if PID == 1004
replace DOB = "9/20/1993" if PID == 1014



//Generate all variables for future versions w/ empty values (updated for versions 3, 3.1 and 4)
//drop variable(s) that were removed/deemed unnecessary in current survey versions
drop CONSENTCOMP
//Version 3 new vars:
gen HIVP_TX_WHY_6=.
order HIVP_TX_WHY_6, after(HIVP_TX_WHY_4)
gen HIVP_MEDS_WHYNOT_7=.
order HIVP_MEDS_WHYNOT_7, after(HIVP_MEDS_WHYNOT_5)
gen PREP_BARRIERS_11=.
order PREP_BARRIERS_11, after(PREP_BARRIERS_8)
gen MARJ_ACCESS_8=.
order MARJ_ACCESS_8, after(MARJ_AMTWK_CONC)
gen TECH_ACCESS_WHERE_9=.
order TECH_ACCESS_WHERE_9, after(TECH_ACCESS_WHERE_7)
gen UH_LIVSIT_3MO_17=.
gen UH_LIVSIT_3MO_18=.
gen UH_LIVSIT_3MO_19=.
gen UH_LIVSIT_3MO_1=.
gen UH_LIVSIT_3MO_2=.
gen UH_LIVSIT_3MO_3=.
gen UH_LIVSIT_3MO_4=.
gen UH_LIVSIT_3MO_5=.
gen UH_LIVSIT_3MO_6=.
gen UH_LIVSIT_3MO_7=.
gen UH_LIVSIT_3MO_8=.
gen UH_LIVSIT_3MO_9=.
gen UH_LIVSIT_3MO_10=.
gen UH_LIVSIT_3MO_11=.
gen UH_LIVSIT_3MO_12=.
gen UH_LIVSIT_3MO_13=.
gen UH_LIVSIT_3MO_14=.
gen UH_LIVSIT_3MO_15=.
gen UH_LIVSIT_3MO_16=.
gen UH_LIVSIT_3MO_20=.
gen UH_LIVSIT_3MO_20_TEXT=.
gen UH_LIVSIT_CURR=.
gen UH_LIVSIT_CURR_20_TEXT=.
order UH_LIVSIT_3MO_17-UH_LIVSIT_CURR_20_TEXT, after(TIMEHOMELESS_RECENT)

//generate empty fields for variables for variables added in v3.1 and v4
/*TTLINCOME_BENEFITS, added in BL v3.1*/
gen TTLINCOME_BENEFITS=.
order TTLINCOME_BENEFITS, after(TTLINCOME_EMPLOY)
/*HFIAS scale items, added in baseline v4*/
gen HFIAS_1=.
gen HFIAS_1_A=.
gen HFIAS_2=.
gen HFIAS_2_A=.
gen HFIAS_3=.
gen HFIAS_3_A=.
gen HFIAS_4=.
gen HFIAS_4_A=.
gen HFIAS_5=.
gen HFIAS_5_A=.
gen HFIAS_6=.
gen HFIAS_6_A=.
gen HFIAS_7=.
gen HFIAS_7_A=.
gen HFIAS_8=.
gen HFIAS_8_A=.
gen HFIAS_9=.
gen HFIAS_9_A=.
order HFIAS_1-HFIAS_9_A, after(TTLINCOME_INFORMAL)

//add survey version variable for all obs=2, then replace for those who took v1
gen BLVERSION=2
order BLVERSION, after(DATE)
replace BLVERSION=1 if PID==1001
replace BLVERSION=1 if PID==1002
replace BLVERSION=1 if PID==1004
replace BLVERSION=1 if PID==1005
replace BLVERSION=1 if PID==1010
replace BLVERSION=1 if PID==1011
replace BLVERSION=1 if PID==1013
replace BLVERSION=1 if PID==1014
replace BLVERSION=1 if PID==2001
replace BLVERSION=1 if PID==2002
replace BLVERSION=1 if PID==2003
replace BLVERSION=1 if PID==2004
replace BLVERSION=1 if PID==2005
replace BLVERSION=1 if PID==2006
replace BLVERSION=1 if PID==3003
