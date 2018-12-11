#! /bin/bash

#This command move a file to the directory ~/studio1/.waste

#Made by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [ ! -d "~/.waste" ]
then
	mkdir ~/.waste
fi

if [ $# -lt 1 ]
then
	echo "Error. Command need one argument."
	exit 1
fi

if [ -e "$1" ]
then
	if [ -d "$1" ]
	then
		echo "Error. This file is a directory"
		exit 2
	else
		cp $1 ~/.waste
		echo "File copied."
		exit 0
	fi
else
	echo "Error. This file dosen't exist."
	exit 3
fi
