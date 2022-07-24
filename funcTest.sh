#!/bin/bash
# 修改要监控的进程名；
check_process_name="runaps"
# 我的是python3 ，有可能是python ，用命令测试一下； pidof python3 runaps.py 


function Foo() {
    echo "Test"
}


Foo

# while true
# do
#     my_pid=`pidof python3 $check_process_name`
#     if [[ "$my_pid" == "" ]]; then
#         sleep 10
#         echo "not found process.wait a while..."
#         continue
#     fi

#     old=`ps -p $my_pid -o etimes=`
#     sleep 5
#     new=`ps -p $my_pid -o etimes=`
#     echo $old ,$new >> log.txt
#     if [[ "$old" == "$new" ]]; then
#         echo "Dead"
#         Test
#         continue
#     fi
#         echo "bypass" && Foo
        
#         continue
# done

