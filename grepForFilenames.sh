#!/bin/bash

. ./functions.sh

pattern=`listFilesFrom $1`
listNotFoundByBasename "$pattern" $2
