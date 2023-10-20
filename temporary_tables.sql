## Create a file named temporary_tables.sql to do your work for this exercise.
USE ursula_2333;

-- 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE ewd AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

select *
from ewd;


-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
alter table ewd add full_name varchar(100);


-- Update the table so that the full_name column contains the correct data.
update ewd set full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.
alter table ewd drop column first_name, drop column last_name;

-- What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE ewd2 AS
SELECT dept_name, CONCAT(first_name, ' ', last_name) as full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;


-- 2 Create a temporary table based on the payment table from the sakila database.
select *
from sakila_temp
;

CREATE TEMPORARY TABLE sakila_temp AS
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment
LIMIT 100;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
ALTER TABLE sakila_temp MODIFY amount DECIMAL(10,2);

update sakila_temp set amount = amount * 100;

ALTER TABLE sakila_temp MODIFY amount INTEGER;

-- 3 Go back to the employees database. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?
USE employees;

-- create temporary table overall_aggregates as (
-- SELECT avg(salary), std(salary)
-- );


CREATE TEMPORARY TABLE Z_SCORE AS
SELECT
        (salary - (SELECT AVG(salary) FROM employees.salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM employees.salaries where to_date > now()) AS zscore
    FROM employees.salaries
    WHERE to_date > now()
;

SELECT *
FROM Z_SCORE
;


    -- Returns the current z-scores for each salary
    -- Notice that there are 2 separate scalar subqueries involved
    SELECT salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    WHERE to_date > now();


