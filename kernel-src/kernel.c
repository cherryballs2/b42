#include "include/vf2-defs.h"
#include "include/uart.h"

char stack0[4096 * NCPU];

int main() {
    uart_puts("Welcome to X5-OS!\n");
    while (1) {
        // Loop forever
    }
}
