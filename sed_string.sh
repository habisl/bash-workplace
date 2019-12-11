#!/bin/bash
set -e

# This is a workaround script to update the inventory.  
echo "SHELL START: update-PG-inventory.sh"
mkdir -p _backup_hosts_file
cp all-hosts.yml _backup_hosts_file

sed -i 's/.*lo_loadbalancer.*//' all-hosts.yml
sed -i 's/.*app1_servers.*//' all-hosts.yml
sed -i 's/.*app2_servers.*//' all-hosts.yml
sed -i 's/.*app2_servers.*//' all-hosts.yml


cat all-hosts.yml


echo "SHELL START: update-PG-inventory.sh"
