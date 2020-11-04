#!/bin/bash

export OUTFILE=/root/dev/SoundjackLinux/SJCstart-out
export DISPLAY=:100
export PATH=./:/root/dev/SoundjackLinux:$PATH
name=`uname -n`

case "$name" in
        soundjack-prod-app-1)
		VAR1="248"
		VAR2="247"
        	;;

        soundjack-prod-app-2)
	        VAR1="245"
	        VAR2="245"
	        ;;

        soundjack-prod-app-3)
	        VAR1="244"
	     	VAR2="244"
	        ;;
 
        soundjack-prod-app-4)
	        VAR1="243"
	        VAR2="243"
	        ;;

        soundjack-prod-app-5)
       		VAR1="242"
	        VAR2="242"
	        ;;

        soundjack-test-app-2)
	        VAR1="201"
	        VAR2="204"
	        ;;

        *)
		echo "This is not a known soundjack host, please check hostname or update script"
		exit 3
		;;
esac

case "$1" in
	start)
		echo "Starting soundjack"
		/usr/bin/Xvfb :100 -ac -noreset > /dev/null 2>&1 &
		/root/dev/SoundjackLinux/SJC200828  SERVER $VAR1 $VAR2 >> $OUTFILE  2>&1  &
		;;

	stop)
		echo "Stopping soundjack"

		pkill -9 Xvfb
		pkill -9 SJC200828
		;;


	*)
		echo "Script supports start/stop"
		exit 1
		;;
esac
