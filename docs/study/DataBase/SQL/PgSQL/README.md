Postgresql
=

- 导入导出命令

```shell
# 导出命令
./pg_dump -U postgres  anysigndb > anysigndb.sql

# 导入命令
./psql -U postgres -f anysigndb.sql anysigndb
```
