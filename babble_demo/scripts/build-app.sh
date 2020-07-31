#!/bin/bash

#echo "$NODES"
#NODES=${1:-4}
##FOR LOOPS IN BASH ==> `SEQ FINAL_VALUE` TO DO THE SAME AS REAL FOR
##ELSE I = VALUE
#for i in `seq $NODES`;
#do
#    dest=nodes$i
#    mkdir $dest
#    docker run \
#        -u $(id -u) \
#        -v $dest
#done;

##############
## WORK IN PROGRESS 
##############
set -e

N=${1:-4}
WEBRTC=${2:-false}
DEST=${3:-"$PWD/conf"}
IPBASE=${4:-0.0.0.}
PORT=${5:-5000}

docker build -t simple_app docker-app

# for i in $(seq 1 $N)
# do
#     dest=$DEST/node$i
#     mkdir -p $dest
#     echo "Generating key pair for node$i"
#     docker run  \
#         -u $(id -u) \
#         -v $dest:/.babble \
#         --rm mosaicnetworks/babble:latest keygen 
#     echo "$IPBASE$i:$PORT" > $dest/addr
# done

# PFILE=$DEST/peers.json
# echo "[" > $PFILE
# for i in $(seq 1 $N)
# do
#     com=","
#     if [[ $i == $N ]]; then
#         com=""
#     fi

#     printf "\t{\n" >> $PFILE
#     if "$WEBRTC"; then
#         printf "\t\t\"NetAddr\":\"$(cat $DEST/node$i/key.pub)\",\n" >> $PFILE
#     else
#         printf "\t\t\"NetAddr\":\"$(cat $DEST/node$i/addr)\",\n" >> $PFILE
#     fi
#     printf "\t\t\"PubKeyHex\":\"$(cat $DEST/node$i/key.pub)\",\n" >> $PFILE
#     printf "\t\t\"Moniker\":\"node$i\"\n" >> $PFILE
#     printf "\t}%s\n"  $com >> $PFILE

# done
# echo "]" >> $PFILE

# for i in $(seq 1 $N)
# do
#     dest=$DEST/node$i
#     cp $DEST/peers.json $dest/
#     cp $DEST/peers.json $dest/peers.genesis.json
#     cp $PWD/cert.pem $dest/cert.pem
# done


