#! /bin/bash

string=$1
configFile='./myevents.conf'
fileName='./.myevents'
n=7

data=$(grep -o -- "[0-9][0-9]\.[0-9][0-9]\.[0-9][0-9] [0-9][0-9]:[0-9][0-9]" <<< "$string")

if [ -f "$configFile" ]; then
	n=$(head -n 1 $configFile | grep -o -E "[0-9]+")
fi

if [ -n "$data" ]; then
  rowNumber=$(grep -n "$data" $fileName | cut -d ':' -f 1)
fi

if [ -n "$rowNumber" ]; then
  more +$rowNumber $fileName
elif [ -n "$string" ]; then
  date=$(date +'%d.%m.%g %R')
  echo "$date  $string" >> $fileName
else
  tail -n $n $fileName
fi
