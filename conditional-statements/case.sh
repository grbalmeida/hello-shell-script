#!/bin/bash

case "$1" in
  [0-9])
    echo "The parameter is a number."
    ;;
  [A-Z])
    echo "The parameter is a capital letter."
    ;;
  [a-z])
    echo "The parameter is a lowercase letter."
    ;;
  *)
    echo "The parameter is a special character."
esac
