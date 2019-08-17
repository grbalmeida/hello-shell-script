#!/bin/bash

until ps axu | grep firefox | grep -v grep > /dev/null
do
  echo "Start firefox"
  sleep 3
  echo
done

echo "Firefox started"
echo "PID: $(pgrep firefox)"
