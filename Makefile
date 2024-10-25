# Cross-Compile Tools
CC = riscv64-elf-gcc
AS = riscv64-elf-as
LD = riscv64-elf-ld

# Directories
BUILD = build

# Source files
C_SRC = kernel-src/kernel.c
ASM_SRC = kernel-src/bootstrap.s
# Linker script
LINKER_SCRIPT = kernel-src/linker.ld

# Flags
CFLAGS = -Wall -O2 -ffreestanding -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
LDFLAGS = -T $(LINKER_SCRIPT)


# Output
TARGET = $(BUILD)/OS-X5.elf
TARGET_BIN = $(BUILD)/OS-X5.bin

# Object files
C_OBJ = $(BUILD)/kernel.o
ASM_OBJ = $(BUILD)/bootstrap.o

OBJ = $(C_OBJ) $(ASM_OBJ)

# Rules
all: $(TARGET)

$(TARGET): $(OBJ) | $(BUILD)
	@echo "Linking $(TARGET)..."
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)
	riscv64-elf-objcopy -O binary $(TARGET) $(TARGET_BIN)

# Compile C source file
$(BUILD)/kernel.o: kernel-src/kernel.c | $(BUILD)
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble assembly files
$(BUILD)/bootstrap.o: kernel-src/bootstrap.s | $(BUILD)
	@echo "Assembling $<..."
	$(AS) -o $@ $<

# Create the build directory if it doesn't exist
$(BUILD):
	mkdir -p $(BUILD)

fish: 
	make -C fishlibc

# Clean up build files
clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD)/*.o $(TARGET) $(TARGET_BIN)
# Test the build with QEMU
test:
	qemu-system-riscv64 -bios none -nographic -machine virt -kernel $(TARGET_BIN)

.PHONY: all fish clean test 