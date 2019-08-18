#!/bin/bash

readFirstAndLastName () {
  read -p "Enter the name: " NAME
  read -p "Enter the last name: " LAST_NAME
  return 10
}

readFirstAndLastName

RETURN_CODE=$?
echo "Return code = $RETURN_CODE" # 10
echo "Name: $NAME"
echo "Last name: $LAST_NAME"
