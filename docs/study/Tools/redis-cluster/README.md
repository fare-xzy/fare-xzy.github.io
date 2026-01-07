Redis Cluster 本地部署说明
=

* 目标
  * 在本机快速启动 6 节点 Redis Cluster（3 主 3 从），并完成健康校验与基础连接验证

* 标签
  * 工具, Redis, Cluster, Docker

* 环境要求
  * macOS 或 Linux
  * Docker 与 Docker Compose（v2，命令为 docker compose）
  * 端口未占用：7300–7305 以及 17300–17305

* 目录与文件
  * [deploy.sh](/study/Tools/redis-cluster/deploy.sh ':include :type=code :lang=bash')
  * [docker-compose.yml](/study/Tools/redis-cluster/docker-compose.yml ':include :type=code :lang=yaml')

* 使用步骤
  * 切换目录
    ```bash
    cd docs/study/Tools/redis-cluster
    ```
  * 选择主机 IP（可选）
    * 脚本会自动探测本机 IP；如需指定，传入第一个参数或预先设置环境变量
    ```bash
    # 自动探测（推荐）
    bash deploy.sh
    # 或显式指定
    bash deploy.sh 192.168.x.x
    # 或使用环境变量
    HOST_IP=192.168.x.x bash deploy.sh
    ```
  * 完成初始化
    * 脚本会检查 cluster_state；若非 ok，则自动执行集群创建（--cluster-replicas 1）

* 验证健康
  * 查看容器
    ```bash
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep redis-73
    ```
  * 集群信息与节点列表
    ```bash
    # 替换为你的主机 IP
    HOST_IP=192.168.x.x
    docker exec -it redis-7300 redis-cli -h "${HOST_IP}" -p 7300 cluster info
    docker exec -it redis-7300 redis-cli -h "${HOST_IP}" -p 7300 cluster nodes
    ```
  * 基本连接
    ```bash
    redis-cli -h 192.168.x.x -p 7300 ping
    ```

* 停止与清理
  * 使用项目名关闭并清理数据卷（与脚本保持一致）
    ```bash
    docker compose -p redis-cluster-5014 down -v
    ```

* 常见问题
  * 集群状态非 ok 或节点无法互联
    * docker-compose.yml 已使用变量 ${HOST_IP}，确保启动时环境包含 HOST_IP（deploy.sh 已自动注入）
    * 如需手动启动，可在当前目录执行 HOST_IP=你的IP docker compose up -d
  * Mac 上自动探测 IP 异常
    * 可通过 ipconfig getifaddr en0 或 en1 获取；必要时手动传参给 deploy.sh
  * 端口被占用
    * 关闭占用进程或在 docker-compose.yml 中调整映射端口范围
  * 命令不可用
    * 使用 docker compose（而非 docker-compose），并确认 Docker 已安装

* 说明
  * 镜像版本：redis:5.0.14
  * 节点端口：服务端口 7300–7305；集群总线端口 17300–17305
  * 保护模式：示例中为 --protected-mode no，便于本地开发联通
