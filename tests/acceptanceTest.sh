#!/bin/bash

function testFound3Of5Recursive() {
    cd ..
    basedir=./tests/data/acceptanceTest/testFound3Of5Recursive
    filenames=$basedir/filenames
    references=$basedir/references
    read -d '' expected <<-____EOF
	$filenames/nonemptyDir/file3.png
	$filenames/nonemptyDir/file4.xml
	$filenames/file5.flac
____EOF
    actual=`./grepForFilenames.sh $filenames $references`
    assertEquals "$expected" "$actual"
}

. ./shunit2-2.1.6/src/shunit2
