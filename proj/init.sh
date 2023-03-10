#!/bin/bash
echo ""
echo ""
echo "                ░█████╗░██████╗░░██████╗"
echo "                ██╔══██╗██╔══██╗██╔════╝"
echo "                ███████║██████╦╝╚█████╗░"
echo "                ██╔══██║██╔══██╗░╚═══██╗"
echo "                ██║░░██║██████╦╝██████╔╝"
echo "                ╚═╝░░╚═╝╚═════╝░╚═════╝░"
echo ""
echo ""
echo "   Welcome to Automatic backup Setup v1.0.0 that helps you to set up your automatic backup tasks."
echo "	 Please wait until we setup Automatic Backup System for you....";
echo -ne '>>>                       [3%]\r'
crontab -l > crontab_new
sleep 2
echo -ne '>>>>>>>                   [13%]\r'
sleep 1
echo -ne '>>>>>>>                   [17%]\r'
sleep 1
echo -ne '>>>>>>>>                  [19%]\r'
# some task
echo "*/1 * * * * $PWD/backup_config.sh" >> crontab_new
crontab crontab_new
sleep 1
echo -ne '>>>>>>>>>>>>              [40%]\r'
# some task
rm crontab_new
sleep 1
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [89%]\r'
# some task
FILE_PATH="$PWD/backup_config.sh"
chmod +x "$FILE_PATH" 
sleep 2
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
sleep 1
echo -ne '\n'
