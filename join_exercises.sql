-- Join Example Database

-- 1 Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SELECT database();
SHOW tables;


SELECT
    *
FROM users AS u
INNER JOIN roles AS r
    USING(id)
;


-- 2 Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT
    *
FROM users AS u
JOIN roles AS r
    USING(id)
;

SELECT
    *
FROM users AS u
left JOIN roles AS r
    USING(id)
;

SELECT
    *
FROM users AS u
right JOIN roles AS r
    USING(id)
;


-- 3 Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that have the role. Hint: You will also need to use group by in the query.
SELECT role_id, COUNT(*) cnt
FROM users AS u
left JOIN roles AS r
    USING(id)
GROUP BY role_id
;



-- Employees Database

-- 1 Use the employees database.
USE employees;
SELECT database();
SHOW tables;


-- 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name as Department_Name, CONCAT(first_name, ' ', last_name) Department_Manager
FROM departments AS d
INNER JOIN dept_manager AS dm
    USING(dept_no)
INNER JOIN employees AS e
	USING(emp_no)
WHERE to_date > now()
;

--   Department Name    | Department Manager
--  --------------------+--------------------
--   Customer Service   | Yuchang Weedman
--   Development        | Leon DasSarma
--   Finance            | Isamu Legleitner
--   Human Resources    | Karsten Sigstam
--   Marketing          | Vishwani Minakawa
--   Production         | Oscar Ghazalie
--   Quality Management | Dung Pesch
--   Research           | Hilary Kambil
--   Sales              | Hauke Zhang


-- 3 Find the name of all departments currently managed by women.
SELECT dept_name as Department_Name, CONCAT(first_name, ' ', last_name) Department_Manager, gender
FROM departments AS d
INNER JOIN dept_manager AS dm
    USING(dept_no)
INNER JOIN employees AS e
	USING(emp_no)
WHERE to_date > now() AND gender = 'F'
;


-- Department Name | Manager Name
-- ----------------+-----------------
-- Development     | Leon DasSarma
-- Finance         | Isamu Legleitner
-- Human Resources | Karsetn Sigstam
-- Research        | Hilary Kambil


-- 4 Find the current titles of employees currently working in the Customer Service department.
SELECT title, count(*)
FROM titles AS t
INNER JOIN employees AS e
    USING(emp_no)
INNER JOIN dept_emp AS de
	USING(emp_no)
INNER JOIN departments AS d
	USING(dept_no)
WHERE dept_name = 'Customer Service' AND t.to_date > now() AND de.to_date > now()
GROUP BY title
ORDER BY title
;


-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790
-- Senior Staff       | 11268
-- Staff              |  3574
-- Technique Leader   |   241


-- 5 Find the current salary of all current managers.
SELECT dept_name as Department_Name, CONCAT(first_name, ' ', last_name) name, salary
FROM departments AS d
INNER JOIN dept_emp AS de
    USING(dept_no)
INNER JOIN salaries AS s
	USING(emp_no)
INNER JOIN employees AS e
	USING(emp_no)
INNER JOIN dept_manager AS dm
    USING(emp_no)
WHERE de.to_date > now() AND s.to_date > now() AND dm.to_date > now()
ORDER BY dept_name
;


-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987


-- 6 Find the number of current employees in each department.
SELECT dept_no, dept_name, COUNT(*) as num_employees
FROM departments AS d
INNER JOIN dept_emp AS de
    USING(dept_no)
WHERE de.to_date > now()
GROUP BY dept_no
ORDER BY dept_no
;


-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |
-- | d004    | Production         | 53304         |
-- | d005    | Development        | 61386         |
-- | d006    | Quality Management | 14546         |
-- | d007    | Sales              | 37701         |
-- | d008    | Research           | 15441         |
-- | d009    | Customer Service   | 17569         |
-- +---------+--------------------+---------------+


-- 7 Which department has the highest average salary? Hint: Use current not historic information.
SELECT dept_name, ROUND(AVG(salary), 2) as average_salary
FROM departments AS d
INNER JOIN dept_emp AS de
    USING(dept_no)
INNER JOIN salaries AS s
    USING(emp_no)
WHERE de.to_date > now() AND s.to_date > now()
GROUP BY dept_no
ORDER BY average_salary DESC
LIMIT 1
;

-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+


-- 8 Who is the highest paid employee in the Marketing department?
SELECT first_name, last_name
FROM departments AS d
INNER JOIN dept_emp AS de
    USING(dept_no)
INNER JOIN salaries AS s
    USING(emp_no)
INNER JOIN employees AS e
	USING(emp_no)
WHERE dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1
;

-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | Akemi      | Warwick   |
-- +------------+-----------+


-- 9 Which current department manager has the highest salary?
SELECT first_name, last_name, salary, dept_name
FROM departments AS d
INNER JOIN dept_manager AS dm
    USING(dept_no)
INNER JOIN salaries AS s
    USING(emp_no)
INNER JOIN employees AS e
	USING(emp_no)
WHERE s.to_date > now() AND dm.to_date > now()
ORDER BY salary DESC
LIMIT 1
;

-- +------------+-----------+--------+-----------+
-- | first_name | last_name | salary | dept_name |
-- +------------+-----------+--------+-----------+
-- | Vishwani   | Minakawa  | 106491 | Marketing |
-- +------------+-----------+--------+-----------+


-- 10 Determine the average salary for each department. Use all salary information and round your results.
SELECT dept_name, ROUND(AVG(salary),0) average_salary
FROM departments AS d
INNER JOIN dept_emp AS de
    USING(dept_no)
INNER JOIN salaries AS s
    USING(emp_no)
GROUP BY dept_name
ORDER BY average_salary DESC
;

-- +--------------------+----------------+
-- | dept_name          | average_salary | 
-- +--------------------+----------------+
-- | Sales              | 80668          | 
-- +--------------------+----------------+
-- | Marketing          | 71913          |
-- +--------------------+----------------+
-- | Finance            | 70489          |
-- +--------------------+----------------+
-- | Research           | 59665          |
-- +--------------------+----------------+
-- | Production         | 59605          |
-- +--------------------+----------------+
-- | Development        | 59479          |
-- +--------------------+----------------+
-- | Customer Service   | 58770          |
-- +--------------------+----------------+
-- | Quality Management | 57251          |
-- +--------------------+----------------+
-- | Human Resources    | 55575          |
-- +--------------------+----------------+


-- 11 Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT dept_name as Department_Name, CONCAT(first_name, ' ', last_name) Department_Manager
FROM employees AS e
INNER JOIN dept_emp AS de
    USING(emp_no)
INNER JOIN dept_manager AS dm
    USING(dept_no)
INNER JOIN departments AS d
	USING(dept_no)
WHERE dm.to_date > now() AND de.to_date > now()
;



-- 240,124 Rows

-- Employee Name | Department Name  |  Manager Name
-- --------------|------------------|-----------------
--  Huan Lortz   | Customer Service | Yuchang Weedman
