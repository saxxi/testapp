#!/bin/bash
./docker_stop.sh
docker images | grep testapp2 | awk '{print $3}' | xargs docker rmi

