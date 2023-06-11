Docker
=
* 安装docker
    * yum install epel-release –y
    * yum clean all
    * yum list
    * yum install docker-io –y
    * systemctl start docker
    * docker info
    * systemctl start docker     运行Docker守护进程
    * systemctl stop docker      停止Docker守护进程
    * systemctl restart docker   重启Docker守护进程
    * 更改源 /etc/docker/daemon.json
            *  "registry-mirrors": ["https://w939z4cz.mirror.aliyuncs.com"]
        * systemctl daemon-reload
        * systemctl restart docker
* 搜索镜像 docker search [name]
* 下载镜像 docker pull [name][version]
* 检查所有运行的镜像 docker ps
* 查看详细信息 docker inspect
* 查看已下载的镜像
    * docker images 查看所有
    * docker images |grep [name] 查看某个镜像
* 删除镜像 
    * docker rmi [imageID]
* 创建容器 docker create [name]
  * --name 自定义名称
  * --net 自定义网络环境
  * --ip 自定义IP
  * -e 自定义时区dcoker 
* 停止容器 docker stop containerId 
* 删除容器 docker rm [container ID]
* 查看所有容器 docker ps -a
* 查看所有容器 ID docker ps -a -q
* 停止所有容器 docker stop $(docker ps -a -q)
* 移除所有容器 docker  rm $(docker ps -a -q)
* 启动容器 docker run --name=[mysql] -it -p [3306:3306] -e MYSQL_ROOT_PASSWORD=[emc123123] -d mysql   该种方式为直接从镜像创建容器同时启动容器
* 进入容器控制台 docker exec -it [container id] /bin/bash
* docker 创建centos ：docker run -e TZ="Asia/Shanghai" --privileged -itd -h hadoop01.com --name hadoop01 --network=mynet --ip 172.18.12.1 centos 
/usr/sbin/init
* docker创建网卡 docker network create redis-net
* 查询指定网卡信息  docker network inspect redis-net
* 更新端口映射：
    1. docker ps -a查看所有容器
    2. docker inspect <容器id>   |  grep Id 查看容器hash
    3. docker stop <容器id>
    4. vim /var/lib/docker/containers/[容器hash]/hostconfig.json
        * 如果之前没有端口映射, 应该有这样的一段:
        * "PortBindings":{}
        * 增加一个映射, 这样写:
        * "PortBindings":{"3306/tcp":[{"HostIp":"","HostPort":"3307"}]}
    5. systemctl restart docker
    6. 启动容器
