#!/bin/sh

set -eou pipefail

if [ "$DISABLE_P2P_SYNC" == "false" ]; then
    taiko-client driver \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l2.auth http://l3_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS} \
        --taikoL2 ${TAIKO_L2_ADDRESS} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret \
        --p2p.syncVerifiedBlocks \
        --p2p.checkPointSyncUrl https://rpc.l3test.taiko.xyz \
        --p2p.syncTimeout "5000"
else
    taiko-client driver \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l2.auth http://l3_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS} \
        --taikoL2 ${TAIKO_L2_ADDRESS} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret
fi
