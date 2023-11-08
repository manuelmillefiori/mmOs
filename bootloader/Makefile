# Autore: Manuel Millefiori
# Data: 2023-11-07

# Costanti
BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

# Compilo tutti i file asm
$(BUILD_DIR)/%.o: %.asm
	nasm -f bin $< -o $@

clean:
	rm $(BUILD_DIR)/*
