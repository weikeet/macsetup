#!/bin/zsh

# DailyPractice/app/src/main/java/com/weiwei/practice/testjava/HelloTest.java
java_file=$1

base_name=$(basename $java_file .java)
# HelloTest
# echo $base_name

java_package_name=$(cat $java_file | grep "package" | awk '{print $2}' | sed 's/;//g')
# com.weiwei.practice.testjava
# echo $java_package_name

java_package_path=$(echo $java_package_name | sed 's/\./\//g')
# com/weiwei/practice/testjava
# echo $java_package_path

class_name="${java_package_name}.${base_name}"

if [[ ! -e ~/Development/build ]]; then
    mkdir -p ~/Development/build
fi
cd ~/Development/build

javac -d . $java_file

if [ $# -eq 1 ]; then
    java "$class_name"
elif [ $# -eq 2 ]; then
    java "$class_name" $2
elif [ $# -eq 3 ]; then
    java "$class_name" $2 $3
elif [ $# -eq 4 ]; then
    java "$class_name" $2 $3 $4
elif [ $# -eq 5 ]; then
    java "$class_name" $2 $3 $4 $5
elif [ $# -eq 6 ]; then
    java "$class_name" $2 $3 $4 $5 $6
else
    echo "Too many arguments"
fi