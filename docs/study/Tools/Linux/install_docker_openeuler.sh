#!/bin/bash

# 脚本名称: install_docker_openeuler.sh
# 描述: 在 openEuler 22.03 SP3 上安装 Docker
# 用户: admin (需要 sudo 权限)

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO] $1${NC}"
}

log_warn() {
    echo -e "${YELLOW}[WARN] $1${NC}"
}

log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

# 检查是否具有 sudo 权限
if [ "$EUID" -eq 0 ]; then
    if [ -n "$SUDO_USER" ]; then
        log_info "检测到通过 sudo 运行，目标用户为: $SUDO_USER"
    else
        log_warn "当前是以 root 用户直接登录运行。Docker 权限将配置给 root。"
    fi
else
    if ! sudo -v; then
        log_error "当前用户没有 sudo 权限，请联系管理员。"
        exit 1
    fi
fi

log_info "开始在 openEuler 22.03 SP3 上安装 Docker..."

# 1. 移除旧版本 Docker (如果存在)
log_info "正在检查并移除旧版本 Docker..."
sudo dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine || true

# 2. 安装必要的系统工具
log_info "安装必要的系统工具..."
# openEuler 使用 dnf-plugins-core 代替 yum-utils
sudo dnf install -y dnf-plugins-core device-mapper-persistent-data lvm2

# 3. 添加 Docker CE 软件源 (使用阿里云镜像源)
log_info "添加 Docker CE 阿里云镜像源..."
sudo dnf config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 修正 repo 文件中的 $releasever，因为 openEuler 的版本号可能无法直接匹配 CentOS 的源
# openEuler 22.03 兼容 CentOS 8 的包
log_info "配置软件源适配 openEuler..."
sudo sed -i 's/$releasever/8/g' /etc/yum.repos.d/docker-ce.repo

# 4. 安装 Docker CE
log_info "开始安装 Docker CE..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 5. 启动 Docker 并设置开机自启
log_info "启动 Docker 并设置开机自启..."
sudo systemctl start docker
sudo systemctl enable docker

# 6. 配置当前用户权限 (免 sudo 使用 docker)
# 如果使用 sudo 运行脚本，SUDO_USER 变量会保存原始用户名
if [ -n "$SUDO_USER" ]; then
    CURRENT_USER="$SUDO_USER"
else
    CURRENT_USER=$(whoami)
fi

log_info "正在配置用户 ${CURRENT_USER} 的 Docker 权限..."

# 创建 docker 组 (如果不存在)
if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi

# 将当前用户加入 docker 组
sudo usermod -aG docker $CURRENT_USER

# 7. 配置镜像加速 (推荐国内用户配置)
log_info "配置 Docker 镜像加速 (使用阿里云公共加速器)..."
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io",
    "https://huecker.io",
    "https://dockerhub.timeweb.cloud",
    "https://noohub.ru"
  ]
}
EOF
# 注意：以上镜像源可能会随时间失效，这里提供了一些目前可用的公共镜像
# 也可以提示用户替换为自己的阿里云专属加速器地址

log_info "重启 Docker 服务以应用配置..."
sudo systemctl daemon-reload
sudo systemctl restart docker

# 8. 验证安装
log_info "验证 Docker 安装..."
sudo docker --version

log_info "========================================================"
log_info "Docker 安装完成！"
log_info "请注销并重新登录，或者运行以下命令以使组权限立即生效："
log_info "newgrp docker"
log_info "========================================================"
