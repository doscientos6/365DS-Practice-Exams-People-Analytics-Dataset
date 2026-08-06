-- 1. ¿Cuántos empleados tiene actualmente la empresa?
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. ¿Qué departamentos hay?
SELECT dept_name
FROM departments;

-- 3. ¿Cuál es la distribución de empleados por género?
SELECT gender, COUNT(*) AS total_employees
FROM employees
GROUP BY gender;

-- 4. ¿Cuál es el salario promedio, mínimo y máximo de la empresa?
SELECT ROUND(AVG(salary),2) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM salaries;

-- 5. ¿Cuántos empleados trabajan actualmente en cada departamento?
SELECT d.dept_name, COUNT(*) AS total_employees
FROM dept_emp de
JOIN departments d
ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC;

-- 6. ¿Cuál es la antigüedad promedio de los empleados?
SELECT AVG(DATE_PART('year', AGE(CURRENT_DATE, hire_date))) AS average_tenure
FROM employees;

-- 7. ¿Cuál es la edad promedio de los empleados?
SELECT ROUND(AVG(DATE_PART('year', AGE(CURRENT_DATE, birth_date)))::numeric,2) AS average_age
FROM employees;
