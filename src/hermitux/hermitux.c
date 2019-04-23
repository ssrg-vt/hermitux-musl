#include <stdio.h>
#include <stdarg.h>

/* This function is defined by Glibc but not Musl, it is supposed to perform
 * some check for stack overflow but for now we just redirect it to the normal
 * print implementation */
int __printf_chk(int flag, const char *restrict fmt, ...)
{
	int ret;
	va_list ap;
	va_start(ap, fmt);
	ret = vfprintf(stdout, fmt, ap);
	va_end(ap);
	return ret;
}
