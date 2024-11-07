# Notes and commentary

## 0x7C00 location

`0x7C00` is a historical artefact of the original IBM PC

BIOS loads a bootloader to `0x7C00` as memory below this location is reserved for the BIOS itself and interrupt vectors.

## Interrupts

* `int 0x10` used to print char
* `int 0x16` used to grab keyboard input

## Printing

```nasm
mov ah, 0x0e
mov al, 'C'
int 0x10
```