#!/bin/bash
#set -x
# bashsupport disable=BP5008,BP5008,BP2001
# bashsupport disable=BP5008
# bashsupport disable=BP5008

internet_status="UNKNOWN"
timestamp=$(date +%s)
while true; do
  ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    if [ "$internet_status" != "UP" ]; then
      echo "UP   $(date +%Y-%m-%dT%H:%M:%S%Z) $(($(date +%s) - timestamp))"
      internet_status="UP"
    fi
  else
    if [ "$internet_status" = "UP" ]; then
      echo "DOWN $(date +%Y-%m-%dT%H:%M:%S%Z) $(($(date +%s) - timestamp))"
      internet_status="DOWN"
    fi
  fi
  sleep 1

done
#set +x