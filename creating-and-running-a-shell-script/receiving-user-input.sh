#!/bin/bash

FILE=files/students.txt

#######################################################################
#                                                                     #
# receiving-user-input.sh - Search student's full name                #
#                                                                     #
# Author: Gilvan Ribeiro                                              #
# Creation date: 2019-08-10                                           #
#                                                                     #
# Description: Sample script for read command.                        #
#              From a user input will be searched in the $FILE file   #
#                                                                     #
# Example of use: ./receiving-user-input.sh                           #
#                                                                     #
#######################################################################

clear
echo "====== Student search script  ======"
echo ""
echo -n "Please enter student name: "
read STUDENT_NAME

FULL_NAME=$(grep "$STUDENT_NAME" $FILE)

echo ""
echo "The student's full name is: $FULL_NAME"
echo ""
echo "End of script"
