#!/bin/bash

# 检查是否是root用户
if [ "$(id -u)" -ne 0 ]; then
  echo "必须以root用户运行脚本！"
  exit 1
fi

echo "开始安装 OpenResty 和 lua-resty-http..."

# 1. 安装 EPEL 和必要工具
echo "安装必要的工具..."
yum install -y yum-utils wget curl

# 2. 添加 OpenResty YUM 仓库
echo "添加 OpenResty 仓库..."
yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo

# 3. 安装 OpenResty
echo "安装 OpenResty..."
yum install -y openresty

# 4. 启动 OpenResty
echo "启动 OpenResty..."
systemctl start openresty
systemctl enable openresty

# 5. 安装 OPM（OpenResty Package Manager）
echo "安装 OpenResty 包管理器 OPM..."
yum install -y openresty-opm

# 6. 安装 lua-resty-http
echo "安装 lua-resty-http..."
/usr/local/openresty/bin/opm get ledgetech/lua-resty-http

# 7. 检查 OpenResty 是否安装成功
echo "检查 OpenResty 版本..."
openresty -v

# 8. 检查 lua-resty-http 是否安装成功
echo "检查 lua-resty-http 是否安装成功..."
if [ -f "/usr/local/openresty/site/lualib/resty/http.lua" ]; then
  echo "lua-resty-http 安装成功！"
else
  echo "lua-resty-http 安装失败！"
  exit 1
fi


# 10. 重启 OpenResty
echo "重启 OpenResty..."
systemctl restart openresty

echo "安装完成！"