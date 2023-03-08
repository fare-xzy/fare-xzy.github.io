# Redis

* 部署包：链接：https://pan.baidu.com/s/1DNInGkxETUIWBI_aTPnzxQ   提取码：xyav
* 主从集群搭建修改redis.conf文件以下内容
    ```
    bind 127.0.0.1  #根据本机IP实际修改
    logfile  ""  # 自定义log日志输出位置
    port 17000  # 端口
    dir "" #数据路径
    requirepass     # 密码
    slaveof 192.168.61.11 7000  # 从机配置 ip地址为主机配置的ip地址
    启动：src/redis-server ./redis.conf
    redis-cli -h host -p port -a password	
    ```

* Redis-Cluster搭建
    

