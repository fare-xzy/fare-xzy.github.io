# Git 推送失败（无法 push 到 GitHub）

现象：在当前网络或系统环境中执行 `git push` 到 GitHub 失败，可能报错超时、认证失败、权限不足或大文件导致推送中断。

## 常见原因（通俗说明）
- 网络访问受限：公司/学校网络屏蔽 GitHub，或 DNS/防火墙/代理导致无法连通。
- 身份认证失败：使用 HTTPS 密码已弃用，需要 PAT（个人访问令牌）；或 SSH 公钥未配置/未授权。
- 权限或保护分支：仓库无写权限、开启保护分支直接 push 被拒绝，需提 PR。
- 大文件/历史过大：单文件超过 100MB 或仓库有二进制资源未用 LFS，HTTP 连接被重置或传输失败。
- 代理和证书问题：公司代理（407/SSL 拦截）或自签证书未信任，导致握手失败。

## 解决方法（逐步排查与修复）

### 1）网络连通性与代理
- 使用浏览器访问 `https://github.com/`，确认是否能打开。
- 终端测试：
  - `curl -I https://github.com/`
  - `ping github.com`（若被禁则可能不通，属正常）
  - 若需代理：
    - 临时设置：`git -c http.proxy=http://127.0.0.1:7890 -c https.proxy=http://127.0.0.1:7890 push`
    - 全局设置：`git config --global http.proxy http://127.0.0.1:7890` 和 `git config --global https.proxy http://127.0.0.1:7890`
  - 如公司有自签 CA，索取并安装到系统信任，或设置 `git config --global http.sslCAInfo /path/to/cacert.pem`

### 2）改用 SSH（适合网络受限）
- 生成 SSH 密钥（macOS）：`ssh-keygen -t ed25519 -C "your_email@example.com"`
- 将 `~/.ssh/id_ed25519.pub` 内容添加到 GitHub：Settings → SSH and GPG keys。
- 测试：`ssh -T git@github.com`（显示 Hi ... 表示成功）。
- 若端口 22 被封，改用 443：在 `~/.ssh/config` 添加：
  ```
  Host github.com
    Hostname ssh.github.com
    Port 443
    User git
  ```
- 将远程改为 SSH：`git remote set-url origin git@github.com:<OWNER>/<REPO>.git`

### 3）使用 HTTPS + PAT（适合认证问题）
- 在 GitHub 创建 PAT：Settings → Developer settings → Personal access tokens（Classic 或 Fine-grained）。
  - 建议至少勾选 `repo`（如需 Actions，再加 `workflow`）。
  - 如组织启用 SSO，记得“Authorize”该 token。
- 设置凭据（macOS Keychain 默认可保存）：
  - 推送时提示用户名：填 GitHub 用户名；密码：填 PAT。
  - 或直接更新远程：`git remote set-url origin https://github.com/<OWNER>/<REPO>.git`
  - 建议启用凭据助手：`git config --global credential.helper osxkeychain`

### 4）检查权限/保护分支
- 确认在目标仓库你具备 `write` 或更高权限。
- 若主分支有保护策略（强制 PR/签名/检查），走 PR 流程：`git push` 到新分支后在 GitHub 提交 Pull Request。

### 5）处理大文件（>100MB）或二进制资源
- 安装并启用 Git LFS：
  - `brew install git-lfs`
  - `git lfs install`
  - 跟踪大文件：`git lfs track "*.zip"`（按需替换扩展名）
  - 重新添加并提交：`git add .gitattributes` 后重提相关文件再 `git push`
- 避免用 `http.postBuffer` 等治标不治本配置；根因在资源体积。

## 快速应急方案（不纠结细节先通路）
- 网络受限：切 SSH 走 443 端口（见上面的 `~/.ssh/config`）。
- 认证报错：生成 PAT 并用 HTTPS 推送，或修复 SSH key。
- 大文件阻塞：立刻启用 Git LFS 并重新提交。
- 保护分支：改推到功能分支，走 PR。

## 排查命令（用于定位根因）
```bash
# 查看远程与当前分支
git remote -v
git status

# 观察 push 详细日志
git push -vv

# 查看 Git 相关配置来源
git config -l --show-origin | grep -E 'proxy|credential|http.ssl|lfs'

# 测试 SSH 认证
ssh -T git@github.com

# 测试 HTTP 连通
curl -I https://github.com/
```

## 参考链接
- GitHub Docs: Connecting to GitHub with SSH
- GitHub Docs: Creating a personal access token (classic)
- Git LFS: https://git-lfs.com/

## 标签
Git, GitHub, 推送失败, 网络, 代理, SSH, HTTPS, PAT, 权限, LFS
