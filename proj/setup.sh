#!/bin/bash


ARG_ARRAY="$@"
SRC=''
DEST=''
REGEX="-([a-zA-Z])"


for ARG in ${ARG_ARRAY}
do
   if [[ $ARG == "setup" ]]
   then
   	 ./init.sh
   	 echo "Backups planned are listed :";
   	 cat "$PWD/backup_config.sh";	
   	 exit
   elif [[ $ARG =~ $REGEX ]]
   then
   	FLAGS=${BASH_REMATCH[1]}
   elif [ -z $SRC ]
   then
   	src=$arg
   elif [ -z $DEST ]
   then
   	DEST=$ARG
   fi
done


if [[ $FLAGS == 'a' || $FLAGS == 'A' ]]
then 
	echo "rsync -a $SRC $DEST" >> "$PWD/backup_config.sh"        
elif [[ $FLAGS == 'r' || $FLAGS == 'R' ]]
then
	echo ' '
elif [[ -n $FLAG ]]
then
	echo "Available Flags are -a and -r"
fi
   	
   
	




