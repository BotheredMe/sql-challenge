SELECT
emp.emp_no
,emp.last_name
,emp.first_name
,emp.hire_date

FROM public.employees AS emp
	LEFT JOIN public.dept_manager AS dmn ON dmn.emp_no = emp.emp_no
	LEFT JOIN public.dept_emp AS dem ON dem.emp_no = emp.emp_no
	LEFT JOIN public.departments AS dpt ON (dpt.dept_no = dmn.dept_no OR dpt.dept_no = dem.dept_no)
	LEFT JOIN public.titles AS ttl ON ttl.emp_no = emp.emp_no
	LEFT JOIN public.salaries AS sal ON sal.emp_no = emp.emp_no

WHERE
	extract(year from emp.hire_date) = 1986 
ORDER BY emp.emp_no