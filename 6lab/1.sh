#!/bin/bash

[[ -n $1 ]] && pkill $1 || echo "You can't kill yourself if you can't write your name to the death note meh :("