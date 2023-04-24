# Docker

### 命令

```shell
# 查看所有本地镜像
docker images 
# 拉取镜像到本地
docker pull 镜像名称
# 删除本地镜像
docker image rm 镜像id
docker rmi 镜像id
# 修改镜像名称
docker tag 镜像id 新镜像名称:版本
# 启动容器
docker run 镜像的标识|镜像名称[tag]
# 常见参数
# -d: 代表后台运行容器
# -p: 宿主机端口:容器端口: 为了映射当前Linux的端口和容器的端口
# --name 容器名称: 指定容器的名称
docker run -d -p  宿主机端口:容器端口 --name 容器名称 镜像的标识|镜像名称[tag]
# 查看正在运行的容器
# OPTIONS说明:
# -a: 代表查看全部的容器，包括没有运行
# -q: 只查看容器的标识
# -f: 根据条件过滤显示的内容
# --format: 指定返回值的模板文件
# -l: 显示最近创建的容器
# -n: 列出最近创建的n个容器
# --no-trunc: 不截断输出
# -s: 显示总的文件大小
docker ps [OPTIONS]
## 容器自启动
# 创建容器时
docker run -d --restart=always --name 设置容器名 使用的镜像
（上面命令  --name后面两个参数根据实际情况自行修改）

# Docker 容器的重启策略如下：
 --restart具体参数值详细信息：
       no　　　　　　　 // 默认策略,容器退出时不重启容器；
       on-failure　　  // 在容器非正常退出时（退出状态非0）才重新启动容器；
       on-failure:3    // 在容器非正常退出时重启容器，最多重启3次；
       always　　　　  // 无论退出状态是如何，都重启容器；
       unless-stopped  // 在容器退出时总是重启容器，但是不考虑在 Docker 守护进程启动时就已经停止了的容器。

# 镜像备份
docker save imagename  -o  /home/路径/镜像名.tar
# 还原镜像
docker load --input 镜像名.tar
```