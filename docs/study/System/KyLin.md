# 麒麟V10

* 新系统添加root用户
  
  * 打开终端，输入以下命令：  
  
  ```shell
  sudo pluma /usr/share/lightdm/lightdm.conf.d/60-kylin.conf
  ```
  
  * 修改文件内容如下
  
  ```shell
  [SeatDefaults]
  
  user-session=mate
  
  allow-guest=false
  
  greeter-show-manual-login=true
  ```
  
  * 设置root密码
  
  ```shell
  sudo passwd root
  ```
  
  * 重启生效
  
  ```shell
  service lightdm restart
  ```

        
