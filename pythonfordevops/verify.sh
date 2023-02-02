#!/bin/bash

# Log for student file
logsForStudent='log'

if [ -f $logsForStudent ];
then rm -rf $logsForStudent;
fi
touch $logsForStudent

# The names of the two files to compare
file1="correct_output.json"
file2="output.json"

# Use the diff command to compare the files
differences=$(diff --ignore-all-space $file1 $file2)

# If the diff command returns a non-empty string, the files are different
if [ -n "$differences" ]; then
  echo "The following differences were found between $file1 and $file2:" >> $logsForStudent
  echo "$differences" >> $logsForStudent
  exit 1
else
  echo "The files $file1 and $file2 are identical." >> $logsForStudent
fi
