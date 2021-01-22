FROM php:7.3.6-fpm-alpine3.9

# Dependencies
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
# Remove default folder
RUN rm -rf /var/www/html

# Copy files to container folder (Note: we could have used "COPY . ." since we defined the WORKDIR pointing to the same path)
COPY . /var/www
# Create symbolic link to html called "public"
RUN ln -s public html

# Install dependencies, copy .env, and configure artisan
RUN composer install && \
    cp .env.example .env && \
    php artisan key:generate && \
    php artisan config:cache

# Expose container port
EXPOSE 9000
# Set entrypoint to routine that will hold container running
ENTRYPOINT [ "php-fpm" ]