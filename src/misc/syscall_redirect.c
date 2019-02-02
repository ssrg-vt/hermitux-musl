#include "syscall.h"

int syscall_redirect(int id, ...) {
	__builtin_trap();
	return 0;
}
