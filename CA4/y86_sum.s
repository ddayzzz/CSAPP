# Y86指令
    .pos 0
    irmovq stack, %rsp
    call main
    halt
# 对齐指令
    .align 8
# 4个元素的数组定义
array
    .quad 0x000d000d000d
    .quad 0x00c000c000c0
    .quad 0x0b000b000b00
    .quad 0xa000a000a000
main
    irmovq array, %rdi
    irmovq $4,%rsi
    call sum  # sum(array,4)
    ret
sum:
    irmovq $8,%r8
    irmovq $1,%r9
    xorq %rax,%rax
    andq %rsi,%rsi  % count是否为0
    jmp test
loop:
    mrmovq (%rdi),%r10
    addq %r10,%rax
    addq %r8,%rdi
    subq %r9,%rsi
test:
    jne loop
    ret
# 栈从此处增长
    .pos 0x200
stack:    
