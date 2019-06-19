#!/bin/bash
url='https://www.beepxtra.com/steroid-miner.json'
#Get latest version
newversion=$(
        curl -s "$url" | egrep -m 1 '"version"' | awk -F '"' '{ print $4 }'
)
#get upgrade command
cmd=$(
        curl -s "$url" | egrep -m 1 '"cmd"' | awk -F '"' '{ print $4 }'
)
#current installed version
currentversion=$(cat 'version.txt')

#Check and execute upgrade if new version
if($newversion > $currentversion){
        eval $cmd
        echo $newversion > 'version.txt'
}

exit;
