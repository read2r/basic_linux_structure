#!/bin/bash
#sched_test.sh

removePreviousTestLog() {
    printf "Removing Previous Test Log...\t"
    raw=`ls | grep \\.log`
    res=(`echo $raw | tr " " "\n"`)
    resSize=${#res[*]}

    if [ $resSize -gt 0 ]
    then
        rm *.log
        printf "Done!\n"
    else
        printf "No previous log\n"
    fi
}

test1() {
    TestPostfix=(a b c)
    TestProcsNum=(1 2 4)

    for (( i = 0 ; i < ${#TestPostfix[*]} ; i++ ))
    do
        nproc=${TestProcsNum[$i]}
        logFilename="exam4-${TestPostfix[$i]}"
        printf "Testing %s...\t" $logFilename
        taskset -c 0 ./sched $nproc 100 1 >> $logFilename.log
        printf "Done! Saved as \"%s.log\"\n" $logFilename
    done
}

test2() {
    TestPostfix=(d e f)
    TestProcsNum=(1 2 4)

    for (( i = 0 ; i < ${#TestPostfix[*]} ; i++ ))
    do
        nproc=${TestProcsNum[$i]}
        logFilename="exam4-${TestPostfix[$i]}"
        printf "Testing %s...\t" $logFilename
        taskset -c 0,4 ./sched $nproc 100 1 >> $logFilename.log
        printf "Done! Saved as \"%s.log\"\n" $logFilename
    done
}

main() {
    removePreviousTestLog
    test1
    test2
}

main
