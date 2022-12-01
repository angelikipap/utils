#!/usr/bin/env bash

##What is an ssh tunnel?
    #SSH tunneling, or SSH port forwarding, is a method of transporting arbitrary data over an encrypted SSH connection. 
    #SSH tunnels allow connections made to a local port (that is, to a port on your own desktop) to be forwarded to a remote machine via a secure channel.

#some colors
CYAN="\e[96m"
GREEN="\e[92m"
MAGENTA="\e[95m"
ENDCOLOR="\e[0m"


##Parameters: Update here :)
ssh_host=happy.remote.server
username=angel
local_port=8888
host_port=8888

echo -e "${CYAN} Starting tunnel from local port : " $local_port "${ENDCOLOR}"
echo -e "${GREEN} to host port: " $host_port "${ENDCOLOR}"
echo -e "${MAGENTA} on host: " $ssh_host "${ENDCOLOR}"

ssh -L $local_port:$ssh_host:$host_port $username@$ssh_host