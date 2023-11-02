FROM alpine:latest

WORKDIR /nginx

RUN apk update
RUN apk upgrade
RUN apk add nginx

RUN mkdir /var/www/html
RUN echo "<!DOCTYPE html>\
<html>\
<body>\
\
<h1>My First Heading</h1>\
<p>My first paragraph.</p>\
\
</body>\
</html>" > /var/www/html/index.html

RUN echo "server {\
    listen 443;\
    server_name yrimah42.fr;\
\
    location / {\
        root /var/www/html;\
        index index.html;\
    }\
}" > /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
