#!/bin/bash

# Functions

add () {
  echo "Option 1 chosen."
  echo "Start include operation..."
  sleep 3
}

remove () {
  echo "Option 2 chosen."
  echo "Start remove operation..."
  sleep 3
}

update () {
  echo "Option 3 chosen."
  echo "Start update operation..."
  sleep 3
}

exit_the_program () {
  echo "Leaving the program..."
  sleep 3
  exit 0
}

invalid_option () {
  echo "Invalid option"
  exit 2
}

# Menu display

clear
echo "Choose an option from the menu:"
echo
echo "1 - Add"
echo "2 - Remove"
echo "3 - Update"
echo "q - Exit"
echo
read -p "Option: " OPTION
echo

# Menu routines

case "$OPTION" in
  1)
    add
    ;;
  2)
    remove
    ;;
  3)
    update
    ;;
  q)
    exit_the_program
    ;;
  *)
    invalid_option
    ;;
esac
