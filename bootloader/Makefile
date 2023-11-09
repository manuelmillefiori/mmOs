# Autore: Manuel Millefiori
# Data: 2023-11-07

# Costanti
BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

# Compilo tutti i file asm
$(BUILD_DIR)/%.o: %.asm
	nasm -f elf $< -F dwarf -g -o $@
	ld -m elf_i386 -T bootloader.lds $@ -o $@.elf
	objcopy -O binary $(BUILD_DIR)/bootloader.o.elf $@

clean:
	rm $(BUILD_DIR)/*
