FROM php:7.3.6-fpm-alpine3.9

# Dependencies
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Dependency to enable usermod changes
RUN apk add --no-cache shadow

WORKDIR /var/www
# Remove default folder
RUN rm -rf /var/www/html

# Copy files to container folder (Note: we could have used "COPY . ." since we defined the WORKDIR pointing to the same path)
COPY . /var/www
RUN chown -R www-data:www-data /var/www

# Create symbolic link to html called "public"
RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

# Install dependencies, copy .env, and configure artisan

# Expose container port
EXPOSE 9000
