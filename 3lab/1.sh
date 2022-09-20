#!/bin/bash
[[ -z "$1" ]] && echo "Program name is empty"
foundProgram=$(which $1)
[[ -n "$foundProgram" ]] && echo "Program is present in system" || echo "Program is not present in system."
