#ifndef UART_H
#define UART_H

#include "../../fishlibc/src/include/stdint.h"
#include "vf2-defs.h"

void uart_putc(char c);
void uart_puts(const char *s);

#endif // UART_H