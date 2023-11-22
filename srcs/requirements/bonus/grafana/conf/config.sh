#!/bin/sh

rm -rf /usr/share/grafana/conf/defaults.ini

cp defaults.ini /usr/share/grafana/conf/defaults.ini

grafana-server --homepath=/usr/share/grafana
