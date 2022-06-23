clear

*Set working directory
cd "/Users/nidhi/Desktop"
*All three files have already been converted to .dta and saved in the working directory

* Import file into STATA
use demo

**********************Q1.1) Re-coding data correctly**********************************************************
sort person_id
replace gender = "M" if gender == "male"
replace gender = "F" if gender == "female"
save "demo.dta",replace

* Q1.2) Merging the "case" and "demo" datasets together
clear
use case
sort person_id
merge m:m person_id using demo
save "case.dta",replace

*Q1.3) Removing unwanted observations
keep if strpos(address,"CHICAGO") | strpos(address,"Chicago")
save "case.dta",replace

********************Q2.1) Creation of an age variable (today's date = May 7th, 2022)**************************
gen bdate1 = date(bdate, "YMD")
format bdate1 %td
gen bdate2 = (td(07may2022)-bdate1)/365.25
gen age = round(bdate2,1)
drop bdate2 bdate1
save "case.dta",replace

*Q2.2) Creation of a grade measure
clear
use grades
*Variable 1
replace gr9_fall_math = "4" if gr9_fall_math == "A"
replace gr9_fall_math = "3" if gr9_fall_math == "B"
replace gr9_fall_math = "2" if gr9_fall_math == "C"
replace gr9_fall_math = "1" if gr9_fall_math == "D"
replace gr9_fall_math = "0" if gr9_fall_math == "F"
destring gr9_fall_math, replace
*Variable 2
replace gr9_fall_sci = "4" if gr9_fall_sci == "A"
replace gr9_fall_sci = "3" if gr9_fall_sci == "B"
replace gr9_fall_sci = "2" if gr9_fall_sci == "C"
replace gr9_fall_sci = "1" if gr9_fall_sci == "D"
replace gr9_fall_sci = "0" if gr9_fall_sci == "F"
destring gr9_fall_sci, replace
*Variable 3
replace gr9_fall_eng = "4" if gr9_fall_eng == "A"
replace gr9_fall_eng = "3" if gr9_fall_eng == "B"
replace gr9_fall_eng = "2" if gr9_fall_eng == "C"
replace gr9_fall_eng = "1" if gr9_fall_eng == "D"
replace gr9_fall_eng = "0" if gr9_fall_eng == "F"
destring gr9_fall_eng, replace
*Variable 4
replace gr9_fall_hist = "4" if gr9_fall_hist == "A"
replace gr9_fall_hist = "3" if gr9_fall_hist == "B"
replace gr9_fall_hist = "2" if gr9_fall_hist == "C"
replace gr9_fall_hist = "1" if gr9_fall_hist == "D"
replace gr9_fall_hist = "0" if gr9_fall_hist == "F"
destring gr9_fall_hist, replace
*Variable 5
replace gr9_spring_math = "4" if gr9_spring_math == "A"
replace gr9_spring_math = "3" if gr9_spring_math == "B"
replace gr9_spring_math = "2" if gr9_spring_math == "C"
replace gr9_spring_math = "1" if gr9_spring_math == "D"
replace gr9_spring_math = "0" if gr9_spring_math == "F"
destring gr9_spring_math, replace
*Variable 6
replace gr9_spring_sci = "4" if gr9_spring_sci == "A"
replace gr9_spring_sci = "3" if gr9_spring_sci == "B"
replace gr9_spring_sci = "2" if gr9_spring_sci == "C"
replace gr9_spring_sci = "1" if gr9_spring_sci == "D"
replace gr9_spring_sci = "0" if gr9_spring_sci == "F"
destring gr9_spring_sci, replace
*Variable 7
replace gr9_spring_eng = "4" if gr9_spring_eng == "A"
replace gr9_spring_eng = "3" if gr9_spring_eng == "B"
replace gr9_spring_eng = "2" if gr9_spring_eng == "C"
replace gr9_spring_eng = "1" if gr9_spring_eng == "D"
replace gr9_spring_eng = "0" if gr9_spring_eng == "F"
destring gr9_spring_eng, replace
*Variable 8
replace gr9_spring_hist = "4" if gr9_spring_hist == "A"
replace gr9_spring_hist = "3" if gr9_spring_hist == "B"
replace gr9_spring_hist = "2" if gr9_spring_hist == "C"
replace gr9_spring_hist = "1" if gr9_spring_hist == "D"
replace gr9_spring_hist = "0" if gr9_spring_hist == "F"
destring gr9_spring_hist, replace
*Variable 9
replace gr10_fall_math = "4" if gr10_fall_math == "A"
replace gr10_fall_math = "3" if gr10_fall_math == "B"
replace gr10_fall_math = "2" if gr10_fall_math == "C"
replace gr10_fall_math = "1" if gr10_fall_math == "D"
replace gr10_fall_math = "0" if gr10_fall_math == "F"
destring gr10_fall_math, replace
*Variable 10
replace gr10_fall_sci = "4" if gr10_fall_sci == "A"
replace gr10_fall_sci = "3" if gr10_fall_sci == "B"
replace gr10_fall_sci = "2" if gr10_fall_sci == "C"
replace gr10_fall_sci = "1" if gr10_fall_sci == "D"
replace gr10_fall_sci = "0" if gr10_fall_sci == "F"
destring gr10_fall_sci, replace
*Variable 11
replace gr10_fall_eng = "4" if gr10_fall_eng == "A"
replace gr10_fall_eng = "3" if gr10_fall_eng == "B"
replace gr10_fall_eng = "2" if gr10_fall_eng == "C"
replace gr10_fall_eng = "1" if gr10_fall_eng == "D"
replace gr10_fall_eng = "0" if gr10_fall_eng == "F"
destring gr10_fall_eng, replace
*Variable 12
replace gr10_fall_hist = "4" if gr10_fall_hist == "A"
replace gr10_fall_hist = "3" if gr10_fall_hist == "B"
replace gr10_fall_hist = "2" if gr10_fall_hist == "C"
replace gr10_fall_hist = "1" if gr10_fall_hist == "D"
replace gr10_fall_hist = "0" if gr10_fall_hist == "F"
destring gr10_fall_hist, replace
*Variable 13
replace gr10_spring_math = "4" if gr10_spring_math == "A"
replace gr10_spring_math = "3" if gr10_spring_math == "B"
replace gr10_spring_math = "2" if gr10_spring_math == "C"
replace gr10_spring_math = "1" if gr10_spring_math == "D"
replace gr10_spring_math = "0" if gr10_spring_math == "F"
destring gr10_spring_math, replace
*Variable 14
replace gr10_spring_sci = "4" if gr10_spring_sci == "A"
replace gr10_spring_sci = "3" if gr10_spring_sci == "B"
replace gr10_spring_sci = "2" if gr10_spring_sci == "C"
replace gr10_spring_sci = "1" if gr10_spring_sci == "D"
replace gr10_spring_sci = "0" if gr10_spring_sci == "F"
destring gr10_spring_sci, replace
*Variable 15
replace gr10_spring_eng = "4" if gr10_spring_eng == "A"
replace gr10_spring_eng = "3" if gr10_spring_eng == "B"
replace gr10_spring_eng = "2" if gr10_spring_eng == "C"
replace gr10_spring_eng = "1" if gr10_spring_eng == "D"
replace gr10_spring_eng = "0" if gr10_spring_eng == "F"
destring gr10_spring_eng, replace
*Variable 16
replace gr10_spring_hist = "4" if gr10_spring_hist == "A"
replace gr10_spring_hist = "3" if gr10_spring_hist == "B"
replace gr10_spring_hist = "2" if gr10_spring_hist == "C"
replace gr10_spring_hist = "1" if gr10_spring_hist == "D"
replace gr10_spring_hist = "0" if gr10_spring_hist == "F"
destring gr10_spring_hist, replace
*GPA variable
egen gr9_10_GPA = rowmean(gr9_fall_math - gr10_spring_hist)
replace gr9_10_GPA = round(gr9_10_GPA,.001)
save "grades.dta",replacea

*********************** 3.1) Demographic summary of the study population****************************************
clear
use "case.dta"
summarize age
tab gender
tab race
*The data shows that around 80% of the cases assigned to program participants were men, and 20% were women. The racial breakdown showed that a majority(73%) of the cases were against Black program participants, followed by whites. The average age of the program participants recorded in case files is around 40.

*3.2)a) Testing treatment vs control groups
drop if treat == 1
tab race gender, row
/**Composition of control group
           |        gender
      race |         F          M |     Total
-----------+----------------------+----------
     ASIAN |       117        526 |       643 
           |     18.20      81.80 |    100.00 
-----------+----------------------+----------
     BLACK |     1,878      7,576 |     9,454 
           |     19.86      80.14 |    100.00 
-----------+----------------------+----------
     WHITE |       596      2,311 |     2,907 
           |     20.50      79.50 |    100.00 
-----------+----------------------+----------
     Total |     2,591     10,413 |    13,004 
           |     19.92      80.08 |    100.00
**/
use case, clear
drop if treat == 0
tab race gender, row
/**Composition of treatment group

           |        gender
      race |         F          M |     Total
-----------+----------------------+----------
     ASIAN |       140        569 |       709 
           |     19.75      80.25 |    100.00 
-----------+----------------------+----------
     BLACK |     2,046      8,357 |    10,403 
           |     19.67      80.33 |    100.00 
-----------+----------------------+----------
     WHITE |       586      2,495 |     3,081 
           |     19.02      80.98 |    100.00 
-----------+----------------------+----------
     Total |     2,772     11,421 |    14,193 
           |     19.53      80.47 |    100.00 
**/
*From these two tables, there are no significant differences in the composition of the two groups and the treatment and control groups are balanced

*Q3.2)b) Visual difference between control and treatment group
clear
use case
separate race, by(treat)
preserve
graph bar (percent), over(race0)
graph bar (percent), over(race1)
gr combine Race0.gph Race1.gph

*Q3)c) Treatment effects
regress treat re_arrest, robust
/**Linear regression***
Linear regression                               Number of obs     =     27,197
                                                F(1, 27195)       =      13.58
                                                Prob > F          =     0.0002
                                                R-squared         =     0.0005
                                                Root MSE          =     .49942

------------------------------------------------------------------------------
             |               Robust
       treat | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
   re_arrest |   .0281988   .0076527     3.68   0.000     .0131991    .0431985
       _cons |   .5164084   .0033739   153.06   0.000     .5097953    .5230214
------------------------------------------------------------------------------
**/
*According to this regression table, the Prob > F is too small to be statisticallu significant. So assuming that H0: the treatment had no effect on the program participants, we reject the null hypothesis and assume that the treatment had a positive effect on the participants and reduced recidivism
