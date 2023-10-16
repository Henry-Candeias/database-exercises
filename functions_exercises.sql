-- USE employees;
-- SELECT database();


-- -- 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- SELECT first_name, last_name, emp_no
-- FROM employees
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- ORDER BY first_name
-- ;

-- -- First row: Irena Reutenauer & Last row: Vidya Simmen


-- -- 3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- SELECT first_name, last_name, emp_no
-- FROM employees
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- ORDER BY first_name, last_name
-- ;
-- -- Last person in the table is Vidya Zweizig


-- -- 4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- SELECT first_name, last_name, emp_no
-- FROM employees
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- ORDER BY last_name, first_name
-- ;
-- -- First row: Irena Acton Last row: Maya Zyda

-- -- 5 Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
-- SELECT DISTINCT first_name, last_name, emp_no
-- FROM employees
-- WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
-- ORDER BY emp_no
-- ;
-- -- 899 employees returned. First employee number 10021 Ramzi Erde, last employee number 499648 Tadahiro Erde.


-- -- 6 Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
-- SELECT DISTINCT first_name, last_name, hire_date
-- FROM employees
-- WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
-- ORDER BY hire_date DESC
-- ;
-- -- 899 employees returned.   Newest employee: Teiji Eldridge    Oldest employee: Sergi Erde

-- -- 7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
-- SELECT emp_no, first_name, last_name, birth_date, hire_date
-- FROM employees
-- WHERE (birth_date LIKE '%12-25') AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
-- ORDER BY birth_date ASC, hire_date DESC
-- ;
-- -- 362 employees returned.   Oldest employee hired last: Khun Bernini.   Youngest employee hired last: Gudjon Vakili


select database();

-- 1 You may choose to copy the order by exercises and save it as functions_exercises.sql, to save time as you will be editing the queries to answer your functions exercises.

-- 2 Write a query to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT (first_name, ' ', last_name) as full_name
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
;

-- 3 Convert the names produced in your last query to all uppercase.
SELECT UPPER (CONCAT (first_name, ' ', last_name)) as full_name
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
;

-- 4 Use a function to determine how many results were returned from your previous query.
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
;

-- 5 Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT emp_no, first_name, last_name, birth_date, hire_date, DATEDIFF(NOW(), hire_date) as days_worked
FROM employees
WHERE (birth_date LIKE '%12-25') AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
;

-- 6 Find the smallest and largest current salary from the salaries table.
SELECT MIN(salary), MAX(salary)
FROM salaries
;

-- 7 Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT LOWER (CONCAT (SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) as username, first_name, last_name, birth_date
FROM employees
;
