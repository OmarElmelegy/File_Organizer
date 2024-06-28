#!/usr/bin/bash

# Including Functions Script
source ./Functions_Task_A.sh

# Inputs
if (( $# < 1 )); then
	echo "No Input FilePath, Exiting Script"
	exit 1
fi

declare FolderPath
FolderPath=$1

if [ ! -e "$FolderPath" ]; then
	echo "Path does not exist.."
	exit 2
fi


# Logic
declare ReturnStatus
CreateDirectories $FolderPath
SortIntoDirectories $FolderPath





# Output

tree -a -C -v $FolderPath
