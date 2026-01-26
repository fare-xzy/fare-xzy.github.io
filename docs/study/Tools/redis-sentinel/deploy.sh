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

# 生成 sentinel.conf
# 注意：每个sentinel容器内部端口都是26379，但announce-port需要区分
# 为了简化，这里我们生成一个通用的模板，在启动前替换变量
# 但是docker-compose挂载的是同一个文件，所以我们需要为每个sentinel实例准备不同的配置文件，或者使用环境变量替换
# 这里我们采用一种简单的策略：docker-compose中挂载同一个文件，但是sentinel容器启动时会改写该文件
# 更好的做法是：在宿主机生成好针对该HOST_IP的配置文件

# 清理旧的配置
rm -f sentinel.conf

# 生成基础配置
# 注意：sentinel monitor mymaster <ip> <port> <quorum>
# 这里必须使用外部可访问的IP，因为sentinel会把这个IP广播给客户端
sed "s/\${HOST_IP}/${HOST_IP}/g" sentinel.conf.template > sentinel.conf

# 注意：sentinel.conf 在运行过程中会被 redis-sentinel 进程修改
# 为了避免权限问题，确保文件可写
chmod 666 sentinel.conf

echo "Starting Redis Sentinel stack..."
docker compose -p redis-sentinel-5014 up -d

echo "Waiting for services to be ready..."
sleep 5

echo "Checking Redis Master..."
docker exec redis-master redis-cli ping

echo "Checking Sentinel Status..."
docker exec redis-sentinel1 redis-cli -p 26379 sentinel master mymaster

echo "Done! Redis Sentinel Cluster is running."
echo "Master: $HOST_IP:6379"
echo "Slaves: $HOST_IP:6380, $HOST_IP:6381"
echo "Sentinels: $HOST_IP:26379, $HOST_IP:26380, $HOST_IP:26381"
