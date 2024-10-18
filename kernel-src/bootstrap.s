.section .text
.globl _start
_start:
    add t0, a0, 1
    slli t0, t0, 14
    la sp, stack 
    add sp, sp, t0
    call main

# loop just incase kernel returns (it should never do that)
loop:
    j loop

.section .bss.stack
.align 12
.globl stack
stack:
    .space 8192 * 4 * 4
.globl stack_top
stack_top:
