#!/usr/bin/env bash

#some colors
CYAN="\e[96m"
GREEN="\e[92m"
MAGENTA="\e[95m"
ENDCOLOR="\e[0m"


##Parameters: Update here :)
fromDir=/home/user
toDir=/tmp
username=angel
environment=happy.prod

echo -e "${CYAN} Start copying from: " $fromDir "${ENDCOLOR}"
echo -e "${GREEN} on evn: " $environment "${ENDCOLOR}"
echo -e "${MAGENTA} under: " $toDir "${ENDCOLOR}"

scp -r $fromDir $username@$environment:$toDir