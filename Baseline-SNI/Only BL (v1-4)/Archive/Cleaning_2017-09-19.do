//version 15


/*Delete all test responses*/
drop if responseid == "R_3dLBmeVaJN1KDsD" 	| responseid == "R_3HRMuFtiDaFj7RD"
clear


/*Recode incorrect PIDs: 1 of 2 1024's to 2017; 2 BL onlys to 4008 and 4016; 1 of 2 1034's to 1036*/
replace pid = 2017 if responseid == "R_1GUHNGNcf1AYuJY"
replace pid = 4008 if responseid == "R_1exDzqYGNb34xQq"
replace pid = 4016 if responseid == "R_1Fb1Tth45hmne1q"	
replace pid = 1036 if responseid == "R_2PmUtgGazr5a8z7"
clear


// clean recode "other" recruitment site entries
/* first for YB */
replace site_housed = 7 if pid == 1034
replace site_housed = 7 if pid == 1035
replace site_housed = 7 if pid == 1036
replace site_housed = 7 if pid == 1037
replace site_housed = 7 if pid == 1038
replace site_housed = 7 if pid == 1039
replace site_housed = 7 if pid == 1040
replace site_housed = 7 if pid == 1041
replace site_housed = 7 if pid == 1042
replace site_housed = 7 if pid == 1043
replace site_housed = 7 if pid == 1044

/*ruth's place TLP */
replace site_housed = 9 if pid == 1020
replace site_housed = 9 if pid == 1021
replace site_unhoused = . if pid == 1021

//Combine partial surveys:
/* combine 1004's two surveys into one (response ID "R_1o0ursi841wl4tT" is first half;  "R_72GUjPfXIWKYOlP" is second half) */ 

/* combine 1014's two surveys or drop one of the two: "R_eaPtOykJQhKLnOh" "R_3nvdffglc9gRmC7" */


// Make known changes to baseline survey responses:
/* fix 4008's (formerly 2008's) SUcost_30d_marj response to $20 or more (but don't have that response option... $50 or less?*/ 


/* fix 2002's resposne to alc_30_binge_m to 0 */ 
replace alc_30_binge_m = 0 if responseid == "R_2pKaU8QjbpCuDr9" AND pid == 2002



/* merge in other surveys from other files? */ 


