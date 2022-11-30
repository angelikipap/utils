#!/usr/bin/env bash

# Place this script under a directory with git repos and execute it in order to update all repos in the directory
# Credits to Github Alexandros Mertzianis (GitHub Account:alexmertzianis)

projects=$(ls)

for project in ${projects[@]};do
    cd $project
    echo -n "$project : "
    git rev-parse --abbrev-ref HEAD
    echo "Pulling latest........ "
    git pull
    [[ $? == 0 ]] && echo "OK" || echo "ERROR"
    cd ..
    echo "-------------------------------------------------------------------------------------------------"
done
