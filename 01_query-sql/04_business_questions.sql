-- REALIZAMOS PREGUNTAS DE NEGOCIO Y REALIZAMOS SUS KPIs.

-- 1. ¿Existe dispersión/anomalía salarial dentro del mismo puesto?
SELECT t.title, COUNT(*) AS total_employees, 
	MIN(s.salary) AS min_salary, 
	MAX(s.salary) AS max_salary, 
	ROUND(AVG(s.salary)) AS average_salary, 
	ROUND(STDDEV(s.salary)) AS salary_stddev
FROM titles t
JOIN salaries s
    ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY salary_stddev DESC;

-- 2. ¿Cómo impacta la antigüedad en el nivel salarial por departamento?
SELECT 
    d.dept_name,
    ROUND(AVG(DATE_PART('year', AGE(CURRENT_DATE, e.hire_date)))) AS avg_tenure_years,
    ROUND(AVG(s.salary)) AS average_salary
FROM departments d
JOIN dept_emp de 
	ON d.dept_no = de.dept_no
JOIN salaries s 
	ON de.emp_no = s.emp_no
JOIN employees e
	ON de.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC;

--3. ¿Cómo se distribuye la masa salarial por departamento en comparación con su dotación?
SELECT 
    d.dept_name,
    COUNT(s.emp_no) AS total_employees,
    SUM(s.salary) AS total_payroll,
    ROUND(AVG(s.salary)) AS average_salary
FROM departments d
JOIN dept_emp de 
	ON d.dept_no = de.dept_no
JOIN salaries s 
	ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY total_payroll DESC;
