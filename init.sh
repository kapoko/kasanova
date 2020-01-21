#!/bin/bash

# Cleaner terminal prefix, nomnom
export PS1="\W \u \$ "

# Include utility scripts
FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/utilities"/*
for f in $FILES; do 
	source $f;
done