#! /bin/bash

#This command make executible a file for all the users.

#Make by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [ $# -lt 1 ]
then
	echo "Error. The command need one argument."
	exit 1
fi

if [ -e "$1" ]
then
	if [ -d "$1" ]
	then
		echo "Error. The file is a directory."
		exit 2
	else
		chmod a+x "$1"
		exit 0
	fi
else
	echo "Error. This file dosen't exist."
	exit 3
fi
