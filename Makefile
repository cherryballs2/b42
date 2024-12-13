# Cross-Compile Tools
CC = riscv64-unknown-elf-gcc
AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld

# Directories
BUILD = build

# Source files
C_SRC = src/kernel.c
ASM_SRC = src/bootstrap.s
# Linker script
LINKER_SCRIPT = src/linker.ld

# Flags
CFLAGS = -Wall -O2 -ffreestanding -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables  -nostartfiles -g
LDFLAGS = -T $(LINKER_SCRIPT) -nostdlib

# Output
TARGET = $(BUILD)/OS-X5.elf
TARGET_BIN = $(BUILD)/OS-X5.bin

# Object files
C_OBJ = $(BUILD)/kernel.o
ASM_OBJ = $(BUILD)/bootstrap.o

OBJ = $(C_OBJ) $(ASM_OBJ)

# Progress and Color
TOTAL_STEPS = 4
PROGRESS = 0
COLOR_GREEN = \033[1;32m
COLOR_YELLOW = \033[1;33m
COLOR_BLUE = \033[1;34m
COLOR_RESET = \033[0m

# Rules
all: $(TARGET)

$(TARGET): $(OBJ) | $(BUILD)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	@echo -e "$(COLOR_YELLOW)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Linking $(TARGET)...$(COLOR_RESET)"
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	riscv64-unknown-elf-objcopy -O binary $(TARGET) $(TARGET_BIN)
	riscv64-unknown-elf-objdump -d $(TARGET)
	@echo -e "$(COLOR_GREEN)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Build complete!$(COLOR_RESET)"

# Compile kernel
$(C_OBJ): $(C_SRC) | $(BUILD)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	@echo -e "$(COLOR_BLUE)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Compiling $<...$(COLOR_RESET)"
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble bootstrap
$(ASM_OBJ): $(ASM_SRC) | $(BUILD)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	@echo -e "$(COLOR_BLUE)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Assembling $<...$(COLOR_RESET)"
	$(AS) -o $@ $<

# Create the build directory if it doesn't exist
$(BUILD):
	mkdir -p $(BUILD)

fish: 
	make -C fishlibc

# Clean up build files
clean:
	@echo -e "$(COLOR_YELLOW)Cleaning up...$(COLOR_RESET)"
	rm -rf $(BUILD)/*.o $(TARGET) $(TARGET_BIN)
	$(eval PROGRESS=0)

.PHONY: all fish clean