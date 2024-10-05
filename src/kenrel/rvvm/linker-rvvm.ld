SECTIONS
{
    . = 0x80000000; /* Rhe usual risc-v start location */

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
    /* stack */
    .stack (NOLOAD) : {
        __stack_start = .;
        . = . + 4096 * 4;
        __stack_end = .;
    } > ram
}
ENTRY(_start)