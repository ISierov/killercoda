#!/bin/bash

logsForStudent='log'
forTestsBashFile = '/ttt/FilesForTests/bash.sh'

# Log for student file
if [ -f $logsForStudent ];
then rm -rf $logsForStudent;
fi
touch $logsForStudent

# The names of the two files to compare
file1="/ttt/correct_output.json"
file2="output.json"

# Use the diff command to compare the files
differences=$(diff --ignore-all-space $file1 $file2)
echo $differences >> $logsForStudent

# Check if output.json exist
if [ ! -f "$file2" ]; then
  exit 1
fi

# If the diff command returns a non-empty string, the files are different
if [ -n "$differences" ]; then
   echo "The files $file1 and $file2 are not identical." >> $logsForStudent
  exit 1
else
  echo "The files $file1 and $file2 are identical." >> $logsForStudent
fi