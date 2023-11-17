# bios-utilities
Utilities for getting and displaying information through BIOS functions in 8086 real mode

### Environment
Install [QEMU](https://www.qemu.org/) and [NASM](https://www.nasm.us/).

#### Assembling a file
```nasm -fbin file.asm -o file.bin```

#### Running a file with QEMU
```qemu-system-x86_64 file.bin```
