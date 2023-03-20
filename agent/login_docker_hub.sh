#! /bin/bash

docker_hub_login="docker login -u your_username -p your_password"

# Login for VMs
sudo $docker_hub_login

# Login for invokers
invoker_id=`sudo docker ps --filter "name=invoker" | grep -v "CONTAINER" | grep -v "HealthTest" | awk '{print $1}'`

for id in $invoker_id
do
    sudo docker exec $id $docker_hub_login
done
