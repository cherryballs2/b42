# Complation Tools
ifdef VISIONFIVE2
CC = riscv64-unknown-elf-gcc
AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld
OBJCOPY = riscv64-unknown-elf-objcopy
else
CC = gcc
AS = as
LD = ld
OBJCOPY = objcopy
endif

# Build directory
BUILD = build

# Files needed for build.
C_SRC = src/kernel/kernel.c
ifdef VISIONFIVE2
ASM_SRC = src/visionfive2/bootstrap.s
LINKER_SCRIPT = src/visionfive2/linker.ld
else
# TODO: Add support for x86_64
endif

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
	$(OBJCOPY) -O binary $(TARGET) $(TARGET_BIN)

# Compile Main Kernel C file
$(BUILD)/kernel.o: $(C_SRC) | $(BUILD)
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble bootstrap code
$(BUILD)/bootstrap.o: $(ASM_SRC) | $(BUILD)
	@echo "Assembling $<..."
	$(AS) -o $@ $<

# Create the build directory if it doesn't exist
$(BUILD):
	mkdir -p $(BUILD)

# Clean up build files
clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD)/*.o $(TARGET) $(TARGET_BIN)