--Queries for the employee data

--Creating a view which combines all department information together with emp_no
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

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries ON
employees.emp_no=salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

--3. List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
SELECT 
ee_combined.dept_no,
ee_combined.dept_name,
dept_manager.emp_no,
ee_combined.last_name,
ee_combined.first_name
FROM ee_combined
JOIN dept_manager ON
ee_combined.emp_no=dept_manager.emp_no;

--4. List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM ee_combined;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including 
---their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM ee_combined
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM ee_combined
WHERE dept_name = 'Sales' OR dept_name='Development';
		
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM ee_combined
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
