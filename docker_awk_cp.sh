#!/bin/bash
docker cp /home/cloud-user/init-mongo-replication.js $(docker ps | grep mongo | head -1 | awk '{print $1}'):init-mongo-replication.js
