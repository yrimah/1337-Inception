FROM debian:12

WORKDIR /website

COPY conf/pelicanconf.py .

COPY conf/publishconf.py .

COPY conf/config.sh .

COPY tools/install.sh .

RUN chmod u+x config.sh install.sh

RUN ./install.sh

EXPOSE 8000

CMD ["./config.sh"]
