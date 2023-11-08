#!/bin/sh

rm -rf /home/yrimah42/data/wp_db/*
rm -rf /home/yrimah42/data/wp_files/*

docker volume rm wordpressdb wordpress_files

docker rmi nginx:1337 wordpress:1337 mariadb:1337
