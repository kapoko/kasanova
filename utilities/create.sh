#!/bin/bash

# create
# 
# Quick creation of new projects

create() {

	declare -a projects=("trellis")
	projectslength=${#projects[@]}

	# No argument given or unknown project type
	if ([[ ! "${projects[@]}" =~ "${1}" ]]) || [ -z "$1" ]; then

		output "Specify one of the following project types:" error

		for (( i=0; i<${projectslength}; i++ ));
		do 
			output "[$i] ${projects[$i]}" noprefix
		done	
		return 1
	fi

	case "$1" in
		"trellis")
			output "Creating trellis project"

			git clone --depth=1 git@github.com:roots/trellis.git && rm -rf trellis/.git
			git clone --depth=1 git@github.com:roots/bedrock.git site && rm -rf site/.git
			cd trellis && ansible-galaxy install -r requirements.yml

			output "Success"
			;;
	esac

}

