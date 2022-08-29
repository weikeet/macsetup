#!/bin/zsh

# DailyPractice/app/src/main/java/com/weiwei/practice/testkt/HelloTest.kt
kotlin_file=$1

base_name=$(basename $kotlin_file .kt)
echo "base_name=$base_name"
# HelloTest

kotlin_package_name=$(cat $kotlin_file | grep "package" | awk '{print $2}' | sed 's/;//g')
echo "package_name=$kotlin_package_name"
# com.weiwei.practice.testkt

kotlin_package_path=$(echo $kotlin_package_name | sed 's/\./\//g')
echo "package_path=$kotlin_package_path"
# com/weiwei/practice/testkt

class_name="${kotlin_package_name}.${base_name}Kt"
echo "class_name=$class_name"

if [[ ! -e ~/Development/build ]]; then
    mkdir -p ~/Development/build
fi
cd ~/Development/build

kotlinc -d . $kotlin_file

if [ $# -eq 1 ]; then
    kotlin "$class_name"
elif [ $# -eq 2 ]; then
    kotlin "$class_name" $2
elif [ $# -eq 3 ]; then
    kotlin "$class_name" $2 $3
elif [ $# -eq 4 ]; then
    kotlin "$class_name" $2 $3 $4
elif [ $# -eq 5 ]; then
    kotlin "$class_name" $2 $3 $4 $5
elif [ $# -eq 6 ]; then
    kotlin "$class_name" $2 $3 $4 $5 $6
else
    echo "Too many arguments"
fi

# kotlinc $kotlin_file -include-runtime -d $base_name.jar
# https://www.kotlincn.net/docs/tutorials/command-line.html