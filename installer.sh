#!/bin/bash
 
sudo apt install tasksel
sudo tasksel install lamp-server
echo "What is the email of the beep account for this miner?"
read varname
echo "setting up mining account for " $varname
sudo chmod 0777 /home
sudo echo $varname > /home/beep-email.txt
sudo chmod 0755 /home/beep-email.txt
cd /home/steroid-miner/
sudo git reset --hard
sudo git pull
sudo chmod 0755 *.sh
sudo cp /home/steroid-miner/cron.sh /home
echo "if no errors above this line, installation was successful. Please update crontab"