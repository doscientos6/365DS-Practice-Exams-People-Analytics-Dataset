-- OBJETIVO: Limpieza, validación, exploración de datos con SQL y creación de KPIs del dataset "365DS-Practice-Exams-People-Analytics-Dataset".
-- ===================================================

-- 1. CREAMOS LAS DISTINTAS TABLAS QUE VAMOS A UTILIZAR JUNTO A SUS COLUMNAS PARA PODER IMPORTAR EL ARCHIVO CSV.

-- TABLA: departments

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL UNIQUE
);

-- TABLA: employees

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('M','F')),
    hire_date DATE NOT NULL
);

-- TABLA: salaries

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,

    PRIMARY KEY (emp_no, from_date),

    FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

-- TABLA: titles

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,

    PRIMARY KEY (emp_no, title, from_date),

    FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

-- TABLA: dept_emp

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,

    PRIMARY KEY (emp_no, dept_no),

    FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no),

    FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no)
);

-- TABLA: dept_manager

CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,

    PRIMARY KEY (emp_no, dept_no),

    FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no),

    FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no)
);

-- Realizar:
        SELECT *
        FROM "La tabla cargada"
        LIMIT 10;
-- Para asegurar que la tabla fue cargada correctamente.


-- 2. VALIDACIÓN DE CALIDAD DE DATOS DE CADA UNA DE LAS TABLAS.
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

    
-- 3. REALIZACIÓN DE KPIs.

