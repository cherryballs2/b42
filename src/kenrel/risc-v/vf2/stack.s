.section .bss 
    .align 12
stack_core_0:
    .space 8192
stack_core_1:
    .space 8192
stack_core_2:
    .space 8192
stack_core_3:
    .space 8192

.section .text
.globl init_stack

init_stack:
    li t0, 8192
    beqz a0, set_stack_core_0
    li t1, 1
    beq a0, t1, set_stack_core_1
    li t1, 2
    beq a0, t1, set_stack_core_2
    li t1, 3
    beq a0, t1, set_stack_core_3
    retand
set_stack_core_0:
    la sp, stack_core_0
    ret
set_stack_core_1:
    la sp, stack_core_1
    ret
set_stack_core_2:
    la sp, stack_core_2
    ret
set_stack_core_3:
    la sp, stack_core_3
    ret
