#!/bin/sh
echo -n "Enter commit:"
read commit

git add .
git commit -a -m $commit
git push xixer master
