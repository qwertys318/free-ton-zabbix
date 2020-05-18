#!/bin/bash

engineConsole=${1}/validator-engine-console/validator-engine-console
client=${2}/client
pub=${2}/server.pub

if ! test -f "$engineConsole"; then
  echo "Console \"$engineConsole\" not available"
  exit 1
fi

if ! test -f "$pub"; then
  echo "Key \"$pub\" not available"
  exit 1
fi

if ! test -f "$client"; then
  echo "Client \"$client\" not available"
  exit 1
fi

data=$( "$engineConsole" -a 127.0.0.1:3030 -k "$client" -p "$pub" -c "getstats" -c "quit" )

unixtime=$(echo $data | grep -oP '(?<=unixtime\s)\d+')
masterchainblocktime=$(echo $data | grep -oP '(?<=masterchainblocktime\s)\d+')
time_diff=$((masterchainblocktime-unixtime))

echo $time_diff

exit 0
