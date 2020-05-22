#!/bin/bash

metrics_dir='/var/lib/ton-metrics'

data=$("${TON_BUILD_DIR}/validator-engine-console/validator-engine-console" -a 127.0.0.1:3030 -k "${KEYS_DIR}/client" -p "${KEYS_DIR}/server.pub" -c "getstats" -c "quit")
unixtime=$(echo $data | grep -oP '(?<=unixtime\s)\d+')
masterchainblocktime=$(echo ${data} | grep -oP '(?<=masterchainblocktime\s)\d+')
echo $((masterchainblocktime-unixtime)) > ${metrics_dir}/sync_time_diff

addr=$(cat "${KEYS_DIR}/${VALIDATOR_NAME}.addr")
data=$(${UTILS_DIR}/tonos-cli account ${addr})
balance=$(echo ${data} | grep -oP '(?<=balance:\s)\d+')
echo ${balance} > ${metrics_dir}/balance
