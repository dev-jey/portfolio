FROM nginx:1.13
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/backend-not-found.html /var/www/html/backend-not-found.html
COPY ./nginx/includes/ /etc/nginx/includes/

COPY ./nginx/ssl/ /etc/ssl/certs/nginx/