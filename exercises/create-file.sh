#!/bin/bash

##############################################################
#                                                            #
# Name: create-file.sh                                       #
# Creation date: 2019-08-17                                  #
#                                                            #
# Description: Based on user information, the scripts create #
#              a text file of a certain size                 #
#                                                            #
# Example of use: ./create-file.sh                           #
#                                                            #
##############################################################

read -p "Enter the name of the file to be created: " FILE
read -p "Enter a character set: " WORD
read -p "Enter final file size (in bytes): " SIZE

cat /dev/null > $FILE

PERCENTAGE_DISPLAYED=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ]
do
  echo -n $WORD >> $FILE

  CURRENT_SIZE=$(stat --printf=%s "$FILE")
  CURRENT_PERCENTAGE=$(expr $CURRENT_SIZE \* 100 / $SIZE)

  if [ $(expr $CURRENT_PERCENTAGE % 10) -eq 0 -a $PERCENTAGE_DISPLAYED -ne $CURRENT_PERCENTAGE ]
  then
    echo "Completed: $CURRENT_PERCENTAGE% - File size: $CURRENT_SIZE"
    PERCENTAGE_DISPLAYED=$CURRENT_PERCENTAGE
  fi
done
