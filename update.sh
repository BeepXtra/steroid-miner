#!/bin/bash
url='https://www.beepxtra.com/steroid-miner.json'
newversion=$(
        curl -s "$url" | egrep -m 1 '"version"' | awk -F '"' '{ print $4 }'
)
cmd=$(
        curl -s "$url" | egrep -m 1 '"cmd"' | awk -F '"' '{ print $4 }'
)
currentversion=$(cat 'version.txt')

echo $newversion > 'version.txt'
#echo $newversion
#echo $cmd
exit;
