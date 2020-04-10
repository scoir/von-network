#!/bin/bash

set -e

HOST="${HOST:-0.0.0.0}"
NODE_NUM="${1}"
SEED="${2}"

if [ ! -d "/home/indy/ledger/sandbox/keys" ]; then
    echo "Ledger does not exist - Creating... $SEED"
    cat /etc/nymble/topology.json
    init_indy_node "Node""$NODE_NUM" 0.0.0.0 9701 0.0.0.0 9702 "$(echo "$SEED" | head -c 32)" > /tmp/indy_node_init.log
    new_node_setup --topology /etc/nymble/topology.json --clients 0 > /tmp/new_node_setup.log
fi

echo start_indy_node "Node""$NODE_NUM" 0.0.0.0 9701 0.0.0.0 9702
start_indy_node "Node""$NODE_NUM" 0.0.0.0 9701 0.0.0.0 9702
#sleep 100000