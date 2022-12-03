#!/usr/bin/env bash

# Place this script under a directory with git repos and execute it in order to update all repos in the directory
# Credits to Github Alexandros Mertzianis (GitHub Account:alexmertzianis) for the initial script

#some colors
RED="\e[91m"
GREEN="\e[92m"
ENDCOLOR="\e[0m"


projects=$(ls)

for project in ${projects[@]};do
    cd $project
    echo -n "$project : "
    git rev-parse --abbrev-ref HEAD
    echo "Pulling latest........ "
    git pull
    [[ $? == 0 ]] && echo -e "${GREEN} OK $fromDir ${ENDCOLOR}" || echo -e "${RED} ERROR: $fromDir ${ENDCOLOR}"
    cd ..
    echo "-------------------------------------------------------------------------------------------------"
done
