#!/bin/bash

readFirstAndLastName () {
  read -p "Enter the name: " NAME
  read -p "Enter the last name: " LAST_NAME
}

readFirstAndLastName
echo "Name: $NAME"
echo "Last name: $LAST_NAME"
