#!/bin/bash

DEBUG=false

#------------------------------------------------------------------------------
# Functions
print_debug()
{
	if [[ "$DEBUG" == "true" ]]; then
		echo $@
	fi
}

#------------------------------------------------------------------------------
# Actual script
clear
echo "----------------------------------------"
echo "Showing git branches inside each subdirs"
echo

for d in *; do
	if [[ -d "$d" ]]; then
		cd "$d"
			# check if this is a git repo
			if [[ -d ".git" ]]; then
				print_debug "$(pwd) is a git repo"
				branch_name=$(git branch | grep "^*" | sed "s/^\* //")
				printf "%42s   --->   %s\n" $(pwd) "$branch_name"
			fi
		cd ..
	fi
done

echo
echo "Done!"
echo "----------------------------------------"
