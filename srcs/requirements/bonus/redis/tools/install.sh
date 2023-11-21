#!/bin/sh

apt-get update && apt-get upgrade

apt-get install redis-server -y
