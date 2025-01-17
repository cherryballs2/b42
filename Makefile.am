AUTOMAKE_OPTIONS = subdir-objects

bin_PROGRAMS = OS-X5

OS_X5_SOURCES = src/kernel/kernel.c

if ENABLE_VF2
OS_X5_SOURCES += src/visionfive2/uart.c src/visionfive2/bootstrap.s
OS_X5_LDFLAGS = -T src/visionfive2/linker.ld -Wl,--oformat=binary
endif

AM_CFLAGS = -Wall -O2 -ffreestanding -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables

CLEANFILES = $(bin_PROGRAMS)
