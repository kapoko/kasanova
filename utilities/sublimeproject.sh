# sublimeproject
#
# Search folder for a .sublime-project file and open it

sublimeproject() {
    sublime_project="$(find . -maxdepth 1 -name '*.sublime-project' -print)"
    if ! [ -n "$sublime_project" ]; then
        output "No project found" error
    else 
        output "Opening $sublime_project"
        sublime $sublime_project
    fi
}