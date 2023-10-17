-- 1 Create a new file named group_by_exercises.sql

-- 2 In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT title -- Put count outside the DISTINCT title, COUNT(DISTINCT title).
FROM titles
;

-- A: 7 unique titles

-- 3 Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name
;

-- 4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
-- ORDER BY last_name, first_name
;

-- 5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
;

-- A: Chleq, Lindqvist, Qiwen


-- 6 Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT last_name, count(*) as cnt
FROM employees
WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name
;

-- 7 Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
SELECT  first_name, gender, COUNT(*) as cnt
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name
;

-- 8 Using your query that generates a username for all employees, generate a count of employees with each unique username.
SELECT LOWER (CONCAT (SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) as username, COUNT(*) same_username
FROM employees
GROUP BY username
;

-- 9 From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?
SELECT LOWER (CONCAT (SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) as username, COUNT(*) same_username
FROM employees
GROUP BY username
HAVING same_username > 1
ORDER BY same_username DESC
;

-- A: Yes, there are duplicate usernames. The highest number of times a username shows up is 6. There are 13251 duplicate usernames.

-- BONUS

-- 1 Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
SELECT ROUND(AVG(salary), 2) as avg_sal, emp_no
FROM salaries
GROUP BY emp_no
;

-- 2 Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT dept_no, COUNT(emp_no) employee_count
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no
;

-- 3 Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, COUNT(salary) cnt
FROM salaries
GROUP BY emp_no
;

-- 4 Find the maximum salary for each employee.
SELECT emp_no, MAX(salary) max_sal
FROM salaries
GROUP BY emp_no
;

-- 5 Find the minimum salary for each employee.
SELECT emp_no, MIN(salary) min_sal
FROM salaries
GROUP BY emp_no
;

-- 6 Find the standard deviation of salaries for each employee.
SELECT emp_no, ROUND(STDDEV(salary), 2)
FROM salaries
GROUP BY emp_no
;

-- 7 Find the max salary for each employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(salary) max_sal
FROM salaries
GROUP BY emp_no
HAVING max_sal > 150000
;

-- 8 Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, ROUND(AVG(salary), 2) avg_sal
FROM salaries
GROUP BY emp_no
HAVING avg_sal BETWEEN 80000 AND 90000
;

 
