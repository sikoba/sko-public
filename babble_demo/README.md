# sko-babble

## Before running
The app needs to have its dependencies installed. This is how this is done:
1. ```docker build -t simple_app docker-app```
2. ```docker run -it -v "$(pwd)"/docker-app/simple_server:/app simple_app shards install```

## Running the setup

To start the setup, run ```make``` or ```make start```.

To stop the whole setup once running, run ```make stop```.

To work at a finer granularity, i.e. start/stop the app/babble nodes individually, use the individual scripts in the scripts/ folder.

## Sending transactions

To submit a transaction to Babble, run ```make send```.

## Verifying outputs

To check the output(block data as received from Babble) in the app, check the nohup{n}.out files. Each app node's output will be written in a file.
