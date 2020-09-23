#!/bin/bash

N="$(docker ps -a | grep app | wc -l)"

docker rm $(docker stop $(docker ps -a -q -f name=app$N))

docker ps -f name=client -f name=node$N -f name=watcher -f name=signal -aq | xargs docker rm -f 
rm -rf conf/node$N