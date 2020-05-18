#!/bin/bash

METRIC="$1"
PATH="/var/lib/ton-metrics/$METRIC"

if ! test -f "$PATH"; then
  echo "Metric \"$PATH\" not available"
  exit 1
fi

/bin/cat $PATH

exit 0
