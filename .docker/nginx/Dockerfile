FROM nginx:1.15.0-alpine

# Dockerize that we will use for healthcheck and for template copy
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www
RUN rm /etc/nginx/conf.d/default.conf
CMD dockerize -template nginx.tmpl:/etc/nginx/conf.d -stdout /var/log/nginx/access.log -stderr /var/log/nginx/error.log -wait tcp://app:8000 nginx
