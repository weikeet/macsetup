#!/bin/zsh

# ~/Project/DailyPractice/app/src/main/java/com/weiwei/practice/testjava/HelloTest.java
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


base_name=$(basename $code_file .java)
echo "base_name=$base_name"
# HelloTest

package_line=$(cat $code_file | grep "package")
package_name=$(cat $code_file | grep "package" | awk '{print $2}' | sed 's/;//g')
if [[ $package_line == \/\/* ]]; then
    package_name=""
fi
echo "package_name=$package_name"
# com.weiwei.practice.testjava

package_path=$(echo $package_name | sed 's/\./\//g')
echo "package_path=$package_path"
# com/weiwei/practice/testjava

if [ -z "$package_name" ]; then
    class_name="${base_name}"
else
    class_name="${package_name}.${base_name}"
fi
echo "class_name=$class_name"
# com.weiwei.practice.testjava.HelloTest


# check create build path
build_path=$HOME/Development/build
if [[ ! -e $build_path ]]; then
    mkdir -p $build_path
fi
cd $build_path


# check delete exists compile file
if [ -z "$package_path" ]; then
    compile_file="$build_path/${base_name}.class"
else
    compile_file="$build_path/$package_path/${base_name}.class"
fi
if [[ -e $compile_file ]]; then
    echo ""
    echo "$compile_file is exists, execute delete."
    rm $compile_file
fi


# compile .java to .class
echo ""
echo "start compile ===>"
javac -d . $code_file


# check compile file exists
if [[ ! -e $compile_file ]]; then
    echo ""
    echo "Error: $compile_file not found, maybe compile error."
    exit 0
fi


# jar_file="$build_path/$package_path--/$base_name.jar"
# manifest_file="$build_path/$package_path--/manifest.mf"
# echo "Manifest-Version: 1.0" >> $manifest_file
# echo "Created-By: 1.5.0_06 (Sun Microsystems Inc.)" >> $manifest_file
# echo $class_name >> $manifest_file
# jar cvfm $jar_file $manifest_file $compile_file

# execute .class file
echo ""
echo "start execute ===>"
if [ $# -eq 1 ]; then
    java $class_name
elif [ $# -eq 2 ]; then
    java $class_name $2
elif [ $# -eq 3 ]; then
    java $class_name $2 $3
elif [ $# -eq 4 ]; then
    java $class_name $2 $3 $4
elif [ $# -eq 5 ]; then
    java $class_name $2 $3 $4 $5
elif [ $# -eq 6 ]; then
    java $class_name $2 $3 $4 $5 $6
elif [ $# -eq 7 ]; then
    java $class_name $2 $3 $4 $5 $6 $7
elif [ $# -eq 8 ]; then
    java $class_name $2 $3 $4 $5 $6 $7 $8
elif [ $# -eq 9 ]; then
    java $class_name $2 $3 $4 $5 $6 $7 $8 $9
elif [ $# -eq 10 ]; then
    java $class_name $2 $3 $4 $5 $6 $7 $8 $9 $10
elif [ $# -eq 11 ]; then
    java $class_name $2 $3 $4 $5 $6 $7 $8 $9 $10 $11
elif [ $# -eq 12 ]; then
    java $class_name $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12
else
    echo "Too many arguments: more than 5.x"
fi
