#!/bin/bash

############################################################################
#                                                                          #
# Name: monitor-process.sh                                                 #
# Creation date: 2019-08-17                                                #
#                                                                          #
# Description: Process should run as Daemon, monitoring execution          #
#              of a process passed by parameter. Display constant messages #
#              on screen when process is not running                       #
#                                                                          #
# Example of use: monitor-process.sh <process>                             #
#                                                                          #
############################################################################

TIME=5

if [ $# -eq 0 ]
then
  echo "Please enter a process as argument."
  echo "./monitor-process.sh <process>"
  exit 1
fi

while true
do
  if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
  then
    sleep $TIME
  else
    echo "Attention!!!!!! Process $1 is NOT running!"
    sleep $TIME
  fi
done
