op=$1

if [[ $op == "-h" ]]; then
    echo "[-h] (help)"
    echo "[-ts] [TimeStamp] (Unix时间戳 转换为 日期时间) (例如: -ts 1663816044)"
    echo "[-t] [Time] (日期时间 转换为 Unix时间戳) (例如: -t 2022-09-22 11:07:24)"
    exit
fi

default_format="%Y-%m-%d %H:%M:%S"

# format sample
# date -r "1663816044" +'%Y-%m-%d %H:%M:%S'
# date -j -f "%Y-%m-%d %H:%M:%S" "2022-09-22 11:07:24" +%s

if [[ $op == "-ts" ]]; then
    if [ $# != 2 ]; then
        echo "Input params count=$#, Usage: datec -ts [TimeStamp]"
        exit
    fi

    time_stamp=$2
    if ! [[ "$time_stamp" =~ ^[0-9]+$ ]]; then
        echo "您输入的时间不合法"
        exit
    fi

    time_stamp_len=${#time_stamp}
    if [[ $time_stamp_len -gt "10" ]]; then
        echo "您输入的时间戳长度大于 10 位, 将截取前 10 位"
        time_stamp=${time_stamp:0:10}
    fi

    date -r "$time_stamp" +"$default_format"
    exit
fi

if [[ $op == "-t" ]]; then
    if [ $# != 2 ]; then
        echo "Input params count=$#, Usage: datec -t [Time]"
        echo "注意📢: 输入日期时间需要使用双引号"
        exit
    fi

    date -j -f "$default_format" "$2" +%s
    exit
fi

echo "Select opration error, please use -h to get help"
