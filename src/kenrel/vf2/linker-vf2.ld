SECTIONS
{
    . = 0x40000000; /* For the visionfive2 the bootloader must start here */


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