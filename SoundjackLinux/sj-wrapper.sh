#!/bin/bash

export OUTFILE=/root/dev/SoundjackLinux/SJCstart-out
export DISPLAY=:100
export PATH=./:/root/dev/SoundjackLinux:$PATH

export SJ_CHANNELS=1
export SJ_FRAMESIZE=256
export SJ_JITTERBUF=2
export SJ_BINDPORT=50050

case "$1" in
    start)
        echo "Starting soundjack"
        /usr/bin/Xvfb $DISPLAY -ac -noreset > /dev/null 2>&1 &
        /root/dev/SoundjackLinux/SJC201112 SERVER $SJ_CHANNELS $SJ_FRAMESIZE $SJ_JITTERBUF $SJ_BINDPORT >> $OUTFILE 2>&1 &
        ;;

    stop)
        echo "Stopping soundjack"

        pkill -9 SJC201112
        pkill -9 Xvfb
        ;;

    *)
        echo "Script supports start/stop"
        exit 1
        ;;
esac
