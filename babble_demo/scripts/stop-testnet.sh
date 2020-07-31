#!/bin/bash

docker ps -f name=client -f name=node -f name=watcher -f name=signal -aq | xargs docker rm -f 
rm -rf conf/
