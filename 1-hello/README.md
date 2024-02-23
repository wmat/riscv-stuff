# 1-hello

Compile hello.c using riscv-gnu-toolchain (gcc). 



Compile C Program and Generate Intel Hex file and binary file
-------------------------------------------------------------

```bash
riscv32-unknown-elf-gcc -ffreestanding -nostdlib -Wl,-Ttext=0 hello.c 
riscv32-unknown-elf-objcopy -O ihex a.out hello.hex
riscv32-unknown-elf-objcopy -O binary a.out hello.bin
python3 ../binary2readmemh.py
```

Use Sed to Convert Intel Hex File to Verilog $readmemh
------------------------------------------------------

For the Python adverse, this is an alternative to ```binary2readmemh.py```

```bash
cat hello.hex |sed -n 's#^:......00\(.*\)...$#\1#p' |sed 's/......../&\n/g' | sed '/^$/d' |awk '{print tolower($0)}' |tee hello.readmemh
```

Example Input Hex File

```
:10000000130101FF2326810013040101B71700002B
:1000100083A7470213871700B717000023A2E70240
:040020006FF0DFFEA0
:00000001FF
```

Example Output for $readmemh

```
130101FF
23268100
13040101
B7170000
83A74702
13871700
B7170000
23A2E702
6FF0DFFE
```


