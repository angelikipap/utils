#!/usr/bin/env bash

##What is an ssh tunnel?
    #SSH tunneling, or SSH port forwarding, is a method of transporting arbitrary data over an encrypted SSH connection. 
    #SSH tunnels allow connections made to a local port (that is, to a port on your own desktop) to be forwarded to a remote machine via a secure channel.

## How to execute:
    # Example with flags: ./sshTunnel.sh -p [local_port] -r [remote:port]  -u [username] -h [remote_host]
    # To execute without flags just update inline the parameters and run    

#some colors
CYAN="\e[96m"
GREEN="\e[92m"
MAGENTA="\e[95m"
ENDCOLOR="\e[0m"


##Parameters: Update here :)
local_port=8888
host_port=8888
ssh_host=happy.remote.server
username=angel

##Use flags if you prefer

while getopts 'p:r:u:h:' OPTION; do
  case "$OPTION" in
    p)
      local_port="$OPTARG"
      ;;
    r)
      host_port="$OPTARG"
      ;;
    u)
      username="$OPTARG"
      ;;
    h)
      ssh_host="$OPTARG"
      ;;      
    ?)
      echo "script usage: "
      exit 1
      ;;
  esac
done

echo -e "${CYAN} Starting tunnel from local port : $local_port ${ENDCOLOR}"
echo -e "${GREEN} to host port:  $host_port ${ENDCOLOR}"
echo -e "${MAGENTA} on host:  $username@$ssh_host ${ENDCOLOR}"

ssh -L $local_port:$ssh_host:$host_port $username@$ssh_host
