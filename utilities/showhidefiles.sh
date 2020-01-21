#!/bin/bash

# showfiles
#
# Show hidden files on macOS

showfiles() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder /System/Library/CoreServices/Finder.app
}

# hidefiles
#
# Hide again

hidefiles() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder /System/Library/CoreServices/Finder.app
}
