#! /bin/bash

#This command list the total number of letters, numbers and non-alphanumeric characters.

#Made by Salvatore Tarantino, u1860830. u1860830

if [ "$1" = "-help" ] || [ "$1" = "-h" ]
then
	echo "This command shows the number of letters, numbers and non-alphanumeric characters that you digit in screen."
	echo "Print ! for close the command."
	exit 0
fi

echo "Press ! to stop."
#Use the variable STRING for store the text from the user.
STRING="$@"
#Use a loop for keep the program run until the ! simble is type.
while true
do
	if [ $(echo $STRING | grep -o "!" | wc -l) -gt 0 ]
	then
		break
	else
		read text
		STRING="$text$STRING"
	fi
done
#In the follow 3 part the program grep from STRING the letters, numbers and non-alphanumeric characters.
echo "The count of the letters is: "
echo $STRING | grep -o [a-zA-Z] | wc -l

echo "The count of the numbers is: "
echo $STRING | grep -o [0-9] | wc -l

echo "The count of non-alphanumeric characters is: "
echo $STRING | grep -o [^a-zA-Z0-9] | wc -l
exit 0
