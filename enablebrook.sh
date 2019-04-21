#!/bin/bash
echo -e "Linux启动brook客户端一键脚本\n"
echo -e "检查brook是否存在\n"
if [ ! -f "brook" ]; then
brook_ver=$(wget -qO- "https://github.com/txthinking/brook/tags"| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//') && echo ${brook_ver}
wget -N --no-check-certificate "https://github.com/txthinking/brook/releases/download/${brook_ver}/brook"
fi

echo -e "请输入服务器地址[IP:port]\n"
read -e ip
echo -e "请输入密码\n"
read -e psw
echo -e "请输入连接方式\n 1、VPN模式 \n 2、客户端模式 \n 3、透明代理模式\n"
read -e a
case $a in
1)echo -e "请先进入VNC模式(y/n)(物理机忽略)\n"
read -e choose
case $choose in
y)
nohup ./brook vpn -l 127.0.0.1:1080 -s "$ip" -p  "$psw" >brook.out 2>&1 &;;
*)
echo -e "退出脚本\n";;
esac
;;
2)nohup ./brook client -l 127.0.0.1:1080 -i 127.0.0.1 -s "$ip" -p "$psw" >brook.out 2>&1 &
echo -e "启动成功\n"
;;
3)nohup ./brook tproxy -l 127.0.0.1:1080 -s "$ip" -p "$psw" >brook.out 2>&1 &
echo -e "启动成功\n"
;;
*)
echo -e "退出脚本\n";;
esac
