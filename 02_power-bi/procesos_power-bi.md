
# 1. Subimos las tablas de nuestra base de datos de PostgreSQL donde se ubican los datos que queremos analizar.

<img width="1919" height="1031" alt="image" src="https://github.com/user-attachments/assets/53103d3a-aca3-4382-aff0-ee2f01fc0713" />

Al ser varias tablas con mucha cantidad de datos el modo de conectividad que vamos a utilizar es "DirectQuery" para evitar llenar el caché del programa.

# 2. Nos aseguramos que los datos de las tablas estén correctos yendo a transformar datos para acceder a la herramienta de PowerQuery

<img width="1919" height="1032" alt="image" src="https://github.com/user-attachments/assets/14172f83-a578-4242-8ff3-8a725b5d1f52" />

Utilizando el perfil de la columna y distribución de la columna para poder verificar si alguna de todas las tablas cargadas presentan algún tipo de error. Nos aseguramos que las columnas que tienen que tener valores únicos no posean un valor repetido y también nos aseguramos que ningún valor figure como error o vacío, que podría generar un error en el análisis.
