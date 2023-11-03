FROM debian:latest

WORKDIR /nginx

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y

RUN echo "<!DOCTYPE html>\
<html>\
<body>\
\
<h1>Welcome to yrimah(docker) nginx!</h1>\
</body>\
</html>" > /var/www/html/index.html

RUN apt-get install openssl -y && mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/yrimah42.key -out /etc/nginx/ssl/yrimah42.crt -subj "/C=MO/L=BG/O=1337/CN=yrimah.42.fr"

RUN echo "\
server {\
    listen 443 ssl;\
    listen [::]:443 ssl;\
\
    server_name yrimah.42.fr;\
\
    ssl_certificate /etc/nginx/ssl/yrimah42.crt;\
    ssl_certificate_key /etc/nginx/ssl/yrimah42.key;\
    ssl_protocols TLSv1.2 TLSv1.3;\
\
    index index.html;\
    root /var/www/html;\
}" > /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
