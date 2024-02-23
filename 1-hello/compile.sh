riscv32-unknown-elf-gcc -ffreestanding -nostdlib -Wl,-Ttext=0 hello.c 
riscv32-unknown-elf-objcopy -O ihex a.out hello.hex
riscv32-unknown-elf-objcopy -O binary a.out hello.bin
cat hello.hex |sed -n 's#^:......00\(.*\)...$#\1#p' |sed 's/......../&\n/g' | sed '/^$/d' |awk '{print tolower($0)}' |tee hello.readmemh


