#!/bin/zsh

# ~/Project/DailyPractice/app/src/main/cpp/HelloTest.cpp
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


base_name=$(basename $code_file)
echo "base_name=$base_name"
# HelloTest.cpp


# check create cpp build path
build_path=$HOME/Development/build/cpp
if [[ ! -e $build_path ]]; then
    mkdir -p $build_path
fi
cd $build_path


# check delete exists compile file
output_file=$base_name.o
compile_file=$build_path/$output_file
if [[ -e $compile_file ]]; then
    echo ""
    echo "$compile_file is exists, execute delete."
    rm $compile_file
fi


# compile .cpp to .o
echo ""
echo "start compile ===>"
g++ -std=c++11 $code_file -o $output_file


# check compile file exists
if [[ ! -e $compile_file ]]; then
    echo ""
    echo "Error: $compile_file not found, maybe compile error."
    exit 0
fi


# execute .o file
echo ""
echo "start execute ===>"
if [ $# -eq 1 ]; then
    ./$output_file
elif [ $# -eq 2 ]; then
    ./$output_file $2
elif [ $# -eq 3 ]; then
    ./$output_file $2 $3
elif [ $# -eq 4 ]; then
    ./$output_file $2 $3 $4
elif [ $# -eq 5 ]; then
    ./$output_file $2 $3 $4 $5
elif [ $# -eq 6 ]; then
    ./$output_file $2 $3 $4 $5 $6
else
    echo "Too many arguments: more than 5."
fi
