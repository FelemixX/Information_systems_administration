#!/bin/bash
if [ -n "$1" ]; then
  fileName=$1
  lineCount=$(wc -l $fileName)
  wordCount=$(wc -w $fileName)
  echo "Lines: ${lineCount}. Words: ${wordCount}."
else
  echo "Please, enter the file name"
  exit 1
fi
# wc - word count / -l lines количество строк / -w words количество слов
# grep -P перловый греп, -o вывод только совпадений