MEMORY
{
    ram (wx) : ORIGIN = 0x80000000, LENGTH = 0x80000000
}

SECTIONS
{
    . = 0x80000000;

    .text : {
        *(.text)
        *(.rodata)
    } > ram
    .data : {
        *(.data)
    } > ram
    .bss : {
        *(.bss)
        *(COMMON)
    } > ram
    
    /* stack for cores */

    .stack_core_0 (NOLOAD) : {
        __stack_core_0_start = .;
        . = . + 8 * 1024;
        __stack_core_0_end = .;
    } > ram
    .uart (NOLOAD) : {
        __uart_base = 0x10000000; /* UART adress */
    } > ram
}
ENTRY(_start)