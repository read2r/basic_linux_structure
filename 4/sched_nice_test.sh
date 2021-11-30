#!/bin/bash
#sched_test.sh

testNice() {
    printf "Testing sched_nice...\t"
    taskset -c 0 ./sched_nice 100 1 >> sched_nice.log
    printf "Done! Saved as \"sched_nice.log\"\n"
}

main() {
    testNice
}

main
