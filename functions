#!/bin/bash

function flatListFilesFrom() {
    find $1 -type f -printf '%f\n'
}

function findNotMatchedPatternSubset() {
    for line in $1
    do
        output=`grep -r $line $2`
        if [ "$output" == '' ]
        then
            echo $line
        fi
    done
}
