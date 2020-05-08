--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary from employees as e left join salaries as s ON e.emp_no=s.emp_no ORDER BY e.emp_no;

--List employees who were hired in 1986.
select * from employees where extract(YEAR from hire_date) = 1986 ORDER BY emp_no;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select department.dept_no, department.dept_name, manager.emp_no, e.last_name, e.first_name, manager.from_date, manager.to_date from dept_manager as manager
INNER JOIN departments as department ON manager.dept_no=department.dept_no LEFT JOIN employees AS e ON manager.emp_no=e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e INNER JOIN dept_emp as DE ON DE.emp_no=e.emp_no INNER JOIN departments AS d ON DE.dept_no=d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name = 'Hercules' AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e LEFT JOIN dept_emp as de on de.emp_no=e.emp_no 
INNER JOIN departments as d on d.dept_no=de.dept_no where dept_name ='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e 
LEFT JOIN dept_emp as de on de.emp_no=e.emp_no INNER JOIN departments as d on d.dept_no=de.dept_no WHERE d.dept_name in ('Sales','Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count FROM employees GROUP BY last_name ORDER BY freq_count DESC;