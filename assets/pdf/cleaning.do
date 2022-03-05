/**************************************************************************************
									 * RA EXAMPLE *
								  Updated: Mar 2022
								 Updated by: E. Castro
***************************************************************************************/



/***************************************************************************************
							Install user-written packages 
**************************************************************************************/

local user_commands estout //Add required user-written commands
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
global clean_data "${dropbox}/data/clean_data"

// Importing the data ------------------------------------------------------------------

import delimited "$data_raw/data_survey.csv", delimiter(comma) clear


/**************************************************************************************
								Labeling the data
**************************************************************************************/

// data -------------------------------------------------------------------------------
label data "Pre-treatment data at student level" 

// variables --------------------------------------------------------------------------
label variable student_id   "Student ID" 
label variable school_id    "School ID" 
label variable grade 	    "Grade" 
label variable class        "Class" 
label variable q1           "Would you say you enjoy studying mathematics?"
label variable q2           "Would you say you enjoy studying Language?"
label variable q3           "Would you say you enjoy studying science?"
label variable q4           "Would you agree: I believe my teacher cares about my learning"
label variable q5           "Would you agree: I believe my teacher cares about my well-being."
label variable q6           "Would you agree: I believe my teacher helps create an inclusive environment in the classroom."
label variable q7           "Would you agree: I believe my school provides adequate resources for underrepresented students."
label variable q8           "What are your plans for the future?"
label variable complete_survey  "Survey completed"

// values -----------------------------------------------------------------------------


// droping NA -------------------------------------------------------------------------

foreach var of varlist q* {
	replace `var' = "" if `var' == "NA"
}

// finding duplicates on Student_id ----------------------------------------------------
sort student_id
quietly by student_id:  gen dup = cond(_N==1,0,_n)

// droping incomplete and duplicates surveys ------------------------------------------
drop if complete_survey == 0 & dup > 0

// finding duplicates on Student_id ----------------------------------------------------
sort student_id
quietly by student_id:  replace dup = cond(_N==1,0,_n)

// droping duplicates
drop if dup > 1

* droping useless variables
drop dup complete_survey

* lower case student id
replace student_id = lower(student_id)

/**************************************************************************************
								Creating numeric variables
**************************************************************************************/

*q1 to q3
label define q1_3 1 "Not at all" 2 "Slightly" 3 "Somewhat" 4 "Much" 5 "Very much"

foreach var in q1 q2 q3 {
	encode `var', generate(`var'b) label (q1_3)
}

*q4 to q7
label define q4_7 1 "Strongly disagree" 2 "Disagree" 3 "Neutral" 4 "Agree" 5 "Strongly agree"

foreach var in q4 q5 q6 q7 {
	encode `var', generate(`var'b) label (q4_7)
}

*q8
encode q8, generate(q8b)

tempfile data_survey
save `data_survey.dta', replace

/**************************************************************************************
								Merging with admin 
**************************************************************************************/

import delimited "$data_raw/data_admin.csv", delimiter(comma) clear

// data -------------------------------------------------------------------------------
label data "Pre-treatment data at student level" 

// variables --------------------------------------------------------------------------
label variable student_id   		"Student ID" 
label variable school_id    		"School ID" 
label variable grade 	    		"Grade" 
label variable class        		"Class" 
label variable gender           	"Gender"
label variable nationality          "Nationality"
label variable grade_math_t1        "Math's grade at period 1"
label variable grade_math_t2        "Math's grade at period 2"
label variable grade_language_t1    "Language's grade at period 1"
label variable grade_language_t2    "Language's grade at period 2"
label variable grade_science_t1  	"Science's grade at period 1"
label variable grade_science_t2  	"Science's grade at period 2"

// values -----------------------------------------------------------------------------

label define genderl 1 "Female" 2 "Male" 
label define nationalityl 1 "Italian" 2 "Foreign"

label values gender genderl
label values nationality nationalityl

// finding NA -----------------------------------------------------------------------------

foreach var in grade_math_t1 grade_language_t1 grade_science_t1 grade_math_t2 grade_language_t2 grade_science_t2 {
	replace `var' = .  if `var' == 99999
}


// merging ---------------------------------------------------------------------------

* finding duplicates on student id - master data
sort student_id
quietly by student_id:  gen dup = cond(_N==1,0,_n)

* droping duplicates
drop if dup > 1
drop dup 

* merging
merge m:1 student_id using `data_survey.dta'
gen admin_only = _merge == 1
drop _merge

label variable admin_only "observation just included in the admin data"

/**************************************************************************************
								Summary Statistics 
**************************************************************************************/

*Table
estpost tabstat grade_math_t1 grade_language_t1 grade_science_t1 grade_math_t2 grade_language_t2 grade_science_t2, ///
	c(stat) stat(mean sd min max n)

// Descriptive Table 1 -----------------------------------------------------------------
*saving the table on latex
esttab using "$tables/desc_table_1.tex", replace ///
	cells("mean(fmt(%13.2fc)) sd(fmt(%13.2fc)) min max count(fmt(%13.0fc))") nonumber ///
	nomtitle nonote noobs label collabels("Mean" "SD" "Min" "Max" "N")


/**************************************************************************************
						   Saving Data: student_data.dta 
**************************************************************************************/

save "data/clean_data/student_data", replace









