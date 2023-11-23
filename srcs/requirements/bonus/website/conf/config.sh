#!/bin/sh

rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED

python -m pip install "pelican[markdown]"

cd site

mv ../pelicanconf.py . && mv ../publishconf.py .

mkdir content

echo "Title: Yrimah review of inception
Date: 2023-12-31 23:59
Category: Review

Following is a review of yrimah inception project at 1337BG." > content/keyboard-review.md

pelican content -o output -s pelicanconf.py

#echo "Title: My First Review
#Date: 2010-12-03 10:20
#Category: Review

#Following is a review of my favorite mechanical keyboard." > content/keyboard-review.md

pelican content -l -b 0.0.0.0 -p 8000
