#!/bin/bash
ps -fe|grep "brook" |grep -v grep
if [ $? -ne 0 ]
then
echo -e "brook未启动\n"
else
result=`pidof brook`
kill $result
echo -e "brook已关闭\n"
fi
