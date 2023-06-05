# Linux 相关命令

## 防火墙相关

### centos6.5

```shell
# 指定网卡屏蔽ip访问
sudo iptables -A INPUT -i eth1 -s 124.226.208.23 -j DROP
# 解封指定ip
sudo iptables -D INPUT -i eth1 -s 192.168.228.36 -j DROP
# 永久生效
sudo iptables-save > /etc/sysconfig/iptables
```

## 查看当前操作系统连接数

```shell
cat /proc/net/sockstat
```

#### 解释说明

在Linux系统中，`/proc/net/sockstat`文件提供了关于网络套接字（socket）的统计信息。以下是一些常见字段的含义：

1. sockets：当前打开的套接字数量。
2. TCP：TCP套接字的统计信息。
   - inuse：当前正在使用的TCP套接字数量。
   - orphan：处于等待连接状态的TCP套接字数量。
   - tw：处于 TIME_WAIT 状态的TCP套接字数量。
   - alloc：已分配但未连接的TCP套接字数量。
   - memory：TCP套接字使用的内存。
3. UDP：UDP套接字的统计信息。
   - inuse：当前正在使用的UDP套接字数量。
   - mem：UDP套接字使用的内存。
4. UDPLITE：UDPLITE（轻量级UDP）套接字的统计信息。
   - inuse：当前正在使用的UDPLITE套接字数量。
   - mem：UDPLITE套接字使用的内存。
5. RAW：RAW套接字的统计信息。
   - inuse：当前正在使用的RAW套接字数量。
   - mem：RAW套接字使用的内存。
6. FRAG：IP分片套接字的统计信息。
   - inuse：当前正在使用的IP分片套接字数量。
   - memory：IP分片套接字使用的内存。

这些字段提供了关于系统中不同类型套接字的数量和内存使用情况的信息。通过查看这些统计数据，可以了解系统当前套接字的状态和使用情况。

请注意，字段名称和含义可能会因不同的Linux发行版和内核版本而有所差异。以上是一些常见的字段和其一般含义，具体的内容可能会有所变化。
