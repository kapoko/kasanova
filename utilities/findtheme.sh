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

	if [ ${#themes[@]} -eq 1 ]; then
		# If there's only one theme, cd into it
		cd "${themes[0]}"
		output "Found theme, cd'ing into \e[1m${themes[0]%/}\e[0m"
		return 0;
	elif [ ${#themes[@]} -eq 0]; then
		output "No themes found" error
		cd $original_pwd
		return 1;
	else 
		# There's more than one theme
		output "More than one theme found" info

		# Sort themes alphabetically
		IFS=$'\n' sorted=($(sort <<<"${themes[*]}"))
		unset IFS

		for i in "${!themes[@]}"; do 
			printf "[%s] \e[1m%s\e[0m\n" "$i" "${themes[$i]::-1}"
		done

		maxTheme=$((${#themes[@]}-1))
		printf "Select theme [0-%s]: " $maxTheme
		read -r themeIndex

		# Check if number input is between 0 and the number of themes
		if ! [ "$themeIndex" -ge 0 -a "$themeIndex" -le $maxTheme ]; then 
			output "Select correct number" error
			cd $original_pwd
			return 1;
		fi

		cd "${themes[$themeIndex]}"
		output "Cd'ing into \e[1m${themes[$themeIndex]%/}\e[0m"

		return 0;
	fi
}
