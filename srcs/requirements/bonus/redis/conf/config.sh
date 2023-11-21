#!/bin/sh

echo "maxmemory 250mb
maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf

redis-server --protected-mode no
