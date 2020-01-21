#!/bin/bash

# lazytouch
# 
# Creates a file and opens it in code

lazytouch()
{
	# No argument given
	if [ -z "$1" ]; then
		output "Specify a filename" error
		return 1
	fi

	touch $1
	code $1

	output "File $1 created"
}