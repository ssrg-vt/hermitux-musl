#include "syscall.h"

#include <stdarg.h>

#include "htux_syscalls.c.generated"

long syscall_redirect(int id, int argnum, ...) {

	va_list ap;

//	kprintf("syscall_redirect called with id %d and argnum %d, from 0x%llx\n",
//			id, argnum, __builtin_return_address(0));

	va_start(ap, argnum);
	switch(argnum) {

		case 0: {
			long (*f0)(void) = (long (*)(void))syscalls[id];

			va_end(ap);
			return f0();
		}

		case 1: {
			long (*f1)(void *p1) = (long (*)(void *))syscalls[id];

			void *p1 = va_arg(ap, void *);
			va_end(ap);
			return f1(p1);
		}

		case 2: {
			long (*f2)(void *p1, void *p2) =
				(long (*)(void *, void *))syscalls[id];

			void *p1 = va_arg(ap, void *);
			void *p2 = va_arg(ap, void *);
			va_end(ap);
			return f2(p1, p2);
		}

		case 3: {
			long (*f3)(void *p1, void *p2, void *p3) =
				(long (*)(void *, void *, void *))syscalls[id];

			void *p1 = va_arg(ap, void *);
			void *p2 = va_arg(ap, void *);
			void *p3 = va_arg(ap, void *);
			va_end(ap);
			return f3(p1, p2, p3);
		}

		case 4: {
			long (*f4)(void *p1, void *p2, void *p3, void *p4) =
				(long (*)(void *, void *, void *, void*))syscalls[id];

			void *p1 = va_arg(ap, void *);
			void *p2 = va_arg(ap, void *);
			void *p3 = va_arg(ap, void *);
			void *p4 = va_arg(ap, void *);
			va_end(ap);
			return f4(p1, p2, p3, p4);
		}

		case 5: {
			long (*f5)(void *p1, void *p2, void *p3, void *p4, void *p5) =
				(long (*)(void *, void *, void *, void*, void *))syscalls[id];

			void *p1 = va_arg(ap, void *);
			void *p2 = va_arg(ap, void *);
			void *p3 = va_arg(ap, void *);
			void *p4 = va_arg(ap, void *);
			void *p5 = va_arg(ap, void *);
			va_end(ap);
			return f5(p1, p2, p3, p4, p5);
		}

		case 6: {
			long (*f6)(void *p1, void *p2, void *p3, void *p4, void *p5,
					void *p6) =	(long (*)(void *, void *, void *, void *,
							void *, void *))syscalls[id];

			void *p1 = va_arg(ap, void *);
			void *p2 = va_arg(ap, void *);
			void *p3 = va_arg(ap, void *);
			void *p4 = va_arg(ap, void *);
			void *p5 = va_arg(ap, void *);
			void *p6 = va_arg(ap, void *);
			va_end(ap);
			return f6(p1, p2, p3, p4, p5, p6);
		}

	}

	kprintf("LibC fastcall issue with call %d argnum %d\n", id, argnum);
	__builtin_trap();
	return 0;
}
