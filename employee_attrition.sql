select * from employee_attrition;

#1 write a SQL query to find the details of employees under attrition having 5+ years experience in between the age of 27-35

select attrition, age, totalworkingyears from employee_attrition
where age between 27 and 35 and totalworkingyears >= 5 and Attrition = "yes";

#2 fetch the details of employees having maximum and minimum salary working in different department who received less than 13% salary hike

select department,
max(MonthlyIncome),
min(MonthlyIncome),
percentsalaryhike 
from employee_attrition
where PercentSalaryHike < 13
group by department;

#3 calculate the average monthly income of all the employee who worked more than 3 years and whose educational background is medical
 
select avg(MonthlyIncome)
from employee_attrition
where YearsAtCompany > 3 and EducationField = "Medical";

#4 identify the total number of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 years

select  Gender,count(Employee_id) from employee_attrition
where MaritalStatus = "Married" and YearsSinceLastPromotion = 2 and Attrition = "yes"
group by Gender;

#5 Employees with maximum performance rating but no promotion for 4 years and above

select * from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition) and YearsSinceLastPromotion >= 4 ;

#6 who has maximum and minimum percentage salary hike

select YearsAtCompany, PerformanceRating, YearsSinceLastPromotion,
max(PercentSalaryHike), min(PercentSalaryHike)
from employee_attrition
group by YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;

#7 Employee working overtime but given min salary hike and are more than 5 years with company

select *
from employee_attrition
where OverTime = "Yes" and 
PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
and YearsAtCompany > 5;

#8 maximum and minimum relationship satisfaction for people with basically marital status

select MaritalStatus, max(RelationshipSatisfaction), min(RelationshipSatisfaction)
from employee_attrition
group by MaritalStatus 
