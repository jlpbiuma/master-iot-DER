# Usa la imagen oficial de MySQL como base
FROM mysql:latest

# Variables de entorno para configurar la base de datos
ENV MYSQL_DATABASE basededatos
ENV MYSQL_ROOT_PASSWORD contraseña_root

# Copia el script SQL con las definiciones de las tablas al contenedor
COPY ./sql/init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto por defecto de MySQL
EXPOSE 3306
