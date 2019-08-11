#!/bin/bash

###############################################################
#                                                             #
# Name: sum.sh                                                #
#                                                             #
# Author: Gilvan Ribeiro                                      #
# Creation date: 2019-08-11                                   #
#                                                             #
# Description: The script adds two user-entered values.       #
#                                                             #
# Example of use: ./sum.sh                                    #
#                                                             #
###############################################################

echo -n "Enter first number: "
read FIRST_NUMBER

echo -n "Enter second number: "
read SECOND_NUMBER

SUM=$(expr $FIRST_NUMBER + $SECOND_NUMBER)

echo "The sum of $FIRST_NUMBER plus $SECOND_NUMBER equals $SUM"
