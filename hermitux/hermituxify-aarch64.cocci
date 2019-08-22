@syscall@
identifier syscall_function =~ "[__]*syscall[_cp]*[0-7]*$";
expression syscall_id;
expression p1, p2, p3, p4, p5, p6, p7;
@@

(
- syscall_function(syscall_id)
+ syscall_redirect(syscall_id, 0)
|
- syscall_function(syscall_id, p1)
+ syscall_redirect(syscall_id, 1, (long)p1)
|
- syscall_function(syscall_id, p1, p2)
+ syscall_redirect(syscall_id, 2, (long)p1, (long)p2)
|
- syscall_function(syscall_id, p1, p2, p3)
+ syscall_redirect(syscall_id, 3, (long)p1, (long)p2, (long)p3)
|
- syscall_function(syscall_id, p1, p2, p3, p4)
+ syscall_redirect(syscall_id, 4, (long)p1, (long)p2, (long)p3, (long)p4)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5)
+ syscall_redirect(syscall_id, 5, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5, p6)
+ syscall_redirect(syscall_id, 6, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5, (long)p6)
|
- syscall_function(syscall_id, p1, p2, p3, p4, p5, p6, p7)
+ syscall_redirect(syscall_id, 6, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5, (long)p6, p7)
)

@socketcall@
identifier syscall_function =~ "socketcall[_cp]*$";
identifier sockop;
fresh identifier id = "SYS_" ## sockop;
expression p1, p2, p3, p4, p5, p6, p7;
@@

(
- syscall_function(sockop)
+ syscall_redirect(id, 0)
|
- syscall_function(sockop, p1)
+ syscall_redirect(id, 1, (long)p1)
|
- syscall_function(sockop, p1, p2)
+ syscall_redirect(id, 2, (long)p1, (long)p2)
|
- syscall_function(sockop, p1, p2, p3)
+ syscall_redirect(id, 3, (long)p1, (long)p2, (long)p3)
|
- syscall_function(sockop, p1, p2, p3, p4)
+ syscall_redirect(id, 4, (long)p1, (long)p2, (long)p3, (long)p4)
|
- syscall_function(sockop, p1, p2, p3, p4, p5)
+ syscall_redirect(id, 5, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5)
|
- syscall_function(sockop, p1, p2, p3, p4, p5, p6)
+ syscall_redirect(id, 6, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5, (long)p6)
|
- syscall_function(sockop, p1, p2, p3, p4, p5, p6, p7)
+ syscall_redirect(id, 6, (long)p1, (long)p2, (long)p3, (long)p4, (long)p5, (long)p6, (long)p7)
)

