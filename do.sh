#!/bin/bash

data=$("${TON_BUILD_DIR}/validator-engine-console/validator-engine-console" -a 127.0.0.1:3030 -k "${KEYS_DIR}/client" -p "${KEYS_DIR}/server.pub" -c "getstats" -c "quit")
unixtime=$(echo $data | grep -oP '(?<=unixtime\s)\d+')
masterchainblocktime=$(echo $data | grep -oP '(?<=masterchainblocktime\s)\d+')
echo $((masterchainblocktime-unixtime)) > /var/lib/ton-metrics/sync_time_diff
