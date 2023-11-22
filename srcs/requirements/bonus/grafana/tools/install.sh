#!/bin/sh

apt-get update && apt-get upgrade

apt-get install -y apt-transport-https vim wget gnupg2

wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list

apt-get update && apt-get install -y grafana
