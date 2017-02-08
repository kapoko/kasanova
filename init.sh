#!/usr/local/bin/bash

# Cleaner terminal prefix, nomnom
export PS1="\W \u \$ "

# Edit vhosts in MAMP
alias edit_vhosts='sublime /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf'

# Include utility scripts
FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/utilities"/*
for f in $FILES; do 
	source $f;
done