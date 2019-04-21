#!/bin/bash
ProcNumber=`ps -ef |grep -w brook|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ]
then
echo -e "brook未启动\n"
else
result=`pidof brook`
kill $result
echo -e "brook已关闭\n"
fi
