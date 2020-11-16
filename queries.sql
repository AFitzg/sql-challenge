--1. Employee details: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM employees
LEFT JOIN salaries on employees.emp_no = salaries.emp_no;

--2.Employees hired in 1986: List first name, last name, and hire date 
SELECT employees.first_name,employees.last_name,employees.hire_date 
FROM employees
WHERE cast(hire_date AS text) LIKE '%1986%';

--3.Manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
FROM departments
LEFT JOIN dept_manager on departments.dept_no = dept_manager.dept_no
LEFT JOIN employees on dept_manager.emp_no = employees.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp on dept_emp.emp_no = employees.emp_no
LEFT JOIN departments on departments.dept_no = dept_emp.dept_no;

--5.Hercules data. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name LIKE '%Hercules%'AND employees.last_name LIKE 'B%';

--6. SALES DEPT info. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp on dept_emp.emp_no = employees.emp_no
LEFT JOIN departments on departments.dept_no = dept_emp.dept_no 
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp on dept_emp.emp_no = employees.emp_no
LEFT JOIN departments on departments.dept_no = dept_emp.dept_no 
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(*)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT DESC;
