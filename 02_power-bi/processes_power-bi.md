## 1. Carga de datos
# Subimos las tablas de nuestra base de datos de PostgreSQL donde se ubican los datos que queremos analizar.

<img width="1919" height="1031" alt="image" src="https://github.com/user-attachments/assets/53103d3a-aca3-4382-aff0-ee2f01fc0713" />

Al ser varias tablas con mucha cantidad de datos el modo de conectividad que vamos a utilizar es "DirectQuery" para evitar llenar el caché del programa.

## 2. PowerQuery
# Nos aseguramos que los datos de las tablas estén correctos, yendo a transformar datos para acceder a la herramienta de PowerQuery.

<img width="1919" height="1032" alt="image" src="https://github.com/user-attachments/assets/14172f83-a578-4242-8ff3-8a725b5d1f52" />

Utilizando el perfil de la columna y distribución de la columna para poder verificar si alguna de todas las tablas cargadas presentan algún tipo de error. Nos aseguramos que las columnas que tienen que tener valores únicos no posean un valor repetido y también nos aseguramos que ningún valor figure como error o vacío, que podría generar un error en el análisis.

## 3. Modelo de datos
# Se diseñó un modelo relacional en esquema copo de nieve/estrella, centrado en los empleados, garantizando la integridad referencial y optimizando el rendimiento de las consultas analíticas.

<img width="1919" height="1029" alt="image" src="https://github.com/user-attachments/assets/6ddd1ae4-f243-4f9e-839f-87d88ac17e78" />

* **Tabla Principal / Entidad Central:**
  * `public employees`: Contiene la información demográfica básica de los colaboradores (`emp_no`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`).

* **Tablas de Hechos:**
  * `public salaries`: Registro de salarios e historial de compensaciones asignadas a cada empleado (`salary`, `from_date`, `to_date`).
  * `public titles`: Historial de cargos y puestos ocupados por el personal a lo largo del tiempo.

* **Tablas de Dimensiones:**
  * `public departments`: Catálogo central de áreas o departamentos de la compañía (`dept_no`, `dept_name`).
  * `public dept_emp`: Tabla puente/intermedia que vincula empleados con sus respectivos departamentos.
  * `public dept_manager`: Asignación de colaboradores en roles de liderazgo/gerencia por departamento.
