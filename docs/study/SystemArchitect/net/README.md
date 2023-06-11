## 网络(计算机网络知识（TCP连接，TCP/UDP区别，HTTP与HTTPS，Socket原理等等）)

1. 网络七层协议包含，物理层、数据链路层、网络层（ip协议）、传输层（TCP传输控制协议、UDP用户数据报协议）、会话层、表示层、应用层（http协议）。是一个提供的概念架构协议。

## 网络连接中的半连接和已完成连接

> `半连接`：服务端收到客户端`syn`后,将连接放入半连接队列。如果半连接队列已满会丢弃，客户端报错`connection time out`
>
> `已完成连接`：服务端收到客户端的`ack`后，从半连接队列中拿出连接放入已完成连接队列。如果已完成连接队列已经满则无法放入，客户端报错`read timeout` 或者 `connection reset by peer`
>
> `syn:`SYN是TCP/IP建立连接时使用的握手信号。在客户机和服务器之间建立正常的TCP网络连接时，客户机首先发出一个SYN消息，服务器使用SYN+ACK应答表示接收到了这个消息，最后客户机再以ACK消息响应。这样在客户机和服务器之间才能建立起可靠的TCP连接，数据才可以在客户机和服务器之间传递
>
> `ack:`在TCP报文段中，字段ACK=1时，确认号字段才有效。TCP规定，在连接建立后所有传送的报文段都必须把ACK置1

## JDK和TLS协议的版本关系

![](https://img-blog.csdnimg.cn/20181226233209538.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01lbG9fRmVuZ1poaQ==,size_16,color_FFFFFF,t_70)

###### TCP
