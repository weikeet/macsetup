#!/usr/bin/env bash

code_file=$1

output_file=${code_file/.cpp/.out}

g++ -std=c++11 "${code_file}" -o "${output_file}"

if [ -f "${output_file}" ]; then
    ./"${output_file}"
fi