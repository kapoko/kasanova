# go
# 
# Shortcuts to different locations on the system.
# All locations are specified in one array.

go() {
	# Declare locations
	declare -A locations
	locations["home"]=~
	locations["web"]=~/Sync/web
	locations["scripts"]=~/Sync/scripts

	# No argument given
	if [ -z "$1" ]; then
		output "Where do you want to go?" error
		return 1
	fi

	# Edit the file
	if [ "$1" = "edit" ]; then
		ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
		sublime $ABSOLUTE_PATH
		return 0
	fi

	# Loop over locations
	for i in "${!locations[@]}"
	do
		if [ "$i" = "$1" ]; then
			# Location found in array, go to the folder associated with it
			output "cd'ing into ${locations[$i]}"
			cd $(echo ${locations[$i]} | tr -d '\r')
			return 0
		fi
	done

	output "Location $1 not specified" error
}