# CentOS 7 中影响 TCP 请求的 `sysctl` 参数及其解释：

1. `net.ipv4.tcp_syncookies`
- 解释：开启 SYN cookie，防止 SYN Flood 攻击。
- 默认值：0
- 推荐值：1
2. `net.ipv4.tcp_fin_timeout`
- 解释：指定在 TCP 连接断开后，等待多少时间后关闭连接。主要是为了确保在连接中的数据都被传输完毕。
- 默认值：60
- 推荐值：30
3. `net.ipv4.tcp_tw_reuse`
- 解释：允许将 TIME_WAIT 状态的连接用于新的连接请求，从而避免连接过多导致无法连接。
- 默认值：0
- 推荐值：1
4. `net.ipv4.tcp_tw_recycle`
- 解释：开启 TIME_WAIT 的快速回收模式，将 TIME_WAIT 的连接复用。
- 默认值：0
- 推荐值：0，该参数在某些情况下会导致连接不可用。
5. `net.ipv4.tcp_max_syn_backlog`
- 解释：指定 SYN 接收队列的最大长度，即未完成的连接请求的最大数量。
- 默认值：1024
- 推荐值：2048
6. `net.core.somaxconn`
- 解释：指定套接字的最大等待队列长度，用于处理连接请求。
- 默认值：128
- 推荐值：2048
7. `net.ipv4.tcp_keepalive_time`
- 解释：指定 TCP 连接上 keepalive 的最长时间，如果超过该时间则会关闭连接。
- 默认值：7200
- 推荐值：300
8. `net.ipv4.tcp_keepalive_intvl`
- 解释：指定 TCP 连接上 keepalive 探测的时间间隔。
- 默认值：75
- 推荐值：30
9. `net.ipv4.tcp_keepalive_probes`
- 解释：指定 TCP 连接上 keepalive 探测的次数。
- 默认值：9
- 推荐值：3
10. `net.ipv4.tcp_rmem`
- 解释：指定 TCP 接收缓冲区大小。
- 默认值：4096 87380 4194304
- 推荐值：4096 87380 6291456
11. `net.ipv4.tcp_wmem`
- 解释：指定 TCP 发送缓冲区大小。
- 默认值：4096 16384 4194304
- 推荐值：4096 16384 4194304
12. `net.ipv4.tcp_max_tw_buckets`
- 解释：指定系统最多保留多少个 TIME_WAIT 状态的连接。
- 默认值：262144
- 推荐值：65536
13. `net.ipv4.tcp_synack_retries`
- 解释：指定 TCP 握手建立连接的 SYN-ACK 尝试次数。
- 默认值：5
- 推荐值：3
14. `net.ipv4.tcp_syn_retries`
- 解释：指定 TCP 握手建立连接的 SYN 尝试次数。
- 默认值：6
- 推荐值：3
15. `net.ipv4.tcp_max_orphans`
- 解释：指定系统最多同时维护多少个无父进程的 TCP 连接。
- 默认值：32768
- 推荐值：16384
16. `net.ipv4.tcp_abort_on_overflow`
- 解释：开启该参数后，当 TCP 队列溢出时，直接抛弃该连接。
- 默认值：0
- 推荐值：1
17. `net.ipv4.tcp_tw_buckets`
- 解释：指定系统最多同时维护多少个 TIME_WAIT 状态的连接。
- 默认值：262144
- 推荐值：65536
18. `net.ipv4.tcp_mtu_probing`
- 解释：开启路径 MTU 探测机制，用于发现网络的最大传输单元（MTU）。
- 默认值：0
- 推荐值：1
19. `net.ipv4.tcp_no_metrics_save`
- 解释：禁止内核自动保存 TCP 数据传输指标。
- 默认值：0
- 推荐值：1
20. `net.ipv4.tcp_slow_start_after_idle`
- 解释：开启此参数后，TCP 在长时间空闲后重启连接时，将进入慢启动阶段。
- 默认值：1
- 推荐值：0
21. `net.ipv4.tcp_fastopen`
- 解释：开启 TCP Fast Open，允许在握手阶段传输数据，提高连接建立速度。
- 默认值：0
- 推荐值：3
22. `net.ipv4.tcp_rfc1337`
- 解释：开启 RFC 1337 防范技术，拒绝不规范的 TCP 包。
- 默认值：0
- 推荐值：1

这些是常见的影响 TCP 请求的 `sysctl` 参数，其他可能会影响 TCP 请求的参数包括：

1. `net.core.somaxconn`：指定系统监听队列的最大长度。
2. `net.core.netdev_max_backlog`：指定每个网络设备接收数据包的队列最大长度。
3. `net.ipv4.tcp_keepalive_time`：指定 TCP 连接闲置时间达到一定时间后，内核会发送 Keepalive 探测包的时间间隔。
4. `net.ipv4.tcp_keepalive_intvl`：指定 TCP Keepalive 探测包发送间隔时间。
5. `net.ipv4.tcp_keepalive_probes`：指定 TCP Keepalive 探测包发送的次数。
6. `net.ipv4.tcp_fin_timeout`：指定连接中断后，内核在释放资源前等待的时间。

# OpenEuler22.03-LTS-SP1中影响 TCP 请求的 `sysctl` 参数及其解释

1. `kernel.sched_min_granularity_ns`：这个参数控制任务切换的最小时间间隔。您可以尝试减小该值，以提高线程的响应性。例如，将其设置为较小的值如 1000000（1毫秒）。

2. `kernel.sched_wakeup_granularity_ns`：这个参数控制任务从睡眠状态唤醒的时间间隔。较小的值可以提高任务唤醒的精度。您可以尝试减小该值，例如将其设置为 1000000（1毫秒）。

3. `kernel.sched_latency_ns`：这个参数控制任务切换的延迟时间。较小的值可以提高任务的响应速度。您可以尝试减小该值，例如将其设置为 2000000（2毫秒）。
