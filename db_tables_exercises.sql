show databases;

use albums_db;

select database();

show tables;

use employees;

select database();

show tables;

describe employees; -- contains int, date, varchar (14) & (16), enum ('M','F'), and date

-- Which table(s) do you think contain a numeric type column? dept_emp, dept_mananger, employees, salaries, and titles.

-- Which table(s) do you think contain a string type column? Departments, dept_emp, dept_manager, employees, and titles.

-- Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees, salaries, and titles.

-- What is the relationship between the employees and the departments tables? Their tables are stored in the same schema. 

show create table dept_manager;
