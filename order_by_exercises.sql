-- SHOW databases;

-- USE employees;

-- SELECT database();

-- SHOW tables;

-- DESCRIBE employees;


-- -- 1 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
-- SELECT first_name, emp_no
-- FROM employees
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- ;

-- /*
-- 'Vidya','10200'
-- 'Irena','10397'
-- 'Irena','10610'
-- */


-- -- 2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
-- SELECT first_name, emp_no
-- FROM employees
-- WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
-- ;


-- /*
-- 'Vidya','10200'
-- 'Irena','10397'
-- 'Irena','10610'
-- Yes, it matches the first question
-- */


-- -- 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
-- SELECT first_name, emp_no, gender
-- FROM employees
-- WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
-- ;

-- /*
-- 'Vidya','10200','M'
-- 'Irena','10397','M'
-- 'Irena','10821','M'
-- */


-- -- 4 Find all unique last names that start with 'E'.
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE 'E%'
-- ;

-- -- 5 Find all unique last names that start or end with 'E'.
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE 'E%' OR last_name LIKE '%E'
-- ;

-- -- 6 Find all unique last names that end with E, but does not start with E?
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%'
-- ;

-- -- 7 Find all unique last names that start and end with 'E'.
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
-- ;

-- -- 8 Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
-- SELECT emp_no, hire_date, first_name
-- FROM employees
-- WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
-- ;

-- -- '11697', '10684', '11754'

-- -- 9 Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
-- SELECT emp_no, first_name, birth_date
-- FROM employees
-- WHERE birth_date LIKE '%12-25'
-- ;
-- -- 10078, 10115, 10261

-- -- 10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
-- SELECT emp_no, first_name, birth_date, hire_date
-- FROM employees
-- WHERE (birth_date LIKE '%12-25') AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
-- ;

-- -- 10261, 10438, 10681

-- -- 11 Find all unique last names that have a 'q' in their last name.
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE '%q%'
-- ;

-- -- 12 Find all unique last names that have a 'q' in their last name but not 'qu'.
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
-- ;

USE employees;
SELECT database();


-- 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name, emp_no
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name
;

-- First row: Irena Reutenauer & Last row: Vidya Simmen


-- 3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name, emp_no
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name
;
-- Last person in the table is Vidya Zweizig


-- 4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name, emp_no
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name
;
-- First row: Irena Acton Last row: Maya Zyda

-- 5 Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT DISTINCT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
ORDER BY emp_no
;
-- 899 employees returned. First employee number 10021 Ramzi Erde, last employee number 499648 Tadahiro Erde.


-- 6 Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT DISTINCT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
ORDER BY hire_date DESC
;
-- 899 employees returned.   Newest employee: Teiji Eldridge    Oldest employee: Sergi Erde

-- 7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE (birth_date LIKE '%12-25') AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date ASC, hire_date DESC
;
-- 362 employees returned.   Oldest employee hired last: Khun Bernini.   Youngest employee hired last: Gudjon Vakili
