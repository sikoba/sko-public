#!/bin/bash

set -e

N="$(docker ps -a | grep app | wc -l)"
WEBRTC=${2:-false}
DEST=${3:-"$PWD/conf"}
IPBASE=${4:-0.0.0.}
PORT=${5:-5000}

docker build -t simple_app docker-app