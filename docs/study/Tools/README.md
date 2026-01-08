工具笔记
=

* 记录规范
  * 使用 Markdown 记录
  * 每条知识点需包含 标签 与 解决方法
  * 可配图时放在 doc/pic 目录，采用 SVG 并在正文引用

* 常用工具总览
  * Git、VS Code、Homebrew、Node.js、Python、Docker

* 问题：在 macOS 快速安装基础开发工具
  * 标签：工具, macOS, Homebrew
  * 解决方法：
    * 安装 Homebrew
      ```bash
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew -v
      ```
    * 安装 Git
      ```bash
      brew install git
      git --version
      ```
    * 安装 Node.js 与 pnpm
      ```bash
      brew install node
      corepack enable && corepack prepare pnpm@latest --activate
      node -v && npm -v && pnpm -v
      ```
    * 安装 Python
      ```bash
      brew install python
      python3 --version
      ```
    * 安装 Docker Desktop
      * 从官网下载安装包并按提示安装

* 问题：Git 快速初始化与常用配置
  * 标签：Git, 版本控制, 工具
  * 解决方法：
    * 基本配置
      ```bash
      git config --global user.name "Your Name"
      git config --global user.email "you@example.com"
      git config --global init.defaultBranch main
      git config --global pull.rebase false
      git config --global core.editor "code --wait"
      git config --list
      ```
    * 初始化与常用命令
      ```bash
      git init
      git status
      git add .
      git commit -m "init"
      git log --oneline --graph --decorate -n 10
      git branch -M main
      git remote add origin https://github.com/xxx/xxx.git
      git push -u origin main
      ```

* 问题：VS Code 常用设置与插件
  * 标签：VSCode, 编辑器, 工具
  * 解决方法：
    * 设置建议
      * 保存时格式化、统一缩进、显示空格可见
    * 插件推荐
      * Chinese (Simplified) Language Pack
      * ESLint
      * Prettier
      * GitLens
      * Markdown All in One
    * 快捷安装示例
      ```bash
      code --install-extension dbaeumer.vscode-eslint
      code --install-extension esbenp.prettier-vscode
      ```

* 配图示例
  * 工具选型关系图
    * 引用：![tools-overview](../../../doc/pic/tools-overview.svg)

