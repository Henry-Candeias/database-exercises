SHOW databases;

USE employees;

SELECT database();

SHOW tables;

DESCRIBE employees;


-- 1 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT first_name, emp_no
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
;

/*
'Vidya','10200'
'Irena','10397'
'Irena','10610'
*/


-- 2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
SELECT first_name, emp_no
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
;


/*
'Vidya','10200'
'Irena','10397'
'Irena','10610'
Yes, it matches the first question
*/


-- 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
SELECT first_name, emp_no, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
;

/*
'Vidya','10200','M'
'Irena','10397','M'
'Irena','10821','M'
*/


-- 4 Find all unique last names that start with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%'
;

-- 5 Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E'
;

-- 6 Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%'
;

-- 7 Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
;

-- 8 Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
SELECT emp_no, hire_date, first_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
;

-- '11697', '10684', '11754'

-- 9 Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
SELECT emp_no, first_name, birth_date
FROM employees
WHERE birth_date LIKE '%12-25'
;
-- 10078, 10115, 10261

-- 10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
SELECT emp_no, first_name, birth_date, hire_date
FROM employees
WHERE (birth_date LIKE '%12-25') AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
;

-- 10261, 10438, 10681

-- 11 Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
;

-- 12 Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
;
