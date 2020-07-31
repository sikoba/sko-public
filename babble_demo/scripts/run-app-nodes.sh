#!/bin/bash


##############
## WORK IN PROGRESS 
##############

set -eux

N=${1:-4}
FASTSYNC=${2:-false}
MPWD=$(pwd)

for i in $(seq 1 $N)
do
    nohup docker run --net=sikoba_net --name=client$i \
    --name="app$i" \
    --ip "172.77.0.$i" \
    -p "500$i:500$i" \
    -e BABBLE_HOST="0.0.0.0" \
    -e BABBLE_PORT="500$i" \
    simple_app lucky dev &> nohup$i.out &
done