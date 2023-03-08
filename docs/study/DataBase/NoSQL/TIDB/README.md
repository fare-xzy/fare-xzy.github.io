TIDB
=
* TIDB集群分为三个部分
  * TiDB Server 负责接收 SQL 请求，处理 SQL 相关的逻辑，并通过 PD 找到存储计算所需数据的 TiKV 地址，与 TiKV 交
    互获取数据，最终返回结果。 TiDB Server 是无状态的，其本身并不存储数据，只负责计算，可以无限水平扩
    展，可以通过负载均衡组件（如 LVS、 HAProxy 或 F5）对外提供统一的接入地址。
  * PD Server 是整个集群的管理模块  其主要工作有三个：
    * 一是存储集群的元信息（某个 Key 存储在哪个 TiKV 节点）；
    * 二是对 TiKV 集群进行调度和负载均衡（如数据的迁移、 Raft group leader 的迁移等）；
    * 三是分配全局唯一且递增的事务 ID。
    * PD 是一个集群，需要部署奇数个节点，一般线上推荐至少部署 3 个节点
  * TiKV Server负责存储数据 
    * 从外部看 TiKV 是一个分布式的提供事务的 Key-Value 存储引擎。存储数据的基本单位
      是 Region，每个 Region 负责存储一个 Key Range （从 StartKey 到 EndKey 的左闭右开区间）的数据，每个 TiKV 节点
      16会负责多个 Region 。 TiKV 使用 Raft 协议做复制，保持数据的一致性和容灾。副本以 Region 为单位进行管理，不
      同节点上的多个 Region 构成一个 Raft Group，互为副本。数据在多个 TiKV 之间的负载均衡由 PD 调度，这里也
      是以 Region 为单位进行调度。
* 特性
  * 水平扩展计算能力和存储能力
    * TiDB Server 负责处理 SQL 请求，随着业务的增长，可以简单的添加 TiDB Server 节点，提高整体的处理能力，提供更高的吞吐
    * TiKV 负责存储数据，随着数据量的增长，可以部署更多的 TiKV Server 节点解决数据 Scale 的问题
    * PD 会在 TiKV 节点之间以 Region 为单位做调度，将部分数据迁移到新加的节点上‘
  * 高可用
    * TiDB 
      * 当单个实例失效时，会影响正在这个实例上进行的 Session，从应用的角度看，会出现单次请求失败的情况，重新连接后即可继续获得服务。
      * 单个实例失效后，可以重启这个实例或者部署一个新的实例
    * PD
      * 单个实例失效时，如果这个实例不是 Raft 的 leader，那么服务完全不受影响；
      * 如果这个实例是 Raft 的 leader，会重新选出新的 Raft leader，自动恢复服务。 
      * PD在选举的过程中无法对外提供服务，这个时间大约是 3 秒钟。
      * 推荐至少部署三个 PD 实例，单个实例失效后，重启这个实例或者添加新的实例
    * TIKV
      * 单个节点失效时，会影响这个节点上存储的所有 Region。
        * 对于 Region 中的 Leader 节点，会中断服务，等待重新选举；
        * 对于 Region 中的 Follower 节点，不会影响服务。
      * 当某个 TiKV 节点失效，并且在一段时间内（默认 30 分钟）无法恢复， PD 会将其上的数据迁移到其他的 TiKV 节点上
* 部署
  * 单机
    * wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
    * [root@KVM_2 ~]# tar -xf tidb-latest-linux-amd64.tar.gz 
    * [root@KVM_2 ~]# cd tidb-latest-linux-amd64/
    * [root@KVM_2 tidb-latest-linux-amd64]# 
    * [root@KVM_2 tidb-latest-linux-amd64]# mkdir /data/tidb/{data,log} -p
    * [root@KVM_2 tidb-latest-linux-amd64]# mkdir /data/tidb/data/{pd,tikv} -p
    * [root@KVM_2 tidb-latest-linux-amd64]# ./bin/pd-server --data-dir=/data/tidb/data/pd --log-file=/data/tidb/log/pd.log &
    * [root@KVM_2 tidb-latest-linux-amd64]# ./bin/tikv-server --pd="127.0.0.1:2379" --data-dir=/data/tidb/data/tikv --log-file=/data/tidb/log/tikv.log &
    * [root@KVM_2 tidb-latest-linux-amd64]# ./bin/tidb-server --store=tikv --path="127.0.0.1:2379" --log-file=/data/tidb/log/tidb.log &

  * 集群
    * wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
    * tar -xf tidb-latest-linux-amd64.tar.gz -C /usr/local/
    * mkdir /data/tidb/{data,log} -p
    * 开启服务（注：集群的启动顺序不能错）
        * 在node1开启PD
        ```
        /usr/local/tidb-latest-linux-amd64/bin/pd-server --name=pd1   \
        --data-dir=/data/tidb/data    --client-urls="http://192.168.137.29:2379"  \
        --peer-urls="http://192.168.137.29:2380"  --initial-cluster="pd1=http://192.168.137.29:2380"   \
        --log-file=/data/tidb/log/pd.log &
        ```

        * 在node2 node3 node4 上开启 TiKV
        ```
        [root@node2 ~]# /usr/local/tidb-latest-linux-amd64/bin/tikv-server --pd="192.168.137.29:2379"  --addr="192.168.137.122:20160" --data-dir=/data/tidb/data --log-file=/data/tidb/log/tikv.log & 
        [root@node3 ~]# /usr/local/tidb-latest-linux-amd64/bin/tikv-server --pd="192.168.137.29:2379"  --addr="192.168.137.128:20160" --data-dir=/data/tidb/data --log-file=/data/tidb/log/tikv.log &
        [root@node4 ~]# /usr/local/tidb-latest-linux-amd64/bin/tikv-server --pd="192.168.137.29:2379"  --addr="192.168.137.67:20160" --data-dir=/data/tidb/data --log-file=/data/tidb/log/tikv.log &
        ```

        * 在node1 中开启TiDB
        ```
        /usr/local/tidb-latest-linux-amd64/bin/tidb-server --store=tikv --path="192.168.137.29:2379" --log-file=/data/tidb/log/tidb.log &

        ```
        * 安装mysql 客户端 yum install -y mariadb 
        * 连接数据库mysql -u root -h 127.0.0.1 -P 4000