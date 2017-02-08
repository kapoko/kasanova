# findtheme
# 
# Find wordpress theme in trellis directory

findtheme() {

	# Save current working directory
	original_pwd=$PWD

	# Find app path
	app_path="$(find $(pwd) -maxdepth 3 -type d -name 'app' -print)"
	if [ -z "$app_path" ]; then
		output "App folder not found" error
		return 1
	fi

	# Find themes folder
	cd $app_path
	themes_path="$(find $(pwd) -maxdepth 1 -type d -name 'themes' -print)"
	if [ -z "$themes_path" ]; then
		output "Themes folder not found" error
		cd $original_pwd
		return 1
	fi

	# Add all directories to array
	cd $themes_path
	shopt -s nullglob
	themes=(*/)
	shopt -u nullglob 

	# If there's only one theme, cd into it
	if [ ${#themes[@]} -eq 1 ]; then
		cd "${themes[0]}"
		output "Found theme, cd'ing into \e[1m${themes[0]%/}\e[0m"
		return 0;
	else 
		output "There seem to be more than one theme" error
		cd $original_pwd
		return 1;
	fi
}
