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
	full_prefix="$prefix"
	if [ -n "$2" ]; then
		case "$2" in
			"error")
			    full_prefix="$prefix [\e[31merror\e[0m]"
			    ;;
			"noprefix")
			    full_prefix="  "
			    ;;
			*)
			    full_prefix="$prefix"
			    ;;
		esac
	fi

	echo -e "\e[0m$full_prefix $1"
}