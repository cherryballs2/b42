#include "include/vf2.h"
#include "include/libc/stdint.h"

char stack0[4096 * NCPU];

// Functions for UART 
inline void uart_putc(char c)
{
    // Wait for the UART to be ready 
    while (*(volatile uint32_t *)UART0_TXDATA & UART_TX_READY) {
    }
    // Write the character to TXDATA
    *(volatile uint32_t *)UART0_TXDATA = (uint32_t)c;
}
void uart_puts(const char *s)
{
    while (*s) {
        uart_putc(*s++);
    }
}

int main() {
    uart_puts("Welcome to X5-OS!\n");
    while (1) {
        // Loop forever
    }
}