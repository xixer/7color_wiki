#!/bin/sh
echo "Sync(pull) starting"

echo "."
echo "=========================================="
git pull xixer master

echo "."
echo "=========================================="
echo -n "Pull from server completed, continue to push(y/n)?"
read push_flag

if [ "$push_flag" = "y" ]; then
    echo -n "Enter commit:"
    read commit
    if [ -z $commit ]; then
        mydate=`date '+%x %T'`
        commit="Automatic commit at $commit"
    else
        commit=$commit
    fi

    git add .
    git commit -a -m $commit
    git push xixer master
   
    echo "."
    echo ".---------------------------------------------------------------------------."
    echo "' '"
    echo "' Sync complete! '"
    echo "' '"
    echo "----------------------------------------------------------------------------+"
else
    exit 0
fi
