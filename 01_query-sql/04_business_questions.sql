-- REALIZAMOS PREGUNTAS DE NEGOCIO PARA SOLUCIONAR UN PROBLEMA Y REALIZAMOS SUS KPIS.

-- 1. ¿Qué departamento paga mejor?
SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments d	
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN salaries s
ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;

-- 2. ¿Qué departamento tiene más empleados?
SELECT d.dept_name, COUNT(*) AS total_employees
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC;

-- 3. ¿Qué puestos reciben mejores salarios?
SELECT t.title, ROUND(AVG(s.salary)) AS average_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title
ORDER BY average_salary;

-- 4. ¿Qué managers administran más personas?
SELECT dm.emp_no AS manager_id, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, COUNT(de.emp_no) AS total_employees
FROM dept_manager dm
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN dept_emp de
ON dm.dept_no = de.dept_no
GROUP BY dm.emp_no, CONCAT(e.first_name, ' ', e.last_name) , d.dept_name;
