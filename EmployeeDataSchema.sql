--Creating the database schema

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

--Inserting the "dept_emp" table
CREATE TABLE dept_emp (
emp_no INT,
dept_no INT PRIMARY KEY,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Inserting the "departments" table
CREATE TABLE departments (
dept_no INT,
dept_name VARCHAR(300) PRIMARY KEY,
FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no));

DROP TABLE dept_manager

--Inserting the "dept_manager" table
CREATE TABLE dept_manager (
dept_no INT,
emp_no INT,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Inserting the "salaries" table
CREATE TABLE salaries (
emp_no INT,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
