#!/bin/bash
myfilesize=$(wc -c "/home/steroid-miner/update.sh" | awk '{print $1}')
#printf "%d\n" $myfilesize
#echo "$myfilesize"
if [ $myfilesize -gt 1 ]
then
         /home/steroid-miner/update.sh
else
         echo 'file is nulled - Running recovery routine'
         cd /home/steroid-miner/
         sudo git reset --hard
         sudo git pull
         sudo chmod 0755 *.sh
fi
