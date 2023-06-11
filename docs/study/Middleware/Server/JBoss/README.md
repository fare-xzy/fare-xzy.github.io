JBoss 相关语句
=
* Jboss环境变量配置
```$xslt
JBOSS_HOME=/usr/local/jboss-as-7.1.1.Final
PATH=$PATH:$JBOSS_HOME/bin
CLASSPATH=.:$CLASSPATH:$JBOSS_HOME/lib
export JBOSS_HOME PATH CLASSPATH
``` 
* JBoss 启动方式
```$xslt
 ./run.sh -b 本机IP
-bIP制定绑定IP
-call制定启动模式all，default，minimal
-s关闭服务
```
* JBoss 后台启动  
```$xslt
 ./run.sh -b
```
* JBoss默认只允许本机访问，若要从任何地方都可以访问，需要修改配置文件中JBoss的监听地址
    * JBoss 5.1 需要修改jboss.home/server/default/deploy/jbossweb.sar/server.xml
    * 修改前
```$xslt
address="${jboss.bind.address}"
```
* 修改后
   
```$xslt
<Connector protocol="HTTP/1.1" port="8080" address="0.0.0.0" 
               connectionTimeout="20000" redirectPort="8443" />
```
* 修改完成后重启JBOSS即可。
* 原理就是告诉JBOSS任何IP地址都可访问该服务器，准确的说应该是连接器。