#! /bin/bash

#This command delete all the files and directorys in the .waste directory
#I use .waste1 as waste directory for try my commands

#Make by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [ ! -d ~/.waste ]
then
	mkdir ~/.waste
	echo "Your bin is now empty!"
	exit 0
else
	rm -rf ~/.waste
	mkdir ~/.waste
	echo "Your bin is now empty!"
	exit 0
fi
