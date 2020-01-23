#!/bin/bash

########################################################
##### Start Script for start Services at startup  ######
########################################################

set +x
#set -e

# get admin privileges
sudo su

dhclient

echo "Restarting Docker Services"
sudo systemctl stop docker
sleep 30
ystemctl start docker
 
echo "Starting Postgresql"
systemctl restart postgresql
 
 
echo "Restarting neo4j"
systemctl restart neo4j
