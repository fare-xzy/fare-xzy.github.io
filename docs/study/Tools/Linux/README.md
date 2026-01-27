# openEuler Docker 一键安装脚本

* 目标
  * 在 openEuler 22.03 SP3 系统上快速安装 Docker CE，并自动配置阿里云镜像源与用户权限

* 标签
  * 工具, Linux, openEuler, Docker, Shell

* 环境要求
  * 操作系统：openEuler 22.03 SP3 (兼容 CentOS 8 生态)
  * 权限：需要 sudo 权限的用户

* 目录与文件
  * install_docker_openeuler.sh
[filename](/study/Tools/Linux/install_docker_openeuler.sh ':include :type=code :lang=bash')

* 使用步骤
  * 切换目录
    ```bash
    cd docs/study/Tools/Linux
    ```
  * 赋予执行权限
    ```bash
    chmod +x install_docker_openeuler.sh
    ```
  * 执行安装
    ```bash
    ./install_docker_openeuler.sh
    ```

* 验证安装
  * 检查版本
    ```bash
    docker --version
    ```
  * 运行测试容器
    ```bash
    docker run hello-world
    ```

* 功能说明
  * 自动清理旧版本 Docker
  * 配置阿里云 CentOS 8 镜像源适配 openEuler
  * 安装 Docker CE、CLI 及 Compose 插件
  * 配置 Docker 开机自启
  * 将当前用户加入 `docker` 用户组（免 sudo）
  * 配置阿里云镜像加速器

* 常见问题
  * 执行后仍提示 `permission denied`
    * 用户组变更需要重新登录才能生效。请尝试执行 `newgrp docker` 或重新登录 SSH 会话。
  * 镜像源连接超时
    * 脚本默认使用阿里云源，如网络环境特殊，请手动修改脚本中的 `baseurl`。
