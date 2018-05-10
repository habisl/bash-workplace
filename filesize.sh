#!/bin/bash
# script to return size of the file

FILENAME=/home/habib/BashPractice/my.sh
FILESIZE=$(stat -c%s "$FILENAME")
echo "Size of $FILENAME = $FILESIZE bytes."