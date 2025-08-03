Postgresql
=

- 导入导出命令

```shell
# 导出命令
./pg_dump -U postgres  anysigndb > anysigndb.sql

# 导入命令
./psql -U postgres -f anysigndb.sql anysigndb
```

* 配置文件postgresql.conf

| 参数                               | 默认值           | 说明                    |
| -------------------------------- | ------------- | --------------------- |
| `listen_addresses`               | `'localhost'` | 监听地址，`'*'` 允许所有IP     |
| `port`                           | `5432`        | 数据库服务端口               |
| `max_connections`                | `100`         | **最大客户端连接数**（需结合资源调整） |
| `superuser_reserved_connections` | `3`           | 为超级用户保留的连接数           |
