.section .text
.globl _start
.extern init_stack

_start:
    csrr a0, mhartid
    call init_stack
    call kmain
    
    j _start    /* restarts if kmain returns for some reason (this should not happen) */