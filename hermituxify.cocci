@syscall@
identifier syscall_function =~ "[__]*syscall[_cp]*[0-7]*$";
expression syscall_id;
expression p1, p2, p3, p4, p5, p6, p7;
@@

(
- syscall_function(syscall_id)
+ syscall_redirect(syscall_id)
|
- syscall_function(syscall_id, p1)
+ syscall_redirect(syscall_id, p1)
|
- syscall_function(syscall_id, p1, p2)
+ syscall_redirect(syscall_id, p1, p2)
|
- syscall_function(syscall_id, p1, p2, p3)
+ syscall_redirect(syscall_id, p1, p2, p3)
|
- syscall_function(syscall_id, p1, p2, p3, p4)
+ syscall_redirect(syscall_id, p1, p2, p3, p4)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5)
+ syscall_redirect(syscall_id, p1, p2, p3, p4, p5)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5, p6)
+ syscall_redirect(syscall_id, p1, p2, p3, p4, p5, p6)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5, p6, p7)
+ syscall_redirect(syscall_id, p1, p2, p3, p4, p5, p6, p7)
)

@socketcall@
identifier syscall_function =~ "socketcall[_cp]*$";
identifier sockop;
fresh identifier id = "SYS_" ## sockop;
expression p1, p2, p3, p4, p5, p6, p7;
@@

(
- syscall_function(sockop)
+ syscall_redirect(id)
|
- syscall_function(sockop, p1)
+ syscall_redirect(id, p1)
|
- syscall_function(sockop, p1, p2)
+ syscall_redirect(id, p1, p2)
|
- syscall_function(sockop, p1, p2, p3)
+ syscall_redirect(id, p1, p2, p3)
|
- syscall_function(sockop, p1, p2, p3, p4)
+ syscall_redirect(id, p1, p2, p3, p4)
|
- syscall_function(sockop, p1, p2, p3, p4, p5)
+ syscall_redirect(id, p1, p2, p3, p4, p5)
|
- syscall_function(sockop, p1, p2, p3, p4, p5, p6)
+ syscall_redirect(id, p1, p2, p3, p4, p5, p6)
|
- syscall_function(sockop, p1, p2, p3, p4, p5, p6, p7)
+ syscall_redirect(id, p1, p2, p3, p4, p5, p6, p7)
)

@__sys_open@
identifier syscall_function =~ "[__]*sys_open[_cp]*[2-3]*$";
expression p1, p2, p3, p4;
@@

(
- syscall_function(p1, p2, p3)
+ syscall_redirect(SYS_open, p2, (p3)|O_LARGEFILE)
|
- syscall_function(p1, p2, p3, p4)
+ syscall_redirect(SYS_open, p2, (p3)|O_LARGEFILE, p4)
)

