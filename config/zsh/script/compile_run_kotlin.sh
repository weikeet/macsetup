#!/bin/zsh

# ~/Project/DailyPractice/app/src/main/java/com/weiwei/practice/testkt/HelloTest.kt
code_file=$1

if [[ $code_file = /* ]]; then
    echo ""
else
    code_file=$(pwd)/$code_file
fi
if [[ ! -e $code_file ]]; then
    echo "code_file: $code_file not exists."
    exit 0
fi
echo "code_file=$code_file"


base_name=$(basename $code_file .kt)
echo "base_name=$base_name"
# HelloTest

package_name=$(cat $code_file | grep "package" | awk '{print $2}' | sed 's/;//g')
echo "package_name=$package_name"
# com.weiwei.practice.testkt

package_path=$(echo $package_name | sed 's/\./\//g')
echo "package_path=$package_path"
# com/weiwei/practice/testkt

class_name="${package_name}.${base_name}Kt"
echo "class_name=$class_name"
# com.weiwei.practice.testkt.HelloTestKt


# check create build path
build_path=$HOME/Development/build
if [[ ! -e $build_path ]]; then
    mkdir -p $build_path
fi
cd $build_path


# check delete exists compile file
class_file_name=${base_name}Kt.class
compile_file="$build_path/$package_path/$class_file_name"
if [[ -e $compile_file ]]; then
    echo ""
    echo "$compile_file is exists, execute delete."
    rm $compile_file
fi


# compile .kt to .class
echo ""
echo "start compile ===>"
kotlinc -d . $code_file


# check compile file exists
if [[ ! -e $compile_file ]]; then
    echo ""
    echo "Error: $compile_file not found, maybe compile error."
    exit 0
fi


# execute .class file
echo ""
echo "start execute ===>"
if [ $# -eq 1 ]; then
    kotlin $class_name
elif [ $# -eq 2 ]; then
    kotlin $class_name $2
elif [ $# -eq 3 ]; then
    kotlin $class_name $2 $3
elif [ $# -eq 4 ]; then
    kotlin $class_name $2 $3 $4
elif [ $# -eq 5 ]; then
    kotlin $class_name $2 $3 $4 $5
elif [ $# -eq 6 ]; then
    kotlin $class_name $2 $3 $4 $5 $6
else
    echo "Too many arguments: more than 5."
fi

# kotlinc $code_file -include-runtime -d $base_name.jar
# https://www.kotlincn.net/docs/tutorials/command-line.html
