#!/bin/bash

[[ -z $1 ]] && userName=$USER || userName=$1

find / -user $userName -perm -6000 -exec ls -ldb {} \;

#perm -6000 - показывать файлы с SUID и SGID
# / - home
# -user юзернейм
# exec la -ldb  - вывод того что нашла find