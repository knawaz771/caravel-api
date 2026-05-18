FROM php:8.3-fpm

WORKDIR /app

COPY . .

RUN docker-php-ext-install pdo pdo_mysql

CMD ["php-fpm"]