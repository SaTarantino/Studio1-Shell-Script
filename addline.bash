#! /bin/bash

#This command print a text line in a chosen position.

#Made by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

#If the first argument is -h or -help show some info."
if [[ "$1" = "-h" ]] || [[ "$1" = "-help" ]]
then
	echo "This code adds a line in a file to a selected position."
	echo "Double quote your text for insert more than one word."
	echo "-b add the text at the beginning of your file."
	echo "addline.bash -b "your text" txt"
	echo "-e add the text at the end of your file."
	echo "addline.bash -e "your text" bash"
	echo "-l add the text in a selected line."
	echo "addline.bash -l "your text" java 3"
	exit 0
fi
#Check if the argument are at least 3.
if [ "$#" -lt 3 ]
then
	echo "Error. Not enough arguments."
	echo "Try -help for more info."
	exit 1
fi
#Check if there are some files with the chosen exention.
if (( $(find ./*.$3 -type f 2> /dev/null | wc -l) == 0 ))
then
	echo "Error. Extension not found."
	echo "Do not use the dot in front of the file extension."
	exit 2
fi

#Here the program check what the first argument is.
#If the first argument a -b then print then print the text in the first line.
if [[ "$1" = "-b" ]]
then
	for i in .
	do
		sed -i "1 i $2" *.$3
		echo "Text added."
		exit 0
	done
#If the first arguent is -e then print the text in the last line.
elif [[ "$1" = "-e" ]]
then
	for i in .
	do
		sed -i "\$a$2" *.$3
		echo "Text added."
		exit 0
	done
#If the first argument is -l then check if the other arguments are accepted.
elif [[ "$1" = "-l" ]]
then
	#Check if the arguments are equal to 4.
	if [[ "$#" -eq 4 ]]
	then
		#Check if the fourth argument is more than 0.
		if [[ "$4" > 0 ]]
		then
			for i in .
			do
				sed -i "$4 i $2" *.$3
				echo "Text added."
				exit 0
			done
		else
			echo "Error. Use a valid line number."
			echo "Try -help for more info."
			exit 3
		fi
	else
		echo "Error. Not enough arguments."
		echo "Try -help for more info."
		exit 4
	fi

else
	echo "Invalid argument. Try -help for more info."
	exit 5
fi
