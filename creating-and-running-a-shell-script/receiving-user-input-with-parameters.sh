#!/bin/bash

FILE=files/students.txt

########################################################################
#                                                                      #
# receiving-user-input-with-parameters.sh - Search student's full name #
#                                                                      #
# Author: Gilvan Ribeiro                                               #
# Creation date: 2019-08-10                                            #
#                                                                      #
# Description: Sample script for read for the use of parameters.       #
#              From a user input will be searched in the $FILE file    #
#                                                                      #
# Example of use: ./receiving-user-input-with-parameters.sh            #
#                                                                      #
########################################################################

clear
echo "====== Student search script  ======"

FULL_NAME=$(grep "$1" $FILE)

echo ""
echo "The student's full name is: $FULL_NAME"
echo ""
echo "End of script"
