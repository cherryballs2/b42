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
CFLAGS = -Wall -O2 -ffreestanding -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables  -nostartfiles -g
LDFLAGS = -T $(LINKER_SCRIPT) -nostdlib

# Output
TARGET = $(BUILD)/OS-X5.elf
TARGET_BIN = $(BUILD)/OS-X5.bin

# Object files
C_OBJ = $(BUILD)/kernel.o \
		$(BUILD)/uart.o
ASM_OBJ = $(BUILD)/bootstrap.o

OBJ = $(C_OBJ) $(ASM_OBJ)

# Progress and Color
TOTAL_STEPS = 5
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
	riscv64-elf-objcopy -O binary $(TARGET) $(TARGET_BIN)
	riscv64-elf-objdump -d $(TARGET)
	@echo -e "$(COLOR_GREEN)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Build complete!$(COLOR_RESET)"

# Compile kernel
$(BUILD)/kernel.o: kernel-src/kernel.c | $(BUILD)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	@echo -e "$(COLOR_BLUE)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Compiling $<...$(COLOR_RESET)"
	$(CC) $(CFLAGS) -c $< -o $@

# Compile UART
$(BUILD)/uart.o: kernel-src/uart.c | $(BUILD)
	$(eval PROGRESS=$(shell expr $(PROGRESS) + 1))
	@echo -e "$(COLOR_BLUE)[$(shell expr $(PROGRESS) \* 100 / $(TOTAL_STEPS))%] Compiling $<...$(COLOR_RESET)"
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble bootstrap
$(BUILD)/bootstrap.o: kernel-src/bootstrap.s | $(BUILD)
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
