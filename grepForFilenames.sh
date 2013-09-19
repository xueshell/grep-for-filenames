#!/bin/bash

[ -z $2 ] && echo "Usage: $0 DIRECTORY1 DIRECTORY2" && exit

. ./functions.sh

filesList=`listFilesFrom $1`
listNotFoundByBasename "$filesList" $2
