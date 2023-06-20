#!/bin/sh

MAX_RETRIES=3

while true; do
  for i in $(seq 1 $MAX_RETRIES); do
    echo "Downloading config file..."
    curl -s -o /root/.config/clash/config.yaml $CONFIG_URL && break || sleep 10
  done

  if [ ! -f /root/.config/clash/config.yaml ]; then
    echo "Failed to download config file, retrying in 60s..."
    sleep 60
    continue
  fi

  echo "Restarting Clash..."
  killall clash
  /clash &

  sleep $UPDATE_INTERVAL
done
