typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;

#define UART0_BASE 0x10000000
#define UART0_TXDATA (UART0_BASE + 0x0)
#define UART0_TXCTRL (UART0_BASE + 0x8)
#define NCPU 4

char stack0[4096 * NCPU];

#define UART_TX_READY (1 << 31)
static inline void uart_putc(char c) {
    // Wait for the UART to be ready for transmission
    while (*(volatile uint32_t *)UART0_TXDATA & UART_TX_READY) {
    }
    // Write the character to the TXDATA register
    *(volatile uint32_t *)UART0_TXDATA = (uint32_t)c;
}
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