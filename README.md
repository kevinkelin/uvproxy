# uvproxy

这个是在centos7 上安装 openresty 并配置uv python 下载代理

## 安装 openresty 

运行一键安装脚本，install_openresty.sh 

运行成功以后, openresty 安装目录为 `/usr/local/openresty/`

创建 `/usr/local/openresty/nginx/conf/default.d/` 目录

将uvproxy.conf 拷贝进去 

最后修改 `/usr/local/openresty/nginx/conf/nginx.conf`, 或者直接用 nginx.conf 覆盖掉


## 运行openresty 

使用 `openresty -t ` 检查一下配置是否有误，无误的话使用 `systemctl restart openresty` 重启一下 openresty

运行上面的命令始终是root 权限


