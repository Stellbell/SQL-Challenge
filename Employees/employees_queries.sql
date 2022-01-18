-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select  e.emp_no as "Employee Number", 
		e.last_name as "Last Name", 
		e.first_name as "First Name", 
		e.sex as "Sex", 
		s.salary as "Salary"
from employees e, salaries s
where e.emp_no = s.emp_no;



-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select  first_name as "First Name", 
		last_name as "Last Name", 		
		hire_date as "Hire Date"
from employees
where EXTRACT(YEAR from hire_date) = 1986;



-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
select  de.dept_no as "Department Number", 
		de.dept_name as "Department Name", 		
		dm.emp_no as "Managers employee number",		
		em.last_name as "Last Name",
		em.first_name as "First Name"
from dept_manager dm, departments de, employees em
where dm.dept_no = de.dept_no and dm.emp_no = em.emp_no;



-- 4. List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
select  em.emp_no as "Employee Number", 
		em.last_name as "Last Name", 
		em.first_name as "First Name", 
		de.dept_name as "Department Name"
from employees em, departments de, dept_emp d_e
where em.emp_no = d_e.emp_no and d_e.dept_no = de.dept_no;



-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name as "First Name", 
	   last_name as "Last Name", 
	   sex as "Sex"		
from employees
where first_name = 'Hercules' and last_name like 'B%';



-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select  em.emp_no as "Employee Number", 
		em.last_name as "Last Name", 
		em.first_name as "First Name", 
		de.dept_name as "Department Name"
from employees em, departments de, dept_emp d_e
where de.dept_name = 'Sales' and em.emp_no = d_e.emp_no and d_e.dept_no = de.dept_no;



-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
select  em.emp_no as "Employee Number", 
		em.last_name as "Last Name", 
		em.first_name as "First Name", 
		de.dept_name as "Department Name"
from employees em, departments de, dept_emp d_e
where de.dept_name in ('Sales','Development') and em.emp_no = d_e.emp_no and d_e.dept_no = de.dept_no;




-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name as "Last Name", 
	   count(*) as "Frequency Count"
from employees
group by last_name
order by last_name asc;



-- Epilogue - Search your ID number
select * from employees where emp_no = 499942;


