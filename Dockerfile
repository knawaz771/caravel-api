FROM php:8.3-fpm

WORKDIR /var/www

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev

RUN docker-php-ext-install pdo pdo_mysql zip

COPY . .

CMD ["php-fpm"]