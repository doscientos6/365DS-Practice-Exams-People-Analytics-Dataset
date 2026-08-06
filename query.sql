-- OBJETIVO: Limpieza, validación, exploración de datos con SQL y creación de KPIs del dataset 365DS-Practice-Exams-People-Analytics-Dataset.
-- ===================================================

-- 1. Creamos las distintas tablas que vamos a utilizar junto a sus columnas para poder importar el archivo CSV.

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


