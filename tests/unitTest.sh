#!/bin/bash

. ../functions.sh

function testFlatListFiles() {
    flatList=`flatListFilesFrom ./data/unitTest/testFlatListFiles/dirExample`
    diff <(echo "$flatList") ./data/unitTest/testFlatListFiles/flatListExample
    assertTrue 'Expected output differs.' $?
}

function testListFilesFrom() {
    list=`listFilesFrom ./data/unitTest/testFlatListFiles/dirExample`
    diff <(echo "$list") ./data/unitTest/testListFilesFrom/listExample
    assertTrue 'Expected output differs.' $?
}

function testPrintsNotFoundPattern() {
    pattern=file1.txt
    dir=./data/unitTest/testFindNotMatchedPatternSubset
    actual=`findNotMatchedPatternSubset $pattern $dir`
    assertEquals file1.txt $actual
}

function testFindNotMatchedPatternSubset() {
    pattern=$'file1.txt\nfile2.jpg\nfile3.png'
    dir=./data/unitTest/testFindNotMatchedPatternSubset
    actual=`findNotMatchedPatternSubset "$pattern" $dir`
    assertEquals $'file1.txt\nfile3.png' "$actual"
}

function testFoundAllPatternsRecursive() {
    pattern=$'file1.txt\nfile2.jpg\nfile3.png'
    dir=./data/unitTest/testFoundAllPatternsRecursive
    actual=`findNotMatchedPatternSubset "$pattern" $dir`
    assertEquals '' "$actual"
}

. ./shunit2-2.1.6/src/shunit2
