#!/bin/bash

HERMITUX_BASE=$HOME/Desktop/hermitux

if [ "$1" == "" ]; then
    echo "Usage: $0 <arch>"
    echo "  where arch is 'x86-64' or 'aarch64'"
    exit
fi

echo "static void unsupported(int id);"
echo

echo "static void *syscalls[335] = {"

if [ "$1" == "aarch64" ]; then
    syscalls=`cat syscalls_data.aarch64 | cut -d "," -f 3 | awk 'BEGIN { ORS = " " } { print }'`
    HERMITUX=$HERMITUX_BASE/hermitux-kernel/prefix/aarch64-hermit/extra/tests/hermitux
else
    syscalls=`cat syscalls_data.x86-64 | cut -d "," -f 3 | awk 'BEGIN { ORS = " " } { print }'`
    HERMITUX=$HERMITUX_BASE/hermitux-kernel/prefix/x86_64-hermit/extra/tests/hermitux
fi

id=0
for f in $syscalls; do

	addr=`nm $HERMITUX | grep -G " sys_$f$" | cut -f 1 -d " "`

	if [ "$addr" == "" ]; then
		addr=0
	fi

	printf "\t(void *)0x%-16s, /* $id $f */\n" "$addr"
	let id="$id+1"

done

echo "};"
echo ""

addr=`nm $HERMITUX | grep -G kprintf | cut -f 1 -d " "`
echo "#define KPRINTF_ADDR 0x$addr;"
echo "int (*kprintf)(const char *fmt, ...) = (int (*)(const char *, ...))KPRINTF_ADDR;"
echo

echo "void unsupported(int id) {"
echo "	kprintf(\"ERROR: unsupported syscall %d\n\", id);"
echo "	__builtin_trap();"
echo "}"

