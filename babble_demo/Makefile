nodes = 4
txs = 10

all:  start

start:
	./scripts/create-network.sh
	./scripts/build-conf.sh $(nodes)
	./scripts/build-app.sh $(nodes)
	./scripts/run-testnet.sh $(nodes)
	./scripts/run-app-nodes.sh

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

restart_app:
	./scripts/stop-app.sh
	./scripts/build-app.sh $(nodes)
	./scripts/run-app-nodes.sh

# .PHONY :  all build_babble  start watch stop 
