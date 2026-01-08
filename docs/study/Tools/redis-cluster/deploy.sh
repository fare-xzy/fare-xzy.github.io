#!/usr/bin/env bash
set -euo pipefail
HOST_IP="${HOST_IP:-}"
if [ -z "${HOST_IP}" ]; then
  HOST_IP="$(ipconfig getifaddr en0 || ipconfig getifaddr en1 || ipconfig getifaddr en2 || ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | head -n1)"
fi
HOST_IP="${1:-${HOST_IP}}"
HOST_IP="${HOST_IP}"
HOST_IP="${HOST_IP}" docker compose -p redis-cluster-5014 up -d
STATE="$(docker exec redis-7300 redis-cli -h "${HOST_IP}" -p 7300 cluster info | awk -F: '/cluster_state/ {print $2}' | tr -d '\r' | tr -d ' ')"
if [ "${STATE}" != "ok" ]; then
  docker exec -i redis-7300 redis-cli --cluster create \
    "${HOST_IP}:7300" \
    "${HOST_IP}:7301" \
    "${HOST_IP}:7302" \
    "${HOST_IP}:7303" \
    "${HOST_IP}:7304" \
    "${HOST_IP}:7305" \
    --cluster-replicas 1 \
    --cluster-yes
fi
docker exec -i redis-7300 redis-cli -h "${HOST_IP}" -p 7300 ping
docker exec -i redis-7300 redis-cli -h "${HOST_IP}" -p 7300 cluster info
