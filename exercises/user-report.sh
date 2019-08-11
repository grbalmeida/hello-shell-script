#!/bin/bash

###############################################################
#                                                             #
# Name: user-report.sh                                        #
#                                                             #
# Author: Gilvan Ribeiro                                      #
# Creation date: 2019-08-11                                   #
#                                                             #
# Description: The script generates a report with information #
#              of a system user passed as a parameter.        #
#                                                             #
# Example of use: ./user-report.sh <user>                     #
#                                                             #
###############################################################

# ls /home/$1 > /dev/null 2>&1 || echo "Nonexistent user"
# ls /home/$1 > /dev/null 2>&1 || exit 1

ls /home/$1 > /dev/null 2>&1 || { echo "Nonexistent user" ; exit 1; }

USER_ID=$(grep $1 /etc/passwd | cut -d ":" -f3)
DESCRIPTION=$(grep $1 /etc/passwd | cut -d ":" -f5 | tr -d ,)

clear
echo "========================================================"
echo "User report: $1"
echo
echo "UID": $USER_ID
echo "Name or description: $DESCRIPTION"
echo
echo "Last login: "
lastlog -u $1
echo "========================================================"
exit 0
