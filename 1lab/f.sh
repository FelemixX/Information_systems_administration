#!/bin/bash

filesExt=$1
fileModificationDayLimit=$2
filesDir=$3
# -z if(empty) true
if [ -z "$filesDIr" ]; then
  filesDir="./"
fi

if [ -z "$filesExt" ]; then
  echo "Please, enter the file extension as the first argument"
  exit 1
fi

if [ -z "$fileModificationDayLimit" ]; then
  echo "Please, enter the file modification days limit as the second argument"
  exit 1
fi

files=$(find "$filesDir" -type f -mtime -"$fileModificationDayLimit" -name "*.$filesExt")
echo "$files"
