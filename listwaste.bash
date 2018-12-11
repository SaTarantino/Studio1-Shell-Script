#! /bin/bash

#This command list the name and size in bit of any file and directory in .waste

#Make by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [ ! -d ~/.waste ]
then
	mkdir ~/.waste
	echo "This are the names and size of the files and directorys is your bin."
	du -ab ~/.waste
	exit 0
else
	echo "This are the names and size of the files and directorys is your bin."
	du -ab ~/.waste
	exit 0
fi
