MySQL
=

* MySQL 8.0 用户密码加密方式变更为 caching_sha2_password   mkRDQyGve2QDaYlV
* linux下数据库导出
  * mysql -u -p 登陆mysql   
  * mysqldump -u用户 -p 数据库名 > （目录）导出文件名
  * ./mysqldump -u root -p  tdmmdb  --hex-blob >  tdmmdb.sql
  * alter table `user_movement_log` Add column GatewayId int not null default 0 AFTER `Regionid`; 添加字段
  * create table c select * from users; 复制表结构以及数据
  * mysqldump -u userName -p  dabaseName tableName > fileName.sql 
     导出数据库表数据
  * mysql 导入数据 mysql -u userName -p  dabaseName tableName < fileName.sql 
* 显示mysql 服务连接数 show processlist; 
* 截断表 truncate
* SELECT * FROM bo_businesslog WHERE find_in_set('11010800009928',sealnum) AND FIND_IN_SET("11001100015292",sealnum) 碰上字段中有俩内容例如：  1,2
* mysql中 "%_%" 代表任意字符，如果需要使用下划线作为like 查询条件。则需要对字符进行转义"%\_%"
* 