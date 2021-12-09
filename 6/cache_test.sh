#!/bin/bash

rm -f *.log

KB_SIZE=2
for (( c = 0; c <= 13; c++))
do
    KB_SIZE=$(( $KB_SIZE * 2 ))
    ./cache $KB_SIZE >> cache_test.log
done
