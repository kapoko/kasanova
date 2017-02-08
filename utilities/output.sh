# output
# 
# Nice output

prefix="🤙 "

output() {

	# No argument given
	if [ -z "$1" ]; then
		echo "No message specified"
		return 1
	fi

	# If error
	error=false
	if [ -n "$2" ]; then
		if [ "$2" = "error" ]; then
			error=true
		fi
	fi

	if [ "$error" = true ] ; then
	    full_prefix="$prefix [\e[31merror\e[0m]"
	else
	    full_prefix="$prefix"
	fi

	echo -e "\e[0m$full_prefix $1"
}