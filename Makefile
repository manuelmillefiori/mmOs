# Autore: Manuel Millefiori
# Data: 2023-11-07

# Costanti
BUILD_DIR=build
BOOTLOADER=$(BUILD_DIR)/bootloader/bootloader.o
OS=$(BUILD_DIR)/os/sample.o
DISK_IMG=disk.img

all: bootdisk

.PHONY: bootdisk bootloader os

# Comando per l'avvio di qemu
qemu:
	/opt/qemu-8.1.2/build/qemu-system-i386 -machine q35 -fda $(DISK_IMG) -gdb tcp::26000 -S

bootloader:
	make -C bootloader

os:
	make -C os

bootdisk: bootloader os
	# Preinizializzo lo spazio di allocazione
	# per il bootloader ed il kernel
	dd if=/dev/zero of=$(DISK_IMG) bs=512 count=2880

	# Inizializzo il primo settore da 512 bytes
	# Con il bootloader
	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0

	# Inizializzo il secondo settore da 512 bytes
	# Con il kernel
	dd conv=notrunc if=$(OS) of=$(DISK_IMG) bs=512 count=1 seek=1

clean:
	make -C bootloader clean
	make -C os clean

