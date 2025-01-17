bin_PROGRAMS = OS-X5

OS_X5_SOURCES = src/kernel/kernel.c

@ENABLE_VF2@
OS_X5_SOURCES += src/visionfive2/uart.c src/visionfive2/bootstrap.s
OS_X5_LDADD = -T src/visionfive2/linker.ld
@ENDENABLE_VF2@

AM_CFLAGS = -Wall -O2 -ffreestanding -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables

# Clean files
CLEANFILES = $(bin_PROGRAMS)
