#! /bin/bash

#This command create or delete a directory with random text file inside it.
#A quick way for create a directory with file .txt where you can test your program in a safa space.

#Made by Salvatore Tarantino, u1860830. u1860830@hud.ac.uk

filecount=0

#The command check if the command have the argument.
if [ "$#" -lt 1 ]
then
	echo "Need one argument. Use -h for help."
	echo "Try -m for create the directory or -d for delete the directory."
	exit 1
fi

#If the argument is -m the command make the directory, move into the directory and make the random files.
if [[ "$1" = "-m" ]] || [[ "$1" = "-make" ]]
then

	#If the arguments are 2 the second argument will be the name of the directory.
	if [[ "$#" -eq 2 ]]
	then
		if [[ -d "$2" ]]
		then
			echo "A directory with this name alredy exist."
			echo "Plese chose a different name."
			exit 2
		else
			mkdir "$2"
			cd ./"$2"
		fi
	#If the argument is only one call the directory testDir.
	elif [[ ! -d testDir ]]
	then
		mkdir testDir
		cd ./testDir
	else
		echo "A directory called "testDir" alredy exist."
		echo "Please chose a name."
		exit 3
	fi
	#This loop make the random file until the count of the variable filecount is equal to 10.
	while [ $filecount -lt 10 ]
	do
		filesize=$(($filesize+128))
		#Funny command that print some random character in a file.
		base64 /dev/urandom |
		head -c "$filesize" > ./file${filecount}.txt
		echo -e "\n" >> ./file${filecount}.txt
		((filecount++))
	done
	echo "Directory created."
	exit 0

#If the argument is -d the command delete the directory.
elif [[ "$1" = "-d" ]] || [[ "$1" = "-delete" ]]
then
	#If there are 2 argument the comman will see for a directory with that name and delete it.
	if [[ -e "$2" ]]
	then
		rm -rf "$2"
		echo "Directory "$2" deleted."
		exit 0
	#If there are only 1 argument the command will see for the directory testDir.
	elif [[ -e testDir ]]
	then
		rm -rf ./testDir
		echo "Directory testDir deleted."
		exit 0
	#If the command do not find anything give an error.
	else
		echo "Specifies the name of the directory to delete."
		exit 4
	fi

#If the argument is -h or -help the command print on screen some help info for the user.
elif [[ "$1" = "-h" ]] || [[ "$1" = "-help" ]]
then
	echo "Use -m or -make for create a random directory with random file inside it."
	echo "Use -m + "name" for create the diretory "name" with random file inside it."
	echo "Use -d or -delete for delete the directory testDir."
	echo "Use -d + "name" for delete the directory "name". Be care, this action is irreversible."
	exit 0
else
	echo "Error. Wrong argument."
	echo "Use -h or -help for more info."
	exit 5
fi
