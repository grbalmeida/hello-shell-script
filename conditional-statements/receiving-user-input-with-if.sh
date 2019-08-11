#!/bin/bash

FILE=../creating-and-running-a-shell-script/files/students.txt

#######################################################################
#                                                                     #
# receiving-user-input-with-if.sh - Search student's full name                #
#                                                                     #
# Author: Gilvan Ribeiro                                              #
# Creation date: 2019-08-10                                           #
#                                                                     #
# Description: Sample script for read command.                        #
#              From a user input will be searched in the $FILE file   #
#                                                                     #
# Example of use: ./receiving-user-input-with-if.sh                   #
#                                                                     #
#######################################################################

clear
echo "====== Student search script  ======"

if test $# -gt 0
then
  FULL_NAME=$(grep "$1" "$FILE")
  echo "The student's full name is: $FULL_NAME"
else
  echo "Enter student name as parameter!"
fi

echo
echo "End of script"
