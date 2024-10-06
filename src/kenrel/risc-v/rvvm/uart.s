.section .text
.globl init_uart
init_uart:
    li t0, 0x10000000
    li t1, 0x00
    sw t1, 0(t0)
    ret

.globl uart_send_char
uart_send_char:
    li t0, 0x10000000
1:
    lb t1, 0(t0)
    andi t1, t1, 0x20
    beqz t1, 1b
    sb a0, 0(t0)
    ret

.globl uart_send_string
uart_send_string:
    lb a1, 0(a0)
    beqz a1, .done
    jal uart_send_char
    addi a0, a0, 1
    j uart_send_string
.done:
    ret
