FROM php:7.3.6-fpm-alpine3.9

# Dependencies
RUN apk add --no-cache openssl bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Dependency to enable usermod changes
RUN apk add --no-cache shadow

WORKDIR /var/www
# Remove default folder
RUN rm -rf /var/www/html

# Copy files to container folder (Note: we could have used "COPY . ." since we defined the WORKDIR pointing to the same path)
COPY . /var/www

# Create symbolic link to html called "public"
RUN ln -s public html

# Change files owner to new user
RUN chown -R www-data:www-data /var/www
# Set user
RUN usermod -u 1000 www-data
USER www-data

# Expose container port
EXPOSE 9000
