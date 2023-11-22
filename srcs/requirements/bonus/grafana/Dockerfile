
FROM debian:12

RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    apt-transport-https vim

RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && \
    echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list && \
    apt-get update && apt-get install -y grafana && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3000

WORKDIR /grafana

CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]
