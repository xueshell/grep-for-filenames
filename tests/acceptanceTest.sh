#!/bin/bash

function testFound3Of5Recursive() {
    cd ..
    basedir=./tests/data/acceptanceTest/testFound3Of5Recursive
    filenames=$basedir/filenames
    references=$basedir/references
    expected=$'file3.png\nfile4.xml\nfile5.flac'
    actual=`./grepForFilenames.sh $filenames $references`
    assertEquals "$expected" "$actual"
}

. ./shunit2-2.1.6/src/shunit2
