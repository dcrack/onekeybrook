#!/bin/bash
echo
echo "*Brook客户端一键管理脚本*"
echo "	by Moecola blog"
echo "	https://moecola.com"
echo
echo
echo "请输入操作"
echo
echo "[1]启动brook"
echo
echo "[2]关闭brook"
echo
echo -n "brook状态："
result=`pidof brook`
if [ ! -n "$result" ]; then
echo -e "\033[31m 未启动\033[0m \n"
else
echo -e "\033[32m 已启动 \033[0m \n"
fi
read -e a
i="sudo"
x=`rpm -qa | grep $i`
if [ `rpm -qa | grep $i |wc -l` -ne 0 ];then
echo
else
apt install sudo -y
fi
case $a in
1)if [ ! -f "enablebrook.sh" ]; then
wget -N --no-check-certificate "https://raw.githubusercontent.com/dix233/onekeybrook/master/enablebrook.sh"
fi
sudo bash enablebrook.sh;;
2)if [ ! -f "disablebrook.sh" ]; then
wget -N --no-check-certificate "https://raw.githubusercontent.com/dix233/onekeybrook/master/disablebrook.sh"
fi
sudo bash disablebrook.sh;;
esac
