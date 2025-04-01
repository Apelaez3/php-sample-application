FROM php:8.2-fpm

# Instalar dependencias necesarias (si es necesario)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Copiar la configuración de PHP (si es necesario)
COPY php.ini /usr/local/etc/php/

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Exponer el puerto 9000 para PHP-FPM
EXPOSE 9000

# Iniciar PHP-FPM cuando se ejecute el contenedor
CMD ["php-fpm"]










