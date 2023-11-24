#!/bin/sh

rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED

python -m pip install "pelican[markdown]"

cd site

mkdir -p content/images

mv ../pelicanconf.py . && mv ../1337.png content/images

echo 'Title: Yrimah review of inception
Date: 2023-12-31 23:59
Category: Review

![1337BG](/images/1337.png "42NETWORK-1337BG")

Following is a review of yrimah inception project at 1337BG.' > content/keyboard-review.md

pelican content -o output -s pelicanconf.py

exec pelican content -l -r -b 0.0.0.0 -p 8000
