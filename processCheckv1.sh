#!/bin/bash
# 修改要监控的进程名；
check_process_name="runaps"
# 我的是python3 ，有可能是python ，用命令测试一下； pidof python3 runaps.py 


function Nothing() {
    echo "nothing todo"
}

function Launch() {
    echo "Begin to Start python program" && python3 runaps.py & 
}

function Recovery() {
    # 需要生产环境测试；
    echo "need to Recovery" && pkill -f 'python3 runaps.py' && Launch
}



while true
do
    #my_ppid为父进程ID
    my_ppid=`pidof python3 runaps.py | rev | cut -d" " -f1 | rev`
    if [[ "$my_ppid" == "" ]]; then
        sleep 10
        echo "not found process.wait a while..." && Launch
        continue
    fi

    old=`ps -p $my_ppid -o etimes=`
    sleep 5
    new=`ps -p $my_ppid -o etimes=`
    echo $old ,$new >> log.txt
    if [[ "$old" == "$new" ]]; then
        echo "Dead" && Recovery
        continue
    fi
        echo "bypass" && Nothing
        
        continue
done

