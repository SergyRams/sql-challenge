select * from departments
select * from employees
select * from salaries
select * from dept_manager
select * from dept_emp

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sa.salary from employees emp
inner join salaries sa on sa.emp_no = emp.emp_no


--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees 
where  extract(YEAR FROM hire_date)='1986'


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, ds.dept_name, ems.emp_no, ems.last_name, ems.first_name, ems.emp_title_id from employees ems 
inner join dept_manager dm on ems.emp_no = dm.emp_no 
inner join departments ds on dm.dept_no = ds.dept_no
where ems.emp_title_id = 'm0001'

-- 4 List the department of each employee with the following information: employee number, last name, first name, and department name.
--select ems.emp_no, ems.last_name, ems.first_name,ds.dept_name 
select ems.emp_no, ems.last_name, ems.first_name, ds.dept_name from employees ems 
inner join dept_emp dem on ems.emp_no = dem.emp_no 
inner join departments ds on dem.dept_no = ds.dept_no

--5.- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select ems.first_name,ems.last_name,ems.sex from employees ems 
where ems.last_name like 'B%' and first_name = 'Hercules'

--6.- List all employees in the Sales department, including their employee number, last name, first name, and department name
select ems.emp_no,ems.last_name,ems.first_name,ds.dept_name from employees ems 
inner join dept_emp dem on ems.emp_no = dem.emp_no 
inner join departments ds on dem.dept_no = ds.dept_no
where dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select ems.emp_no,ems.last_name,ems.first_name,ds.dept_name from employees ems 
inner join dept_emp dem on ems.emp_no = dem.emp_no 
inner join departments ds on dem.dept_no = ds.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select emp.last_name, COUNT(*), array_agg(emp.last_name)
FROM employees emp
group by 1 
order by 1 DESC

--SELECT last_name, count(*) FROM employees 
--order by sum DESC
--select last_name from employees
--order by 1 DESC
--select emp.last_name, COUNT(*), array_agg(fa.last_name),(array_agg(fa.last_name))[1:3]
--FROM employees emp
--left join employees fa on emp.last_name = fa.last_name 
--group by 1
