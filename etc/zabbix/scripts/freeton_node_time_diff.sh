#!/bin/bash

engineConsole=${1}/validator-engine-console/validator-engine-console
keyDir=${2}

if ! test -f "$engineConsole"; then
  echo "Console \"$engineConsole\" not available"
  exit 1
fi

if [ ! -d "$keyDir" ]; then
  echo "Key folder \"$keyDir\" not available"
  exit 1
fi

data=$( "$engineConsole" -a 127.0.0.1:3030 -k "$keyDir/client" -p "$keyDir/server.pub" -c "getstats" -c "quit" )

unixtime=$(echo $data | grep -oP '(?<=unixtime\s)\d+')
masterchainblocktime=$(echo $data | grep -oP '(?<=masterchainblocktime\s)\d+')
time_diff=$((masterchainblocktime-unixtime))

echo $time_diff

exit 0
