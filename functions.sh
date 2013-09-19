#!/bin/bash

function flatListFilesFrom() {
    find $1 -type f -printf '%f\n'
}

function listFilesFrom() {
    find $1 -type f
}

function listNotFoundByBasename() {
    for line in $1
    do
        grep -r `basename $line` $2 > /dev/null
        [ $? -eq 1 ] && echo $line
    done
}
