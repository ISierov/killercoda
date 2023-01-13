#!/bin/bash

foldername='/vbazh/FilesForTests'
studentsBashFile='bashscript.sh'
forTestsBashFile='/vbazh/FilesForTests/bash.sh'
forTestsDeleteFile='/vbazh/FilesForTests/deleteemptyfiles'

arrFiles=("/file1.txt" "/file2.txt" "/file3.txt" "/file4.txt" "/bash.sh" "/deleteemptyfiles")

logsForStudent='log'

#Create folder for tests
if [ -d $foldername ];
then rm -rf $foldername;
fi
mkdir -p $foldername

#Create log file for Student
if [ -f $logsForStudent ];
then rm -rf $logsForStudent;
fi
touch $logsForStudent

#Create files
for str in ${arrFiles[@]}; do

	touch "${foldername}${str}"

	if [ $str = '/file4.txt' ];
	then
		echo 'Here will be some text' > ${foldername}${str};
	fi

	if [ $str = '/deleteemptyfiles' ];
	then
		echo "${foldername}/file1.txt" >> ${foldername}${str};
		echo "${foldername}/file2.txt" >> ${foldername}${str};
		echo "${foldername}/file3.txt" >> ${foldername}${str};
	fi
done

#Add info which files is
for str in ${arrFiles[@]}; do
    echo "We have file ${str}" >> $logsForStudent
done
echo "And some of that files is empty" >> $logsForStudent

#If student bash file is, then copy data to our file
if [ -f $studentsBashFile ];
then
	cp -v $studentsBashFile $forTestsBashFile;
else
	echo "You did not create file bashscript.sh in main directory" >> $logsForStudent
	exit 1
fi

#Change permission for bash script
chmod 744 $forTestsBashFile

source $forTestsBashFile $forTestsDeleteFile
#/bin/bash $forTestsBashFile $forTestsDeleteFile

#Check is files after removing or not
tempVar=0

for str in ${arrFiles[@]}; do

	if [ $str = '/deleteemptyfiles' ] || [ $str = '/file4.txt' ] || [ $str = '/bash.sh' ];
	then
		if [ ! -f "${foldername}${str}" ];
		then
			echo "Your script deleted not empty file ${str}" >> $logsForStudent
			tempVar=$(($tempVar + 1))
		fi
	else
		if [ -f "${foldername}${str}" ];
		then
			echo "Your script did not delete empty file ${str}" >> $logsForStudent
			tempVar=$(($tempVar + 1))
		fi
	fi
done

rm -rf $foldername

if [[ $tempVar -gt 0 ]];
then
  echo "You have $tempVar errors!" >> $logsForStudent
  exit 1

fi
echo "You have $tempVar errors )))" >> $logsForStudent
