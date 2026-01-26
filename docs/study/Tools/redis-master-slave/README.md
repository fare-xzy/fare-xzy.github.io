# Redis Master-Slave 本地部署说明

* 目标
  * 在本机快速启动 Redis 主从架构（1 主 2 从），并完成主从复制关系验证

* 标签
  * 工具, Redis, Master-Slave, Docker

* 环境要求
  * macOS 或 Linux
  * Docker 与 Docker Compose（v2，命令为 docker compose）
  * 端口未占用：6479（Master），6480–6481（Slaves）

* 目录与文件
  * deploy.sh

[filename](deploy.sh ':include :type=code :lang=bash')
  * docker-compose.yml

[filename](docker-compose.yml ':include :type=code :lang=yaml')

* 使用步骤
  * 切换目录
    ```bash
    cd docs/study/Tools/redis-master-slave
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
    * 脚本会自动启动容器并输出 Master 和 Slaves 的地址信息

* 验证健康
  * 查看容器
    ```bash
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep redis-ms
    ```
  * 查看主从复制状态
    ```bash
    # 进入 Master 节点查看信息
    docker exec redis-ms-master redis-cli info replication
    ```
    * 预期输出中应包含 `role:master` 和 `connected_slaves:2`

* 停止与清理
  * 使用项目名关闭并清理数据卷
    ```bash
    docker compose -p redis-ms-5014 down -v
    ```

* 常见问题
  * 无法连接从节点
    * 检查 `HOST_IP` 是否正确注入，从节点启动依赖 `replica-announce-ip` 向主节点汇报自己的可访问地址
  * 端口占用
    * 默认占用 6479-6481 端口，如冲突请修改 `docker-compose.yml`

* 说明
  * 镜像版本：redis:5.0.14
  * 架构：1 Master + 2 Slaves
  * 端口映射：Master -> 6479, Slave1 -> 6480, Slave2 -> 6481
