#!/bin/bash
#v1.02.2
LANG=en_GB.UTF-8
XDG_VTRN=1
XVD_SESSION_ID=c1
HUSHLOGIN=FALSE
USER=pi
PWD=/home/pi
HOME=/home/pi
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
SHELL=/bin/bash
TERM=linux
SHLVL=1
XDG_SEAT=seat0
LOGNAME=pi
XDG_RUNTIME_DIR=/run/user/1000

url='https://www.beepxtra.com/steroid-miner.json'
newversion=$(
        curl -s "$url" | egrep -m 1 '"version"' | awk -F '"' '{ print $4 }'
)
cmd=$(
        curl -s "$url" | egrep -m 1 '"cmd"' | awk -F '"' '{ print $4 }'
)
currentversion=$(cat 'version.txt')
update=$((newversion-currentversion))
#echo $update
#exit;

if [ "$update" -gt 0 ]
then
        echo "Upgrade necessary"
        eval echo $cmd
        #echo $cmd | /bin/sh
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
