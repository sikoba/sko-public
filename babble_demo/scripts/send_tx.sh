#!/bin/bash

set -u

types=("SendConnection" "CreateCreditLine" "MakePayment")
senders=("Alice" "Bob" "Charlie")
targets=("Oscar" "Romeo" "Sierra")
public_key="BHelfyIcJfiVU84vHphkCRQcTtQZo7XU5RTsMTb9YtzK2HuzU5aRAKjOJ3YFXEKvOEpLegPaiDLMY8MbINBSO7E=" # placeholder
signature="QCmv8W5gNhxOBrCq0na05u42qthwezAjEm6Q/QGD1YxFJaZ36Vv0wEEsrlYK/483tVQ0IeXqBM87VqYolnoifg==" # placeholder

# selects a type, sender and target at random from the arrays above
selectedType=${types[$RANDOM%${#types[@]}]}
selectedSender=${senders[$RANDOM%${#senders[@]}]}
selectedTarget=${targets[$RANDOM%${#targets[@]}]}

# builds the transaction string # TODO figure out of escaping quotes is necessary
tx="{type:\"${selectedType}\",details:{sender:\"${selectedSender}\",target:\"${selectedTarget}\"},public_key:\"${public_key}\",signature:\"${signature}\"}"

NODE=${1:-1}
COUNT=${2:-2}

for i in `seq 1 $COUNT`; do
    RAND=$((RANDOM % 4 + 1))

    printf "${tx}" | base64 -w 0 | \
    xargs printf "{\"method\":\"Babble.SubmitTx\",\"params\":[\"%s\"],\"id\":$i}" | \
    nc -v -w 1 -N 172.77.5.$RAND 1338

    echo "Text sent to node $RAND"
done;