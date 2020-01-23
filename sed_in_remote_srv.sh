#!/usr/bin/bash

# modifying the files in the remote machines 

ips=$(echo 172.5.0.1 172.7.0.2 172.7.0.3)
for ip in $ips; do
ssh root@$ip sed -i 's/dbms.memory.pagecache.size=5G/dbms.memory.pagecache.size=1G/g' /etc/neo4j/neo4j.conf
ssh root@$ip systemctl restart neo4j
done

