#!/bin/bash
#v1.02.1
wget -q --spider http://google.com
if [ $? -eq 0 ]; then
    echo "Internet connection is active"
else
    echo "No connection. Exiting"
    exit;
fi
sudo chmod 0755 /home/beep-email.txt
beepacct=$(head -n 1 /home/beep-email.txt)
#machineid=$(blkid | grep -oP 'UUID="\K[^"]+' | sha256sum | awk '{print $1}');
#machineid=$(echo $(sudo dmidecode -t 4 | grep ID | sed 's/.*ID://;s/ //g') \
#                 $(ifconfig | grep -oP 'HWaddr \K.*' | sed 's/://g') | sha256sum |
#                       awk '{print $1}');
machineid=$(echo $(cat /etc/machine-id));
url='https://www.beepxtra.com/steroid-miner.php?miner='$machineid'&beeper='$beepacct;
minerupd=$(curl -s "$url");
newversion=$(echo $minerupd | egrep -m 1 '"version"' | awk -F '"' '{ print $4}')
cmd=$(echo $minerupd | egrep -m 1 '"cmd"' | awk -F '"' '{ print $8}')

cd /home/steroid-miner/
currentversion=$(cat 'version.txt')
update=$((newversion-currentversion))
#echo $update
#exit;

if [ "$update" -gt 0 ]
then
        echo "Upgrade necessary"
        #eval $cmd
        sudo git reset --hard
        sudo git pull
        echo $cmd | /bin/bash
        #sudo echo $newversion > 'version.txt'
        echo "Current version: "$newversion
        sudo chmod 0755 *.sh
else
        echo "No upgrade necessary."
        echo "Current version: "$currentversion
fi

#echo $newversion
#echo $cmd
exit;
