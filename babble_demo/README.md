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

## Development

To start an independent app process running, use the following command:
``` docker run -it --name="app_dev" \
    -v "$(pwd)"/docker-app/simple_server:/app
    -p "500$i:500$i" \
    -e BABBLE_HOST="0.0.0.0" \
    -e BABBLE_PORT="500$i" \
    simple_app bash ```

To run tests independently of the main runtime setup, please use the Spec module of Crystal. 
Some examples are already written there.
To run tests, use the ```crystal spec``` command.

## Adding a node

To add a new node, run ```make add```

## Deleting a node

To delete a node, run ```make del```