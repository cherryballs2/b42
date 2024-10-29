#include "include/uart.h"
#include "include/vf2-defs.h"

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