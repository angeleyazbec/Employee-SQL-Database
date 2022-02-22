--Creating the database schema with the appropriate relationships, primary keys, foreign keys, composite keys,
--and constraints.
--Tables are listed in the order in which data need to be imported to align with the constraints. 

--Inserting the "titles" table
CREATE TABLE titles (
title_id VARCHAR(300) PRIMARY KEY,
title VARCHAR(300));

--Inserting the "employees" table
CREATE TABLE employees (
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR(300),
birth_date DATE,
first_name VARCHAR(300),
last_name VARCHAR(300),
sex VARCHAR(10),
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

--Inserting the "departments" table
CREATE TABLE departments (
dept_no VARCHAR(300) PRIMARY KEY,
dept_name VARCHAR(300));

--Inserting the "dept_emp" table
CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR(300),
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Inserting the "dept_manager" table
CREATE TABLE dept_manager (
dept_no VARCHAR(300),
emp_no INT,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Inserting the "salaries" table
CREATE TABLE salaries (
emp_no INT,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));


--Utilize code below to examine tables for successful import
--SELECT *
--FROM salaries
--LIMIT 20;