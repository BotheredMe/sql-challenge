SELECT
emp.emp_no
,emp.first_name
,emp.last_name
,emp.birth_date
,emp.gender
,emp.hire_date
,sal.from_date
,sal.to_date
,dpt.dept_no
,dpt.dept_name
,ttl.title
,sal.salary

FROM public.employees AS emp
	LEFT JOIN public.dept_manager AS dmn ON dmn.emp_no = emp.emp_no
	LEFT JOIN public.dept_emp AS dem ON dem.emp_no = emp.emp_no
	LEFT JOIN public.departments AS dpt ON (dpt.dept_no = dmn.dept_no OR dpt.dept_no = dem.dept_no)
	LEFT JOIN public.titles AS ttl ON ttl.emp_no = emp.emp_no
	LEFT JOIN public.salaries AS sal ON sal.emp_no = emp.emp_no
WHERE emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%'
ORDER BY emp.emp_no