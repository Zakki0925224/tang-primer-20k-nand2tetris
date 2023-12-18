@33
D=A
@R0
M=D // ascii

@16386
D=A
@R1
M=D // vram address

@126
D=A
@R2
M=D // max value

@LOOP
0;JMP

(LOOP)
    // print char
    @R0
    D=M
    @R1
    M=D

    // increment
    @R0
    M=M+1
    @R1
    M=M+1

    @R0
    D=M
    @R2
    D=D-M

    @FINISH
    D;JGT

    @LOOP
    0;JMP

(FINISH)
@0 // NOP
