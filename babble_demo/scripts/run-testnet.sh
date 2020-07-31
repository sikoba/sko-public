#!/bin/bash

set -eux

N=${1:-4}
FASTSYNC=${2:-false}
WEBRTC=${3:-false}
MPWD=$(pwd)


for i in $(seq 1 $N)
do
    docker create --name=node$i --net=sikoba_net --ip=172.77.5.$i mosaicnetworks/babble:latest run \
    --heartbeat=100ms \
    --moniker="node$i" \
    --cache-size=50000 \
    --listen="172.77.5.$i:1337" \
    --proxy-listen="172.77.5.$i:1338" \
    --client-connect="172.77.0.$i:500$i"\
    --service-listen="172.77.5.$i:80" \
    --sync-limit=100 \
    --fast-sync=$FASTSYNC \
    --log="debug" \
    --webrtc=$WEBRTC \
    --signal-addr="172.77.15.1:2443"

    # --store \
    # --bootstrap \
    # --suspend-limit=100 \
    
    
    docker cp $MPWD/conf/node$i node$i:/.babble
    docker start node$i
done
