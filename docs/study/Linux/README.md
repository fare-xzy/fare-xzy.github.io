# Linux 相关命令

## 内存使用情况

```shell
free -m
```

### 解释说明

在Linux系统中，`free -m` 命令用于显示系统内存的使用情况，以兆字节（MB）为单位。以下是输出结果中各字段的含义：

1. total：系统总的物理内存大小。
2. used：已使用的内存大小。
3. free：完全未使用的内存大小。
4. shared：多个进程共享的内存大小。
5. buff/cache：
   - buff（缓冲区）：主要用于存放要写入磁盘的数据。
   - cache（缓存）：主要用于存放从磁盘读取的数据。
6. available：可供进程使用的内存大小。
   - 这个值包括free内存加上可回收的缓存/缓冲区内存。
   - 它比free值更能真实反映系统可用内存的大小。

**注意事项：**
- buff/cache占用的内存在系统需要时是可以被回收的。
- available的值通常大于free的值，因为它包含了可以被回收的buff/cache内存。
- 如果available值过低，系统可能会开始使用交换空间（swap），这会导致系统性能下降。

### Swap（交换空间）说明

在`free -m`命令的输出中，Swap相关字段的含义：

1. Swap total：系统配置的交换空间总大小。
2. Swap used：已经使用的交换空间大小。
3. Swap free：剩余可用的交换空间大小。

**Swap的作用和特点：**
- Swap是磁盘上的一块区域，用作虚拟内存的扩展。
- 当物理内存不足时，系统会将不常用的内存页面移到Swap空间。
- Swap的读写速度远低于物理内存，过度使用会显著降低系统性能。

**使用建议：**
- 通常建议在物理内存充足的情况下，尽量避免使用Swap空间。
- 如果Swap使用率持续较高，建议增加物理内存。
- 服务器性能调优时，可以通过调整swappiness参数来控制系统对Swap的使用倾向。

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
