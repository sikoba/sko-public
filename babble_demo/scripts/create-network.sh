#!/bin/bash

set -eux

N=${1:-4}
FASTSYNC=${2:-false}
WEBRTC=${3:-false}
MPWD=$(pwd)

docker network create \
  --driver=bridge \
  --subnet=172.77.0.0/16 \
  --ip-range=172.77.0.0/16 \
  --gateway=172.77.5.254 \
    sikoba_net