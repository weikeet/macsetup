#!/bin/bash
#https://blog.csdn.net/flueky/article/details/79915824

function deleteOver30Day() {
    deleteDir=$1
    currentTime=$(date '+%s')
    modifyTime=$(stat -f "%m" $deleteDir)
    diffTime=$(($currentTime-$modifyTime))

    day=$(($diffTime-1728000))
    if [ $day -gt 0 ]; then
        echo Last modify: $(date  -r$(stat -f "%m" $deleteDir) "+%Y-%m-%d %H:%M:%S"), delete $deleteDir
        rm -rf $deleteDir
    fi
}
# deleteOver30Day $1

function readDir(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]; then
            if [ $element = "build" ]; then
                deleteOver30Day $dir_or_file
            elif [ $element = ".cxx" ]; then
                deleteOver30Day $dir_or_file
            else
                readDir $dir_or_file
            fi
        fi
    done
}
readDir $1
# echo $1
# echo $(pwd)

# https://xutree.github.io/pages/2018/10/06/mac-stat/
# # 输入：需要修改的文件
# static=$1
# # 提取创建时间
# create_time=$(date  -r$(stat -f "%B" $static) "+%Y-%m-%d %H:%M:%S")
# # 提取修改时间
# modify_time=$(date  -r$(stat -f "%m" $static) "+%Y-%m-%d %H:%M:%S")
# # 查找Date标签的行号
# num1=$(head -5 $static | grep -n 'Date' | cut -d ":" -f 1)
# # 查找Modified标签的行号
# num2=$(head -5 $static | grep -n 'Modified'| cut -d ":" -f 1)
