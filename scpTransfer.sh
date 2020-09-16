#!/bin/bash

SOURCE="~/vim/shellscripting/lab3"
DESTINATION="~/datanettverk/lab3"
HOST="bjorn@10.0.0.12"


if [ "$(ls -A *)" ]; then
     
     COUNT="0"	
     for FILE in *; 
     do
	     scp $FILE $HOST":"$DESTINATION
	     if [ "$?" -eq "0" ]; then
		     echo $FILE "transfered successfully"
		     echo $FILE "removed from client"
		     rm $FILE
		     ((COUNT=$COUNT+1))
	     fi
     done
     echo "A total of $COUNT file(s) where transfered succsessfully"
else
    echo "$SOURCE is Empty"
fi
