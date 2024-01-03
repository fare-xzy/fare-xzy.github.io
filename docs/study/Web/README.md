# WEB

### 准备

- 安装nvm

- [nvm](https://github.com/coreybutler/nvm-windows)

- 注意
  
  - 安装路径不可以有特殊字符以及空格
  
  - 本机不能包含其他已经安装node
* 命令

```bash
nvm list [available]
nvm use <version>
nvm install <version>
```

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
npm install -g yarn
```

### 常用命令

| npm/cnpm             | yarn             | 描述                 |
| -------------------- | ---------------- | ------------------ |
| npm/cnpm install     | yarn             | 安装依赖               |
| npm/cnpm init        | yarn init        | 创建 package.json 文件 |
| npm/cnpm cache clean | yarn cache clean | 清理缓存目录             |
| npm/cnpm update      | yarn upgrade     | 更新包                |
