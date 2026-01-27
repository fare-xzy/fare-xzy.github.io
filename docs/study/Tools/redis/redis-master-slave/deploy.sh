#!/usr/bin/env bash
set -e

# 获取本机 IP（优先获取 en0/en1，或者第一个非 127.0.0.1 的 IP）
if [ -z "$1" ]; then
    HOST_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || ipconfig getifaddr en2 2>/dev/null || ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -n1)
else
    HOST_IP=$1
fi

if [ -z "$HOST_IP" ]; then
    echo "Error: Could not determine HOST_IP. Please provide it as an argument."
    echo "Usage: ./deploy.sh [HOST_IP]"
    exit 1
fi

echo "Using HOST_IP: $HOST_IP"
export HOST_IP

echo "Starting Redis Master-Slave stack..."
docker compose -p redis-ms-5014 up -d

echo "Waiting for services to be ready..."
sleep 5

echo "Checking Redis Master Replication Info..."
docker exec redis-ms-master redis-cli info replication

echo "Done! Redis Master-Slave Cluster is running."
echo "Master: $HOST_IP:6479"
echo "Slaves: $HOST_IP:6480, $HOST_IP:6481"
