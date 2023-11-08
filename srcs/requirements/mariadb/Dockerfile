FROM debian:12

WORKDIR /mariadb

COPY ./tools/install.sh .

COPY ./conf/config.sh .

RUN chmod u+x config.sh install.sh

EXPOSE 3306

RUN /bin/sh ./install.sh
#&& /bin/sh ./config.sh

CMD ["./config.sh"]
#CMD ["/usr/bin/mysqld_safe"]
