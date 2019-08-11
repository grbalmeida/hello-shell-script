#/bin/bash

FILE=/tmp/nonexistent-file.txt

ls $FILE

RETURN_CODE=$?

echo "The return code for the ls $FILE command is $RETURN_CODE"
