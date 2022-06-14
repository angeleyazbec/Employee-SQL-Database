# Employee SQL Database

Designed the tables to hold employee data in the CSVs, imported the CSVs into a SQL database, and answered questions about the data. 

#### Data Modeling

Schema (ERD) of data tables in SQL database.

![schema_figure3](https://user-images.githubusercontent.com/90559756/163273588-11ee43ef-81e3-4d72-b871-c13ef9c13c30.png)

#### Data Engineering

Specifying data types, primary keys, foreign keys, and other constraints. Loading data into corresponding SQL table.

![image](https://user-images.githubusercontent.com/90559756/163273866-59cd43a5-68de-4a67-a510-7447058dbe9d.png)

#### Data Analysis

Created the following views for analysis:

--Creating a view which combines all department information together with emp_no
--These data frequently co-occur in HR-related datasets
CREATE VIEW dept_combined AS
SELECT departments.dept_name,
departments.dept_no,
dept_emp.emp_no
FROM dept_emp
JOIN departments ON
dept_emp.dept_no=departments.dept_no;

--Creating a view which combines dept_combined to employee names and numbers
--Used the view below in multiple queries
CREATE VIEW ee_combined AS
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
dept_combined.dept_name,
dept_combined.dept_no
FROM employees
JOIN dept_combined ON
employees.emp_no=dept_combined.emp_no;

![image](https://user-images.githubusercontent.com/90559756/163274103-751187c3-4ef6-4e43-879d-cbfaa54e67d0.png)

Investigated the following:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
    a. Joined employees and salaries tables and selected requested demographic information.
    b. Query listed below.
    
    SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
    FROM employees
    JOIN salaries ON
    employees.emp_no=salaries.emp_no;

2. List first name, last name, and hire date for employees who were hired in 1986.
    a. Selected requested information from employees table.
    b. Used "WHERE" clause, "BETWEEN" operator, and "AND" operator to filter for hiring dates in 1986.
    c. Query listed below.
    
    SELECT first_name, last_name, hire_date
    FROM employees
    WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
    a. Joined ee_combined (from view created) and dept_mamanger tables to select relevant demographics.
    b. Query listed below.
    
    SELECT 
    ee_combined.dept_no,
    ee_combined.dept_name,
    dept_manager.emp_no,
    ee_combined.last_name,
    ee_combined.first_name
    FROM ee_combined
    JOIN dept_manager ON
    ee_combined.emp_no=dept_manager.emp_no;

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
    a. Selected relevant demographics from ee_combined view.
    b. Query listed below.
    
    SELECT emp_no, last_name, first_name, dept_name
    FROM ee_combined;

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
    a. Selected requested information from employees table.
    b. Used "WHERE" clause, "AND" operator, and "LIKE" operator with wildcards to filter for requested names.
    c. Query listed below.
    
    SELECT first_name, last_name, sex
    FROM employees
    WHERE first_name='Hercules' AND last_name LIKE 'B%';

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
    a. Selected requested information from ee_combined view.
    b. Used "WHERE" clause to filter for employees in the Sales department.
    c. Query listed below.
    
    SELECT emp_no, last_name, first_name, dept_name
    FROM ee_combined
    WHERE dept_name = 'Sales';

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
    a. Selected requested information from ee_combined view.
    b. Used "WHERE" clause and "OR" operator to filter for employees in the Sales and Development departments.
    c. Query listed below.
    
   SELECT emp_no, last_name, first_name, dept_name
   FROM ee_combined
   WHERE dept_name = 'Sales' OR dept_name='Development';

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
    a. Selected requested information from ee_combined view.
    b. Used "COUNT" function to count last names.
    c. Created alias "Last Name Count" for the new column name.
    d. Used "GROUP BY" clause to group results by last name.
    e. Query listed below.
    
    SELECT last_name, COUNT(last_name) AS "Last Name Count"
    FROM ee_combined
    GROUP BY last_name;

## Import SQL database into Python (Bonus Analysis file)

Used SQLALchmey library to import the SQL database. Import the SQL database into Pandas. 

Generated some visualizations of the data using matplotlib.

![image](https://user-images.githubusercontent.com/90559756/163274826-7a58fddf-0800-4e5b-a674-a05bab1f4c70.png)

  
