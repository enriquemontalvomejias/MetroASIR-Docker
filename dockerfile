# Usa una imagen base de PHP con Apache
FROM php:8.2-apache

# Habilita la extensión mysqli para conexión con MariaDB
RUN docker-php-ext-install mysqli

# Copia el contenido de tu app al contenedor
COPY . /var/www/html/

# Da permisos (opcional, depende de tu app)
RUN chown -R www-data:www-data /var/www/html
