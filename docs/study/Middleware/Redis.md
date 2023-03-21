# Redis

## 安装部署

### 单机

```shell
# 前提包含gcc环境以及root权限
tar -zxvf redis*.tar.gz
cd redis*
make
make install
# 启动
redis-server *./redis.config 
```

### 主从

```shell
# 安装步骤和单机一样，需要在从机进行配置
vim redis.config
```

## 配置

### 常用配置

#### 单机

```apacheconf
# 限制连入ip
bind * -::*
# 端口
port 6379
# 数据库编号
databases 0
# 密码
requirepass 111111
```

#### 主从

```apacheconf
##从机配置文件，主机配置文件不动
# 限制连入ip
bind * -::*
# 端口
port 6379
# 数据库编号
databases 0
# 密码
requirepass 111111
# 主机ip端口
slaveof 192.168.71.17 6379
```
