#!/bin/bash
# -n не пустой
filesDir=$1;
if [ -n "$filesDir" ]; then
	filesData=$(ls -lQ "$filesDir" | egrep "\-(.{2}|.{5}|.{8})x");
#	l - вывод прав, Q - поместить названия в кавычки
# extended grep - \ (- - начало чередования ) - конец | - или
# . - любой символ кроме переноса строки
# x - право на исполнения файла
# {sth} - количество повторений
	executableFiles=$(echo "$filesData" | egrep -o "\".+\"$");
	printf "List of executable files:\n%s\n", "$executableFiles";
else
	echo "Please, enter the file path as the first argument";
fi
