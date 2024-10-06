.section .bss 
    .align 12
stack:
    .space 8192

.section .text
.globl init_stack

init_stack:
    la sp, stack
    ret