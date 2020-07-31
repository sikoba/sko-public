#!/bin/bash

set -u

NODE=${1:-1}
COUNT=${2:-2}

for i in `seq 1 $COUNT`; do
    RAND=$((RANDOM % 4 + 1))
    printf "Node$NODE Tx$i" | base64 | \
    xargs printf "{\"method\":\"Babble.SubmitTx\",\"params\":[\"%s\"],\"id\":$i}" | \
    nc -v -w 1 -N 172.77.5.$RAND 1338
    echo "Text sent to node $RAND"
done;
