

.globl _start
_start:
    b   reset
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt

    b   halt
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt
    b   halt

reset:
    mov sp,#0x40000000
    add sp,sp,#0x10000

    bl notmain

halt:
    mov r0,#0xE0000000
    str r0,[r0]

    ;@ halt sim
    mov r0,#0xF0000000
    str r0,[r0]

hang: b hang

.globl PUT32
PUT32:
    str r1,[r0]
    mov pc,lr

.globl GET32
GET32:
    ldr r0,[r0]
    mov pc,lr

.globl ASMDELAY
ASMDELAY:
    subs r0,r0,#1
    bne ASMDELAY
    mov pc,lr
