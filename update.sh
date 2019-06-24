#!/bin/bash
#v1.02.22

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
