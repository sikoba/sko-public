#!/bin/bash

set -e

docker build -t sikoba_babble docker-babble

N="$(docker ps -a | grep node | wc -l)"
WEBRTC=${2:-false}
DEST=${3:-"$PWD/conf"}
IPBASE=${4:-172.77.5.}
PORT=${5:-1337}


i="$(docker ps -a | grep node | wc -l)"
i=$((i+1))

dest=$DEST/node$i
mkdir -p $dest
echo "Generating key pair for node$i"
docker run  \
    -u $(id -u) \
    -v $dest:/.babble \
    --rm mosaicnetworks/babble:latest keygen
    # --rm sikoba_babble ./babble keygen
echo "$IPBASE$i:$PORT" > $dest/addr

PFILE=$DEST/peers.json
com=","
if [[ $i == $N ]]; then
    com=""
fi
printf "\t{\n" >> $PFILE
if "$WEBRTC"; then
    printf "\t\t\"NetAddr\":\"$(cat $DEST/node$i/key.pub)\",\n" >> $PFILE
else
    printf "\t\t\"NetAddr\":\"$(cat $DEST/node$i/addr)\",\n" >> $PFILE
fi
printf "\t\t\"PubKeyHex\":\"$(cat $DEST/node$i/key.pub)\",\n" >> $PFILE
printf "\t\t\"Moniker\":\"node$i\"\n" >> $PFILE
printf "\t}%s\n"  $com >> $PFILE

echo "]" >> $PFILE

dest=$DEST/node$i
cp $DEST/peers.json $dest/
cp $DEST/peers.json $dest/peers.genesis.json
cp $PWD/cert.pem $dest/cert.pem