SELECT database();


-- 1 Find all the current employees with the same hire date as employee 101010 using a subquery.

SELECT *
FROM employees e
	JOIN dept_emp de
    USING(emp_no)
WHERE to_date > now() AND hire_date IN
	(
    SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
	)
;

-- 2 Find all the titles ever held by all current employees with the first name Aamod.

SELECT title, first_name
FROM employees e
	JOIN titles t
    USING(emp_no)
WHERE to_date > now() AND first_name = 
	(
	SELECT DISTINCT first_name
	FROM employees
	WHERE first_name = 'Aamod'
	)
;


-- 3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT COUNT(*) as 'Old Employees'
FROM employees
WHERE emp_no NOT IN
	(
    SELECT DISTINCT emp_no
	FROM salaries
	WHERE to_date > now()
	-- GROUP BY emp_no
    )
;

-- A: 59,900 employees no longer working for the company.


-- 4 Find all the current department managers that are female. List their names in a comment in your code.

SELECT CONCAT(e.first_name, ' ', e.last_name) as 'Manager Name'
FROM 	(
			SELECT first_name, last_name, emp_no
			FROM employees
			WHERE gender = 'F'
		) as emp_names
    JOIN employees as e
		USING(emp_no)
	JOIN dept_manager as dm
    USING(emp_no)
WHERE dm.to_date > now()
;

-- A: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil


-- 5 Find all the employees who currently have a higher salary than the companie's overall, historical average salary.


SELECT COUNT(emp_no)
FROM salaries as s
WHERE s.to_date > now() AND salary >=
		(
		SELECT AVG(salary)
		FROM salaries
		)
;


-- 6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built-in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT MAX(salary) -- MAX salary of current employees is '158220'
FROM salaries
WHERE to_date > NOW()
;

SELECT ROUND(STDDEV(salary), 4) -- Standard Dev is '17309.95933634675'
FROM salaries as s
WHERE s.to_date > NOW()
;

SELECT MAX(salary) - STDDEV(salary) -- Difference is '140910.04066365326'
FROM salaries
WHERE to_date > NOW()
;

SELECT COUNT(salary) -- Total current salaries is '240124'
FROM salaries
WHERE to_date > NOW()
;

SELECT COUNT(salary) -- 83 salaries within 1 STDDEV
FROM salaries
WHERE to_date > NOW() AND salary > 
		(
        SELECT MAX(salary) - STDDEV(salary)
		FROM salaries
		WHERE to_date > NOW()
        )
;

SELECT (83) * 100 / (240124)
FROM salaries
WHERE to_date > NOW()
LIMIT 1
;



-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.





-- BONUS


-- Find all the department names that currently have female managers.
SELECT dept_name as 'Department Name'
FROM 	(
			SELECT first_name, last_name, emp_no
			FROM employees
			WHERE gender = 'F'
		) as emp_names
    JOIN employees as e
		USING(emp_no)
	JOIN dept_manager as dm
		USING(emp_no)
    JOIN departments as d
		USING(dept_no)
WHERE dm.to_date > now()
;


-- Find the first and last name of the employee with the highest salary.




-- Find the department name that the employee with the highest salary works in.


-- Who is the highest paid employee within each department.