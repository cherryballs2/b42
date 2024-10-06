.section .bss 
    .align 12
stack:
    .space 8192

.section .text
.globl _start

_start:
    csrr a0, mhartid
    call init_stack
    call init_uart
    la a0, status_uart
    call uart_send_string
    call kmain

    j _start

.data 
status_uart:
    .asciz "UART initilized successfully"