// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  (LISTEN)
    @KBD
    D=M
    @FILL
    D;JGT
    @CLEAR
    0;JMP

  (FILL)
    @KBD
    D=A
    @keyboard
    M=D
    @SCREEN
    D=A
    @screen
    M=D
    (PAINT)
      @keyboard
      D=M
      @screen
      D=M-D
      @LISTEN
      D;JEQ
      @screen
      A=M
      M=-1
      @screen
      M=M+1
      @PAINT
      0;JMP

  (CLEAR)
    @KBD
    D=A
    @keyboard
    M=D
    @SCREEN
    D=A
    @screen
    M=D
    (WIPE)
      @keyboard
      D=M
      @screen
      D=M-D
      @LISTEN
      D;JEQ
      @screen
      A=M
      M=0
      @screen
      M=M+1
      @WIPE
      0;JMP

  @LOOP
  0;JMP
