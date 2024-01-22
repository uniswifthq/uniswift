head.bin: head.ld head.S lxboot.c setup.c
	clang -I../include -I../../../include -masm=intel --target=i386-elf -D__ASSEMBLY__ -c head.S
	clang -I../include -I../../../include -masm=intel --target=i386-elf -c lxboot.c
	clang -I../include -I../../../include -masm=intel --target=i386-elf -m16 -c setup.c
	ld.lld -T head.ld -o head.elf head.o lxboot.o setup.o
	objcopy -O binary head.elf head.bin

.PHONY: run rund
run: head.bin
	qemu-system-x86_64 -nographic -kernel head.bin

rund: head.bin
	qemu-system-x86_64 -nographic -kernel head.bin -d cpu

.PHONY: clean
clean:
	rm -f *.o
	rm -f *.elf
	rm -f *.bin