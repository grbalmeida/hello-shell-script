#!/bin/bash

####################################################################
#                                                                  #
# Name: math-operations.sh                                         #
#                                                                  #
# Author: Gilvan Ribeiro                                           #
# Creation date: 2019-08-11                                        # 
#                                                                  #
# Description: The script receives two values entered by the user  #
#              and displays a menu for one of the basic operations #
#              be performed.                                       #
#                                                                  #
# Example of use: ./math-operations.sh                             #
#                                                                  #
####################################################################

multiplication_by_zero () {
  if [ $1 -eq 0 -o $2 -eq 0 ]
  then
    echo "The number 0 can't be used in a multiplication"
    exit 1
  fi
}

division_type () {
  if [ $(expr $1 % $2) -ne 0 ]
  then
    echo "Division with rest = $(expr $1 % $2)"
  else
    echo "Exact division"
  fi
  echo
}

leaving_the_program () {
  echo "Leaving the program..."
  exit
}

invalid_option () {
  echo "Invalid option!"
  exit 1
}

prevent_null_values () {
  read -p "Enter the first number: " FIRST_NUMBER
  read -p "Enter the second number: " SECOND_NUMBER

  if [ ! $FIRST_NUMBER ] || [ ! $SECOND_NUMBER ]
  then
    echo "None of the values can be null."
    exit 1
  fi
}

show_menu () {
  echo
  echo "Choose an operation:"
  echo "1 = SUM"
  echo "2 = SUBTRACTION"
  echo "3 = MULTIPLICATION"
  echo "4 = DIVISION"
  echo "Q = EXIT"
  echo
  read -p "Option: " OPTION
}

show_messages () {
  case $OPTION in
    1)
      OPERATION="+"
      ;;
    2)
      OPERATION="-"
      ;;
    3)
      multiplication_by_zero $FIRST_NUMBER $SECOND_NUMBER
      OPERATION="*"
      ;;
    4)
      division_type $FIRST_NUMBER $SECOND_NUMBER
      OPERATION="/"
      ;;
    [Qq])
      leaving_the_program
      ;;
    *)
      invalid_option
      ;;
  esac
}

prevent_null_values
show_menu
show_messages

echo "$FIRST_NUMBER $OPERATION $SECOND_NUMBER = $(expr $FIRST_NUMBER "$OPERATION" $SECOND_NUMBER)"
