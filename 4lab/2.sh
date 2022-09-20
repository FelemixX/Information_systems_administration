#!/bin/bash

[[ -z $1 ]] && userName=$USER || userName=$1
sameGroupUsers=$(cut -d: -f4 /etc/group | grep "$userName")
[[ -z $sameGroupUsers ]] && echo "No users found in the same group" || echo "Users append in the same group ${sameGroupUsers}"

