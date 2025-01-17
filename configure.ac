AC_INIT([X5-OS], [1.0])
AM_INIT_AUTOMAKE([foreign subdir-objects])
AM_CONDITIONAL([AMDEP], [true])

# Set up build configuration
AC_ARG_ENABLE([visionfive2],
    [AS_HELP_STRING([--enable-visionfive2], [Enable VisionFive 2 support])],
    [VF2=true], [VF2=false])

AM_CONDITIONAL([ENABLE_VF2], [test "x$VF2" = "xtrue"])

AM_PROG_AS

# Checks for programs.
if test "x$VF2" = "xtrue"; then
    AC_CHECK_TOOL([CC], [riscv64-unknown-elf-gcc])
    AC_CHECK_TOOL([AS], [riscv64-unknown-elf-as])
    AC_CHECK_TOOL([LD], [riscv64-unknown-elf-ld])
    AC_CHECK_TOOL([OBJCOPY], [riscv64-unknown-elf-objcopy])
else
    AC_PROG_CC
    AC_CHECK_TOOL([AS], [as])
    AC_CHECK_TOOL([LD], [ld])
    AC_CHECK_TOOL([OBJCOPY], [objcopy])
fi

# Checks for libraries

# Checks for header files.
AC_CHECK_HEADERS([stdint.h])

# Set linker flags for raw binary output
LDFLAGS="$LDFLAGS -Wl,--oformat=binary"

# Output files
AC_CONFIG_FILES([Makefile])
AC_OUTPUT