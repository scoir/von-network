#!/bin/bash

set -e

if [ ! -f "/home/indy/ledger/sandbox/pool_transactions_genesis" ] && [ -z "${GENESIS_URL}" ] && [ -z "${GENESIS_FILE}" ]; then
  echo "Ledger does not exist - Creating genesis data..."
    new_node_setup --topology /etc/nymble/topology.json --node_num 1 --clients 0 > /tmp/new_node_setup.log
fi

# link node ledgers where webserver can find them
#for node in 1 2 3 4; do
#    ln -sfn /home/indy/.mnt/node${node}/sandbox/data/Node${node} \
#            /home/indy/ledger/sandbox/data/node${node}
#done

echo "starting server"
python -m server.server
