FROM alpine:latest

WORKDIR /nginx

RUN apk update && apk upgrade && apk add nginx

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

RUN apk add openssl && mkdir /etc/nginx/ssl

RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout /etc/nginx/ssl/yrimah42.key -out /etc/nginx/ssl/yrimah42.crt -subj "/C=MA/ST=none/L=none/O=none/CN=yrimah42.fr"

RUN mkdir /etc/nginx/sites-available

RUN echo "server {\
\
	# SSL configuration\
	#\
	listen 443 ssl default_server;\
	listen [::]:443 ssl default_server;\
\
	ssl on;\
	ssl_certificate /etc/nginx/ssl/yrimah42.crt;\
	ssl_certificate_key /etc/nginx/ssl/yrimah42.key;\
\
	ssl_session_timeout 5m;\
\
	ssl_protocols TLSv1.2 TLSv1.3;\
	ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";\
	ssl_prefer_server_ciphers on;\
\
	root /var/www/html;\
\
	index index.html index.htm index.nginx-debian.html;\
\
	server_name yrimah42.fr;\
\
	location / {\
		try_files $uri $uri/ =404;\
	}\
}" > /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
