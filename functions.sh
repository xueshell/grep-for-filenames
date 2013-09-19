#!/bin/bash

function flatListFilesFrom() {
    find $1 -type f -printf '%f\n'
}

function listFilesFrom() {
    find $1 -type f
}

function findNotMatchedPatternSubset() {
    for line in $1
    do
        output=`grep -r $line $2`
        if [ $? -ne 0 ]
        then
            echo $line
        fi
    done
}
