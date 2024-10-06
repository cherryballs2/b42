CC = gcc
AS = as
LD = ld

BUILD = ./build
C_SRC = ./src/kernel/portable/kernel.c 
RISCV_BASIC_ASM  =./src/kernel/risc-v/basic/*.s
RVVM_ASM = ./src/kernel/risc-v/rvvm/*.s
VF2_ASM = ./src/kernel/risc-v/vf2/*.s


TARGET = OS-X5