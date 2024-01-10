# slowhttptest

## 说明

```
HTTP Post慢速DoS攻击第一次在技术社区被正式披露是2012年的OWASP大会上（https://owasp.org/www-pdf-archive/Layer_7_DDOS.pdf），由Wong Onn Chee 和 Tom Brennan共同演示了使用这一技术攻击的威力，Slow HTTP Denial of Service Attack 中文叫作缓慢的HTTP攻击漏洞，服务器在接收到请求时，彻底接收之后才会处理请求，若是攻击者发送的比较缓慢或者发送的不完整，服务器会保留其链接，占用资源池，若是请求数量较多，就会造成 DDOS 攻击。利用的HTTP POST的时候，指定一个非常大的content-length，然后以很低的速度发包，比如10-100s发一个字节，hold住这个连接不断开。这样当客户端连接多了后，占用住了webserver的所有可用连接，从而导致DDOS。
```

## 验证工具

> [shekyan/slowhttptest: Application Layer DoS attack simulator (github.com)](https://github.com/shekyan/slowhttptest)



### 使用docker

```shell
#拉取官方最新版本
docker pull shekyan/slowhttptest:latest
#启动测试
docker run -i -t shekyan/slowhttptest -c 400 -H -i 10 -r 200 -t GET -u https://10.0.12.6:9443/ -x 24 -p 3 -l 200
#重要参数说明  -c 400 -H -i 10 -r 200 -t GET -u https://10.0.12.6:9443/ -x 24 -p 3 -l 200
-u 要验证的地址，https://10.0.12.6:9443/ 如果在本机验证，因为是docker环境动不要使用localhost，请使用主机的ip地址
-c 400:总连接数
-H: slowloris模式
-i 10:发送数据间的间隔10s
-r 200: 200个连接每秒-t GET:使用GET请求-u url
-x 24:发送的最大数据长度24
-p 3∶等待3秒来确定DoS攻击是否成功
-l 200:测试持续时间
```

### 结果说明

测试结束后 connected数量较多，closed数量很少或为0，说明之前建立的400个慢速攻击测试连接没有被关闭，存在漏洞

1. 测试发起的连接较少，不能以“service available”参数作为依据。
2. 若结果为“Exit status: No open connections left”，则不存在漏洞


