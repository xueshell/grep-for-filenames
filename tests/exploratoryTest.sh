#!/bin/bash

function testCollectingNthLine() {
    input=$'a\nb\nc'
    assertEquals 'a' `echo "$input" | sed -n 1p`
    assertEquals 'b' `echo "$input" | sed -n 2p`
    assertEquals 'c' `echo "$input" | sed -n 3p`
}

function testLoopingThroughStringWithNLChars() {
    input=$'a\nb\nc'
    i=1
    for line in $input
    do
        assertEquals 1 ${#line}
        assertEquals $line `echo "$input" | sed -n "$i"p`
        let i=i+1
    done
}

function testCanBrowseToTheMain() {
    cd ..
    expected='./grepForFilenames.sh'
    actual=`find -name grepForFilenames.sh`
    assertEquals $expected $actual
}

function testMultipleLinesString() {
    str='a
b
c'
    assertEquals $'a\nb\nc' "$str"
}

function testMultipleLinesInDoubleQuotes() {
    var1=1
    var2=2
    var3=3
    str="$var1
$var2
$var3"
    assertEquals $'1\n2\n3' "$str"
}

function testHeredoc() {
    read -d '' str<<-____LINES
	a
	b
	c
____LINES
    assertEquals $'a\nb\nc' "$str"
}

. ./shunit2-2.1.6/src/shunit2
