# project
# 
# Open trellis projects quickly

kickstart() {

	# Save current working directory
	original_pwd=$PWD

	# No argument given
	if [ -z "$1" ]; then
		output "Specify a project" error
		return 1
	fi

	# cd into project folder
	go web

	project_dir=$(find . -name \*$1\* -type d -maxdepth 1 -print)
	if [ -z "$project_dir" ]; then
		output "Project folder not found, returning to original working directory" error
		cd $original_pwd
		return 1
	fi

	cd $project_dir

	# trellis
	trellis_dir="$(find $(pwd) -maxdepth 1 -type d -name 'trellis' -print)"
	if [ -n "$trellis_dir" ]; then
		output "Starting trellis"
		osascript <<EOD
			tell application "Terminal"
			    do script "cd $trellis_dir && vagrant up"
			end tell
EOD
	fi

	# theme
	output "Starting theme"
	osascript <<EOD
		tell application "Terminal"
		    do script "go web && cd $project_dir && findtheme && gulp && gulp watch"
		end tell
EOD
	
	# sublime
	sublime_project="$(find . -maxdepth 1 -name '*.sublime-project' -print)"
	if [ -n "$sublime_project" ]; then
		output "Opening project in sublime"
		sublime $sublime_project
	fi

    output "Starting ${projectdir##*/}"
           

}
