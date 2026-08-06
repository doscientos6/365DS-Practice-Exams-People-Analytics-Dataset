-- VALIDACIÓN DE CALIDAD DE DATOS DE CADA UNA DE LAS TABLAS.

-- A. VERIFICACIÓN DE VALORES NULOS EN COLUMNAS OBLIGATORIAS (NOT NULL).
    --Si todas las consultas devuelven 0 filas, significa que no existen valores nulos en las columnas obligatorias.


-- TABLA: departments
-- ===================================================
SELECT *
FROM departments
WHERE dept_no IS NULL
    OR dept_name IS NULL;

-- TABLA: employees
-- ===================================================
SELECT *
FROM employees
WHERE emp_no IS NULL
   OR birth_date IS NULL
   OR first_name IS NULL
   OR last_name IS NULL
   OR gender IS NULL
   OR hire_date IS NULL;

-- TABLA: salaries
-- ===================================================
SELECT *
FROM salaries
WHERE emp_no IS NULL	
	OR salary IS NULL
    OR from_date IS NULL
    OR to_date IS NULL;

-- TABLA: titles
-- ===================================================
SELECT *
FROM titles
WHERE emp_no IS NULL	
	OR title IS NULL	
	OR from_date IS NULL;

-- TABLA: dept_emp
-- ===================================================
SELECT *
FROM dept_emp
WHERE emp_no IS NULL
	OR dept_no IS NULL
	OR from_date IS NULL
	OR to_date IS NULL;

-- TABLA: dept_manager
-- ===================================================
SELECT *
FROM dept_manager
WHERE emp_no IS NULL
	OR dept_no IS NULL
	OR from_date IS NULL
	OR to_date IS NULL;

-- B. VERIFICACIÓN DE VALORES REPETIDOS EN COLUMNAS QUE DEBERÍAN TENER VALORES ÚNICOS.

-- TABLA: departments
-- ===================================================
SELECT dept_no, COUNT(*) AS total_registros
FROM departments
GROUP BY dept_no
HAVING COUNT(*) > 1;

-- TABLA: employees
-- ===================================================
SELECT emp_no, COUNT(*) AS total_registros
FROM employees
GROUP BY emp_no
HAVING COUNT(*) > 1;

-- TABLA: salaries
-- ===================================================
SELECT emp_no, from_date, COUNT(*) AS total_registros
FROM salaries
GROUP BY emp_no, from_date
HAVING COUNT(*) > 1;

-- TABLA: titles
-- ===================================================
SELECT emp_no, title, from_date, COUNT(*) AS total_registros
FROM titles
GROUP BY emp_no, title, from_date
HAVING COUNT(*) > 1;

-- TABLA: dept_emp
-- ===================================================
SELECT emp_no, dept_no, COUNT(*) AS total_registros
FROM dept_emp
GROUP BY emp_no, dept_no
HAVING COUNT(*) > 1;

-- TABLA: dept_manager
-- ===================================================
SELECT emp_no, dept_no, COUNT(*) AS total_registros
FROM dept_manager
GROUP BY emp_no, dept_no
HAVING COUNT(*) > 1;

--RESULTADO DE LA VALIDACIÓN: NO SE DETECTARON VALORES NULOS EN COLUMNAS OBLIGATORIAS NI REGISTROS DUPLICADOS SEGÚN LAS CLAVES PRIMARIAS
