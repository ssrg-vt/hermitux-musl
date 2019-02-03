#!/bin/bash

HERMITUX=/home/pierre/Desktop/hermitux/hermitux-kernel/prefix/x86_64-hermit/extra/tests/hermitux

echo "static void unsupported(int id);"
echo

echo "static void *syscalls[335] = {"

syscalls=`cat syscalls_data | cut -d "," -f 3 | awk 'BEGIN { ORS = " " } { print }'`

id=0
for f in $syscalls; do

	addr=`nm $HERMITUX | grep -G " sys_$f$" | cut -f 1 -d " "`

	if [ "$addr" == "" ]; then
		addr=0
	fi

	#echo -e "\t(void *)0x$addr,\t\t/* $id $f */ "
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

