#!/bin/bash

partFileName=$1
rmArchivePath=~/".deleted_files/archive.tar.xz"
rmFilesPath=~/".removed-files"
delimiter="\/\/\/"

if [ -n "$partFileName" ]; then
  found=$(cat "$rmFilesPath" | sed -e "s/\([^$delimiter]*\).*/\1/" | grep ".*${partFileName}.*")
  for file in $found; do
    pathToRestore=$(sed -n "s/\($file${delimiter}\)\(.\+\)/\2/p" "$rmFilesPath")
    dirToRestore=$(dirname "$pathToRestore")
    baseFileName=$(basename "$pathToRestore")

    test ! -d "$dirToRestore" && mkdir "$dirToRestore"
    tar -xvf "$rmArchivePath" -C "$dirToRestore" "$file"
    mv -T "$dirToRestore/$file" "$dirToRestore/$baseFileName"
  done
else
  echo "Please, enter not empty file name part or date in format dmY_HIS as the first argument."
fi
