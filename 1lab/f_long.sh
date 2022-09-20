#!/bin/bash
filesExt=$1;
fileModificationDayLimit=$2;
filesDir=$3;

if [ -z "$filesDIr" ]; then
	filesDir="./";
fi

if [ -z "$filesExt" ]; then
	echo "Please, enter the file extension as the first argument";
	exit 1;
fi

if [ -z "$fileModificationDayLimit" ]; then
	echo "Please, enter the file modification days limit as the second argument";
	exit 1;
fi

if [ -d "$filesDir" ]; then
	IFS=$'\n';
	files=$(ls -lQ --full-time "$filesDir" | egrep "\".+\.$filesExt\"$");
	read -rd '' -a fileDataArray <<< "$files";
	for fileData in "${fileDataArray[@]}"
	do
		fileModificationTime=$(echo "$fileData" | awk '{print $6}');
	    	dateDiff=$(((`date --date="00:00" +%s` - `date --date="$fileModificationTime" +%s`)/(60*60*24)));
	    	if ! [ $dateDiff -gt $fileModificationDayLimit ]; then
	    		echo "$fileData" | awk '{print $9}';
    		fi	
	done
else
	echo "Please, enter not correct files search directory as the third argument";
	exit 1;
fi
