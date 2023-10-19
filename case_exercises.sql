USE employees;
select database();
show tables;


## Exercise Goals

## Use CASE statements or IF() function to explore information in the employees database



-- 1 Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
SELECT * , 
	IF(to_date > NOW(), true, false) as 'is_current_employee'
FROM dept_emp
;


-- 2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT first_name, last_name,
	CASE
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
        WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
        ELSE 'R-Z'
	END as 'alpha_group'
FROM employees
;


-- 3 How many employees (current or previous) were born in each decade?
SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
        WHEN birth_date LIKE '196%' THEN '60s'
        ELSE 'other'
	END as decade
     , count(*) as cnt
FROM employees
 GROUP BY decade
;


-- 4 What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
-- R d008, D d005, Sales d007 & Marketing d001, Prod d004 & QM d006, Finance d002 & HR d003, CS d009

select
	CASE
		WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Producion', 'Quality Management') THEN 'Production & QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
        ELSE 'Customer Service'
	END as dept_group
    , ROUND(AVG(salary), 2) as avg_salary
from departments
	join dept_emp
		USING(dept_no)
	join salaries
		using(emp_no)
where salaries.to_date > now()
	and dept_emp.to_date > now()
GROUP BY dept_group
;

-- SELECT AVG(salary), dept_name
-- FROM departments
-- 	JOIN dept_emp
-- 		USING(dept_no)
-- 	JOIN salaries
-- 		USING(emp_no)
-- GROUP BY dept_name
-- ;



-- BONUS

-- Remove duplicate employees from exercise 1.