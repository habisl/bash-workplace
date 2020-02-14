#!/usr/bin/bash
echo "SHELL START: restart_docker_multiple_srv.sh"

ips=$(echo 192.0.1.157 192.0.2.167 192.0.3.87)
for ip in $ips; do
ssh cloud-user@$ip systemctl stop docker;sleep 20;systemctl start docker 
#ssh root@$ip systemctl start neo4j
done

echo "SHELL FINISH: restart_docker_multiple_srv.sh"
