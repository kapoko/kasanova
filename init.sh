#!/usr/local/bin/bash

# Cleaner terminal prefix, nomnom
export PS1="\W \u \$ "

# Edit vhosts in MAMP
alias edit_vhosts='sublime /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Include utility scripts
FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/utilities"/*
for f in $FILES; do 
	source $f;
done