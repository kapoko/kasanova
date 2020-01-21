#!/bin/bash

# codeworkspace
#
# Search folder for a .code-workspace file and open it

codeworkspace() {
    project="$(find . -maxdepth 1 -name '*.code-workspace' -print)"
    if ! [ -n "$project" ]; then
        output "No code workspace found in this folder" error
    else 
        output "Opening $project"
        code $project
    fi
}