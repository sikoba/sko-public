#!/bin/bash

set -eux

N="$(docker ps -a | grep app | wc -l)"
FASTSYNC=${2:-false}
MPWD=$(pwd)


i="$(docker ps -a | grep app | wc -l)"
i=$((i+1))

nohup docker run --net=sikoba_net --name=client$i \
--name="app$i" \
--ip "172.77.0.$i" \
-p "500$i:500$i" \
-e BABBLE_HOST="0.0.0.0" \
-e BABBLE_PORT="500$i" \
simple_app lucky dev &> nohup$i.out &