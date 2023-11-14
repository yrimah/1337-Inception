FROM debian:12

WORKDIR /ftp

COPY conf/config.sh .

COPY tools/install.sh .

RUN chmod u+x config.sh install.sh

RUN ./install.sh

EXPOSE 20 21

CMD ["./config.sh"]
