#!/bin/sh
echo "Sync(pull) starting"

echo "."
echo "========================================"
git pull xixer master
echo "========================================"

read -p "Pull from server completed, continue to push(y/n)?" push_flag
if [ "$push_flag" = "y" ]; then
    read -p "Enter commit:" commit
    if [ -z $commit ]; then
        mydate=`date '+%x %T'`
        commit="Automatic commit at $commit"
    else
        commit=$commit
    fi

    #git add -p /data/github.com/wiki/ .
    git add .
    git commit -a -m "$commit"
    git push xixer master
   
    echo "."
    echo ".-------------------------------------."
    echo "'"
    echo "' Sync complete! '"
    echo "'"
    echo "--------------------------------------+"
else
    exit 0
fi
