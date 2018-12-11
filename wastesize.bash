#! /bin/bash

#This command reports the number of files in ~/studio1/.waste

#Make by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [[ ! -d ~/.waste ]]
then
	mkdir ~/.waste
	echo "The files in your bin are:"
	find ~/.waste/* -type f 2> /dev/null | wc -l
	exit 0
else
	echo "The files in your bin are:"
	find ~/.waste/* -type f 2> /dev/null | wc -l
	exit 0
fi
