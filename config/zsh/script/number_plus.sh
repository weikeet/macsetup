flag=0
while ((flag == 0))
do
    echo "请输入数字1:" && read INPUT_NUM1
    if [[ $INPUT_NUM1 == "q" ]]; then
        exit
    elif ! [[ "$INPUT_NUM1" =~ ^[0-9]+$ ]]; then
        echo "您输入的不是数字，请重新输入（输入 q 退出）"
    else
        flag=1
    fi
done

flag=0
while ((flag == 0))
do
    echo "请输入数字2:" && read INPUT_NUM2
    if [[ $INPUT_NUM2 == "q" ]]; then
        exit
    elif ! [[ "$INPUT_NUM2" =~ ^[0-9]+$ ]]; then
        echo "您输入的不是数字，请重新输入（输入 q 退出）"
    else
        flag=1
    fi
done

echo "${INPUT_NUM1}+${INPUT_NUM2}=$((INPUT_NUM1+INPUT_NUM2))"
