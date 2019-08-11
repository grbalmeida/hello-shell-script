#!/bin/bash

############################################################
#                                                          #
# Name: current-time.sh                                    #
# Creation date: 2019-08-11                                #
#                                                          #
# Description: Displays current date in format 0-12        #
#              indication am/pm and giving a message       #
#              good morning, good afternoon or good night  #
#                                                          #
# Example of use: ./current-time.sh                        #
#                                                          #
############################################################

HOUR=$(date +%H)
MINUTE=$(date +%M)

greeting () {
  if [ $HOUR -ge 06 -a $HOUR -lt 12 ]
  then
    echo "Good morning!"
  elif [ $HOUR -ge 12 -a $HOUR -lt 18 ]
  then
    echo "Good afternoon!"
  else
    echo "Good night!"
  fi
}

am_pm () {
  if [ $HOUR -ge 12 ]
  then
    AM_PM=PM
  else
    AM_PM=AM
  fi
}

reduce_time () {
  if [ $HOUR -gt 12 ]
  then
    HOUR=$(expr $HOUR - 12)
  fi
}

show_current_time () {
  echo
  echo "Current time is: $HOUR:$MINUTE $AM_PM"
}

greeting
am_pm
reduce_time
show_current_time