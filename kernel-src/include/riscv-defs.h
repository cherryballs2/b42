//
// This file is designed to give us easy acsess to the Risc-V ISA.
//

#ifndef RISCV_DEFS_H
#define RISCV_DEFS_H

//
static inline int
r_mhartid()
{
    int x;
    asm volatile("csrr %0, mhartid" : "=r" (x) );
    return x;
}

#endif // RISCV_DEFS_H