/**************************************************************************************
									 * RA EXAMPLE *
								  Updated: Mar 2022
								 Updated by: E. Castro
***************************************************************************************/

/***************************************************************************************
							Install user-written packages 
**************************************************************************************/

local user_commands ietoolkit outreg reghdfe ivreghdfe //Add required user-written commands
foreach command of local user_commands {
	cap which `command'
	if _rc == 111 ssc install `command'
}


/**************************************************************************************
						Prepare folder paths and define programs
**************************************************************************************/

* Research Assistant folder paths

if "`c(username)'" == "eleno" {
	global dropbox "/Users/eleno/Dropbox/RA_exam"
	cap cd "/Users/eleno/Dropbox/RA_exam"
}

* Baseline folder globals
global data_raw "${dropbox}/data/raw_data"
global tables "${dropbox}/output/tables"
global clean_data "${dropbox}/data/clean_data""

// Importing the data of instructor ---------------------------------------------------
*use "$clean_data/student_data.dta", clear
import delimited "$data_raw/data_instructor.csv", delimiter(comma) clear

/**************************************************************************************
								Labeling the data
**************************************************************************************/

// data -------------------------------------------------------------------------------
label data "Instructor's data" 

// variables --------------------------------------------------------------------------
label variable teacher_id    "Teacher ID" 
label variable school_id     "School ID" 
label variable grade 	     "Grade" 
label variable class         "Class" 
label variable treatment     "Treatment" 
label variable training      "Trainned" 
label variable treatment_2 	 "Treatment group assigned" 

// values -----------------------------------------------------------------------------

label define treatmentl 1 "Treatment Group" 0 "Control Group" 

label values treatment treatmentl

// finding duplicates on Student_id ----------------------------------------------------
sort teacher_id school_id grade class treatment training treatment_2

quietly by teacher_id school_id grade class treatment training treatment_2: ///
  gen dup = cond(_N==1,0,_n)

// droping duplicates
drop if dup > 1
drop dup

// merging ----------------------------------------------------------------------------
merge 1:m school_id grade class using "data/clean_data/student_data.dta", nogen


/**************************************************************************************
						      Creating vars for the example
**************************************************************************************/

//italian female
gen italian = nationality == 1
gen female = gender == 1

label variable italian   "Italian's ratio" 
label variable female    "Female's ratio" 

// Grades average

egen avg_grade_t1 = rmean(grade_math_t1 grade_language_t1 grade_science_t1)
egen avg_grade_t2 = rmean(grade_math_t2 grade_language_t2 grade_science_t2)

label variable avg_grade_t1   "Grade's average period 1" 
label variable avg_grade_t2   "Grade's average period 2"  

// Avg Like

foreach var in q1b q2b q3b  {
	gen `var'_d = (`var' >= 4)
} 

egen avg_like = rmean(q1b_d q2b_d q3b_d)

label variable avg_like   "Average like"

// Avg Agree

foreach var in q4b q5b q6b q7b {
	gen `var'_d = (`var' >= 4)
}

egen avg_agree = rmean(q4b_d q5b_d q6b_d q7b_d)

label variable avg_agree   "Average agree"

// Future plan

tab q8, gen(plan_future)


drop q1b_d q2b_d q3b_d q4b_d q5b_d q6b_d q7b_d

/**************************************************************************************
						      NA to zero in baseline
**************************************************************************************/
foreach var in italian female avg_grade_t1 avg_agree avg_like {
	replace `var' = 0  if `var' == .
}

foreach var of varlist plan_future*  {
	replace `var' = 0  if `var' == .
}

/**************************************************************************************
								Balance table
**************************************************************************************/

	
iebaltab italian female avg_grade_t1 avg_agree avg_like plan_future*, ///
	grpvar(treatment) ///
	vce(cluster teacher_id) ///
	savetex("$tables/balance.tex") ///
	replace onenrow ftest rowvarlabel


/**************************************************************************************
								Results 1 - ITT
**************************************************************************************/

local variables_admin "female italian"
local variables_surv "avg_agree avg_like plan_future1 plan_future2 plan_future3 plan_future4 plan_future5 plan_future6"

*Column (1) School FE
xi:reghdfe avg_grade_t2 treatment, absorb(school_id) vce(cluster teacher_id)
outreg2 using "$tables/results_1.tex", replace label addtext(School FE, YES)

*Column (2) adding average grade of period 1
xi:reghdfe avg_grade_t2 treatment avg_grade_t1, absorb(school_id) vce(cluster teacher_id)
outreg2 using "$tables/results_1.tex", append label addtext(School FE, YES)

*Column (3) adding variables_admin
xi:reghdfe avg_grade_t2 treatment avg_grade_t1 `variables_admin', absorb(school_id) vce(cluster teacher_id)
outreg2 using "$tables/results_1.tex", append label addtext(School FE, YES)

*Column(4) adding variables_surv
xi:reghdfe avg_grade_t2 treatment avg_grade_t1 `variables_admin' `variables_surv', absorb(school_id) vce(cluster teacher_id)
outreg2 using "$tables/results_1.tex", append label addtext(School FE, YES)


/**************************************************************************************
								Results 2 - TOT
**************************************************************************************/

*Column (1) School FE
xi:ivreghdfe avg_grade_t2 (training = treatment), absorb(school_id) cluster (teacher_id)
outreg2 using "$tables/results_2.tex", replace label addtext(School FE, YES)

*Column (2) adding average grade of period 1
xi:ivreghdfe avg_grade_t2 avg_grade_t1 (training = treatment), absorb(school_id) cluster (teacher_id)
outreg2 using "$tables/results_2.tex", append label addtext(School FE, YES)

*Column (3) adding variables_admin
xi:ivreghdfe avg_grade_t2 avg_grade_t1 `variables_admin' (training = treatment), absorb(school_id) cluster (teacher_id)
outreg2 using "$tables/results_2.tex", append label addtext(School FE, YES)

*Column(4) adding variables_surv
xi:ivreghdfe avg_grade_t2 avg_grade_t1 `variables_admin' `variables_surv' (training = treatment), absorb(school_id) cluster (teacher_id)
outreg2 using "$tables/results_2.tex", append label addtext(School FE, YES)
