Windows 常用命令
=

* netstat -ano | findstr 8080 查询端口占用情况  

* taskkill -pid 3168 -f 强制杀掉pid进程

* 一、恢复Win10右键菜单的方法：
  
  1.Win+R运行CMD
  
  2.输入：reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve
  
  3.在任务管理器中，重启资源管理器
  
  二、恢复WIN11右键方法：
  
  1.Win+R运行CMD
  
  2.输入：reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /va /f
  
  3.在任务管理器中，重启资源管理器
