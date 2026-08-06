-- REALIZAMOS PREGUNTAS DE NEGOCIO PARA SOLUCIONAR UN PROBLEMA Y REALIZAMOS SUS KPIS.

--Equidad Salarial e Inequidad Interna (Pay Equity & Bands)

-- 1. ¿Existe dispersión/anomalía salarial dentro del mismo puesto?
SELECT t.title, COUNT(*) AS total_employees, MIN(s.salary) AS min_salary, MAX(s.salary) AS max_salary, ROUND(AVG(s.salary)) AS average_salary
FROM titles t
JOIN salaries s
    ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY salary_stddev DESC;

-- 2. ¿Cómo impacta la antigüedad en el nivel salarial por departamento?
WITH employee_tenure AS (
 SELECT emp_no, DATE_PART('year', AGE(CURRENT_DATE, hire_date)) AS tenure
 FROM employees
)
SELECT d.dept_name, ROUND(AVG(et.tenure)) AS average_tenure, ROUND(AVG(s.salary)) AS average_salary
FROM employee_tenure et

JOIN dept_emp de
    ON et.emp_no = de.emp_no

JOIN salaries s
    ON et.emp_no = s.emp_no

JOIN departments d
    ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC;

--3. ¿Cómo se distribuye la masa salarial por departamento en comparación con su dotación?
WITH department_cost AS (
 SELECT d.dept_name, COUNT(*) AS headcount, SUM(s.salary) AS payroll
 FROM departments d
 JOIN dept_emp de
	ON d.dept_no = de.dept_no
 JOIN salaries s
	ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
)
  
SELECT dept_name, headcount, payroll, ROUND(payroll * 100.0 / 2) AS payroll_percentage
FROM department_cost
ORDER BY payroll DESC;
