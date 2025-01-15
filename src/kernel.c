typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;

int main() {
    uart_putc('X');
    uart_putc('5');
    uart_putc('\n');
    uart_putc('W');
    uart_putc('e');
    uart_putc('l');
    uart_putc('c');
    uart_putc('o');
    uart_putc('m');
    uart_putc('e');
    uart_putc('\n');
    while (1) {
        // Loop forever
    }
}