nodes = 4
txs = 10

all:  start

start:
	./scripts/create-network.sh
	./scripts/build-conf.sh $(nodes)
	./scripts/build-app.sh $(nodes)
	./scripts/run-testnet.sh $(nodes)
	./scripts/run-app-nodes.sh $(nodes)

stop:
	./scripts/stop-app.sh
	./scripts/stop-testnet.sh
	./scripts/remove-network.sh

restart:
	./scripts/stop-app.sh
	./scripts/stop-testnet.sh
	./scripts/remove-network.sh
	./scripts/create-network.sh
	./scripts/build-conf.sh $(nodes)
	./scripts/build-app.sh $(nodes)
	./scripts/run-testnet.sh $(nodes)
	./scripts/run-app-nodes.sh

watch:
	./scripts/watch.sh $(nodes)

send:
	./scripts/send_tx.sh 

add:
	./scripts/build-node.sh
	./scripts/build-new_app.sh
	./scripts/run-newtest.sh
	./scripts/run-newapp.sh

del:
	./scripts/stop_node.sh

restart_app:
	./scripts/stop-app.sh
	./scripts/build-app.sh $(nodes)
	./scripts/run-app-nodes.sh

.PHONY: all start watch stop restart send add del restart_app 
