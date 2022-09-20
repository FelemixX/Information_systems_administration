#!/bin/bash

pathToRm=$1
rmArchivePath=~/".deleted_files/archive.tar.xz"
rmFilesPath=~/".removed-files"
delimiter="///"

if [[ -f "$pathToRm" || -d "$pathToRm" ]]; then
  absPath="$(readlink --canonicalize "$pathToRm")"
  baseName=$(basename "$absPath")
  dirPath=$(dirname "$absPath")

  timestamp=$(date +"%d%m%Y_%H%I%S")
  baseNameWithDate=$(echo "$baseName" | sed -e "s/\([^.]*\)\(\.\{0,1\}.*\)/\1_$timestamp\2/")
  newAbsolutePath="${dirPath}/$baseNameWithDate"

  mv "$absPath" "newAbsPath"
  tar cpSWf "$rmArchivePath" -C "$dirPath" "$baseNameWithDate" --remove-files

  echo "$baseNameWithDate${delimiter}$absPath" >>"$rmFilesPath"
else
  echo "Please, enter correct path to delete as the first argument"
fi
