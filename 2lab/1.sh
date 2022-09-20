#!/bin/bash

targetFile=~/".myevents";
configFile=~/"myevents.conf";
displayDateStart=$2;

if (test -f $configFile); then #проверить, существует ли файл (-f). test === 0 ? true : false
	outputLineQuantity=$(head $configFile | grep -o -E "[0-9]+"); #вывод строк (по умолчанию 10,
	#ищем по дате, потому что она точно будет встречаться везде
else
	outputLineQuantity=7;
fi
if [ -z "$1" ]; then
	tail -n $outputLineQuantity "$targetFile";
else
	regexDatePattern='s/\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)\(.*\)/\2\/\1\/\3/';
#	regexDatePattern='\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)\,\([0-9]\+\)\:\([0-9]\+)\:\([0-9]\+\)';
	inputDate=$(date -d $(sed "$regexDatePattern" <<< "$1") + %s 2> /dev/null);
	#2> /dev/null - чтобы баш не кидался ошибками когда доходит до конца строки ?
	# <<< ===  heredoc для строк
	#мне надоело бороться с квантификаторами и башем, поэтому мне помогли индусы на stackoverflow
	if [ -z "$inputDate" ]; then
		timeDate=$(date +"%d.%m.%Y,%H:%I:%S"); #Баш почему-то ест только такой формат даты. Пусть ест
		echo -e "$timeDate\t$1" >> "$targetFile";
	else
		emptyString='';
		while read -r line; do #читаем как строку, чтобы не ловить терминаторы. Баш это любит, видимо
			dateFromLine=$(date -d $(sed "$regexDatePattern" <<< "$line") +%s);
			if [[ $dateFromLine -ge "$inputDate" ]];
			then
				echo $line;
			fi
		done < "$targetFile";
	fi
fi
