#!/bin/bash

ARG_ARRAY="$@"
DIR1=''
DIR2=''
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
   elif [ -z $DIR1 ]
   then
   	DIR1=$ARG
   elif [ -z $DIR2 ]
   then
   	DIR2=$ARG
   fi
done

# DIR 1 -> SRC
# DIR 2 -> DEST

if [[ $FLAGS == 'a' || $FLAGS == 'A' ]]
then 
	echo "rsync -a $DIR1 $DIR2" >> "$PWD/backup_config.sh"        
elif [[ $FLAGS == 'r' || $FLAGS == 'R' ]]
then
	DIR_TO_REMOVE=$DIR1
	sed -i "$DIR_TO_REMOVE/d" "$PWD/backup_config.sh"
elif [[ $FLAGS == 'l' || $FLAGS == 'L' ]]
then
	cat "$PWD/backup_config.sh" | grep -v bin | sed 's/rsync -a//'
elif [[ -n $FLAG ]]
then
	echo "Available Flags are -a and -r"
fi
   	
   
	




