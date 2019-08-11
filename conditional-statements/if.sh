#!/bin/bash

USER=$(grep "$1" /etc/passwd)

if test -n "$USER"
then
  echo "The user exists"
else
  echo "The user doesn't exist"
fi
