#!/usr/bin/env bash

## Utility script to secure copy files from local to remote env via ssh
## You can update the parameters inline or use flags
## Example with flags: ./secureCopy.sh -f /home/angel -t /temp/files -u angel -e happy.prod
## To execute without flags just update inline the parameters and run

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

##Use flags if you prefer

while getopts 'f:t:u:e:' OPTION; do
  case "$OPTION" in
    f)
      fromDir="$OPTARG"
      ;;
    t)
      toDir="$OPTARG"
      ;;
    u)
      username="$OPTARG"
      ;;
    e)
      environment="$OPTARG"
      ;;      
    ?)
      echo "script usage: secureCopy.sh [-f somevalue] [-t somevalue] [-u somevalue] [-e somevalue]"
      exit 1
      ;;
  esac
done

echo -e "${CYAN} Start copying from: $fromDir ${ENDCOLOR}"
echo -e "${GREEN} on evn: $username@$environment ${ENDCOLOR}"
echo -e "${MAGENTA} under: $toDir ${ENDCOLOR}"

scp -r $fromDir $username@$environment:$toDir