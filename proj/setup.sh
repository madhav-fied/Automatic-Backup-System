#!/bin/bash

while [ 0 -le 1 ]
do
    echo -n "abs > "
    read -r COMMAND
    COMMAND=($COMMAND)
    if [ ${COMMAND[0]} == 'setup' ] 
    then
        DIRECTORY=${COMMAND[1]}
        BACKUP_DIRECTORY=${COMMAND[2]}
        echo "exec rsync -a ${COMMAND[1]}/ ${COMMAND[2]}/" >> backup_config.sh
    elif [ ${COMMAND[0]} == 'rm' ]
    then 
       read 
    elif [ ${COMMAND[0]} == 'exit' ]
    then 
       break
    else 
        echo "Error, For the list of commands kindly help command"  
    fi
done
