# Autore: Manuel Millefiori
# Data: 2023-11-07

# Costanti
BUILD_DIR=../build/os

OS_SRCS := $(wildcard *.asm)
OS_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS_OBJS)

# Compilo tutti i file asm
$(BUILD_DIR)/%.o: %.asm
	nasm -f bin $< -o $@

clean:
	rm $(BUILD_DIR)/*
