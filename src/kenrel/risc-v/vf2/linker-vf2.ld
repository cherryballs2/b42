SECTIONS
{
    . = 0x40000000; (needed for visionfive 2)

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
    .stack_core_1 (NOLOAD) : {
        __stack_core_1_start = .;
        . = . + 8 * 1024;
        __stack_core_1_end = .;
    } > ram
    .stack_core_2 (NOLOAD) : {
        __stack_core_2_start = .;
        . = . + 8 * 1024;
        __stack_core_2_end = .;
    } > ram
    .stack_core_3 (NOLOAD) : {
        __stack_core_3_start = .;
        . = . + 8 * 1024;
        __stack_core_3_end = .;
    } > ram
}

ENTRY(_start)
