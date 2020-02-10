SELECT 
emp.last_name
,COUNT(emp.last_name) AS "Count"

FROM public.employees AS emp
	LEFT JOIN public.dept_manager AS dmn ON dmn.emp_no = emp.emp_no
	LEFT JOIN public.dept_emp AS dem ON dem.emp_no = emp.emp_no
	LEFT JOIN public.departments AS dpt ON (dpt.dept_no = dmn.dept_no OR dpt.dept_no = dem.dept_no)
	LEFT JOIN public.titles AS ttl ON ttl.emp_no = emp.emp_no
	LEFT JOIN public.salaries AS sal ON sal.emp_no = emp.emp_no

GROUP BY emp.last_name
ORDER BY
COUNT(emp.last_name) DESC