#!/bin/bash

# Log for student file
logsForStudent='log'

if [ -f $logsForStudent ];
then rm -rf $logsForStudent;
fi
touch $logsForStudent


# If correct you answer
if [diff --ignore-all-space correct_output.json output.json];
then
  echo "The files are identical." >> $logsForStudent
else
  echo "You have errors! The files are not identical." >> $logsForStudent
  exit 1
fi
