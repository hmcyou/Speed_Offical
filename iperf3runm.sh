#!/usr/bin/env bash

#起始端口变量
s=5201
#端口范围变量
d=30
iperf3_run(){
    for i in $(seq 1 $d)
    do
    port=$(($s + $i))
    iperf3 -sp$port -D
    done
}
help(){
    echo -e '使用方式, 修改脚本中的起始端口和范围\n'\
            '启动: bash iperf3runm.sh run\n'\
            '停止: bash iperf3runm.sh stop\n'\
            '查看状态: bash iperf3runm.sh status'
}
if [ $1 ];
then
    if [ "$1" == run ];
    then
        iperf3_run
        echo 'start'
    elif [ "$1" == stop ];
    then
        kill -9 $(ps aux | grep iperf3 | awk '{print $2}')
        echo 'stop done!'
    elif [ "$1" == status ];
    then
        ps aux | grep iperf3 | grep -v grep | grep -v 'iperf3runm' | awk '{printf $11 } {print $12}'
    else
        echo '输入的指令有误, 当前仅支持 run/stop'
    fi
else
    help
fi
