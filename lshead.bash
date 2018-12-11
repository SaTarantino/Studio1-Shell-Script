#! /bin/bash

#This command shows the first or last lines of a file.

#Made by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

if [[ "$1" = "-help" ]]
then
	echo "This is lshead.bash command."
	echo "Use -t + number + filename to view the last part of a file."
	echo "Use -h + number + filename to view the first part of a file."
	exit 0
fi

COMMAND="$1"

if [[ ! "$#" -eq 3 ]]
then
	echo "Error. This command need 3 arguments."
	echo "Use lshead.bash -help for info."
	exit 1
fi

if [[ "$1" = "-t" ]]
then
	COMMAND="tail"
elif [[ "$1" = "-h" ]]
then
	COMMAND="head"
elif [[ ! "$1" = "-t" ]] || [[ ! "$1" = "-h" ]] || [[ ! "$1" = "-help" ]]
then
	echo "Error. Try -t for tail, -h for head, or try -help."
	exit 2
fi

if [[ "$2" = [0-9] ]]
then
	if [[ $COMMAND = "tail" ]]
	then
		COMMAND="tail -n$2"
	elif [[ $COMMAND = "head" ]]
	then
		COMMAND="head -n$2"
	fi
	$COMMAND $3
else
	echo "Error. Wrong arguments order."
	echo "The second argument must be a number."
	exit 3
fi
exit 0
