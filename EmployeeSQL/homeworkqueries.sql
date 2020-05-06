--List employee details
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees 
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
;

--Employees hired in 1986
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

--List manager from each department
SELECT 
	dept_manager.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_no,
	departments.dept_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
;

--List the department from each employee

SELECT
	departments.dept_name,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
;

--List employees 
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

--List all employees in Sales Department
SELECT
	departments.dept_name,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name  'Sales'
;

--List all employees in Sales and Development Department
SELECT
	departments.dept_name,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name IN ('Sales', 'Development')
;

--descending order, list the frequency count of employee last names

SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY count(*) DESC;

