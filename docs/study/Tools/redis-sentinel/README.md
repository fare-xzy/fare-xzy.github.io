# Redis Sentinel 本地部署说明

* 目标
  * 在本机快速启动 Redis 哨兵架构（1 主 2 从 3 哨兵），并验证故障转移能力

* 标签
  * 工具, Redis, Sentinel, Docker

* 环境要求
  * macOS 或 Linux
  * Docker 与 Docker Compose（v2，命令为 docker compose）
  * 端口未占用：6379–6381（数据节点），26379–26381（哨兵节点）

* 目录与文件
  * deploy.sh

[filename](deploy.sh ':include :type=code :lang=bash')
  * docker-compose.yml

[filename](docker-compose.yml ':include :type=code :lang=yaml')
  * sentinel.conf.template

[filename](sentinel.conf.template ':include :type=code :lang=nginx')

* 使用步骤
  * 切换目录
    ```bash
    cd docs/study/Tools/redis-sentinel
    ```
  * 选择主机 IP（可选）
    * 脚本会自动探测本机 IP；如需指定，传入第一个参数
    ```bash
    # 自动探测（推荐）
    bash deploy.sh
    # 或显式指定
    bash deploy.sh 192.168.x.x
    ```
  * 完成初始化
    * 脚本会自动生成 `sentinel.conf`，启动容器，并输出集群节点信息

* 验证健康
  * 查看容器
    ```bash
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep redis
    ```
  * 查看哨兵监控状态
    ```bash
    # 连接任意哨兵节点查看 master 信息
    docker exec redis-sentinel1 redis-cli -p 26379 sentinel master mymaster
    ```
    * 预期输出中 `num-slaves` 应为 2，`num-other-sentinels` 应为 2

* 停止与清理
  * 使用项目名关闭并清理数据卷
    ```bash
    docker compose -p redis-sentinel-5014 down -v
    ```
  * 清理生成的配置文件
    ```bash
    rm -f sentinel.conf
    ```

* 常见问题
  * 哨兵无法发现从节点或其他哨兵
    * 核心在于 `sentinel monitor` 配置中的 IP 必须是容器间和外部都能访问的 IP（即 `HOST_IP`），脚本已自动处理此配置
  * 权限问题
    * 哨兵启动后会改写 `sentinel.conf`，脚本已执行 `chmod 666` 确保容器内有权写入

* 说明
  * 镜像版本：redis:5.0.14
  * 架构：1 Master + 2 Slaves + 3 Sentinels
  * 端口映射：
    * Master: 6379, Slaves: 6380-6381
    * Sentinels: 26379-26381
