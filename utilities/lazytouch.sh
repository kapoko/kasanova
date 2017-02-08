# lazytouch
# 
# Creates a file and opens it in sublime

lazytouch()
{
	# No argument given
	if [ -z "$1" ]; then
		output "Specify a filename" error
		return 1
	fi

	touch $1
	sublime $1

	output "File $1 created"
}