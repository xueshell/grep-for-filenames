#!/bin/bash

. ./functions.sh

pattern=`flatListFilesFrom $1`
findNotMatchedPatternSubset "$pattern" $2
