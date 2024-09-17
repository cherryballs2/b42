.section .text
.globl _start
.extern init_stack

_start:
    call init_stack
    
    