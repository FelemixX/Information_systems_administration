#!/bin/bash
[[ -z $1 ]] && echo "Enter username"; exit;
[[ -z $2 ]] && echo "Enter path"; exit;
[[ -n "$1" && -n "$2" ]] && su "$1" -c "du -hs $2" || echo "Please, enter correct user name as the first argument and directory path as the second.";