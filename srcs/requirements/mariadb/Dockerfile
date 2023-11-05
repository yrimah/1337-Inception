FROM debian:latest

WORKDIR /mariadb

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./tools/config.sh .
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod u+x config.sh

EXPOSE 3306

CMD ["./config.sh"]
