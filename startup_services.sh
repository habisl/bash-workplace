#!/bin/bash

########################################################
##### Start Script for starting Required Services   ########
########################################################

set +x
#set -e

#echo "Update hostname" > tee /var/log/startup_services.out
#sudo hostnamectl set-hostname "webbell.com"
#
#echo "Update new IP" | tee -a /var/log/startup_services.out
#existing_ip=$(cat /etc/hosts | grep "webbell.com" | awk '{print $1}')
#current_ip=$(hostname -I | sed 's/127.0.0.1//g' | awk '{print $1}')
#
#echo "Existing IP: $existing_ip" | tee -a /var/log/startup_services.out
#echo "Current IP: $current_ip" | tee -a /var/log/startup_services.out
#
#sed -i s"/$existing_ip/$current_ip/g" /etc/neo4j/neo4j.conf
#sed -i s"/$existing_ip/$current_ip/g" /etc/hosts
#
#find /cloud/remote-user/ -type f -exec sed -i "s/$existing_ip/$current_ip/g" {} \;
#
## get admin privileges
#sudo su
#dhclient
#

echo "Restarting Docker Services" | tee -a /var/log/startup_services.out
sudo systemctl stop docker
sleep 30
systemctl start docker

echo "Starting Postgresql" | tee -a /var/log/startup_services.out
systemctl restart postgresql
sleep 10

echo "Restarting neo4j" | tee -a /var/log/startup_services.out
systemctl restart neo4j
