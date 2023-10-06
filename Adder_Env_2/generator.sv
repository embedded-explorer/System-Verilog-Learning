//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Generator
// File        : generator.sv
//----------------------------------------------------------------------------

class generator;
  
  rand logic [3:0] a;
  rand logic [3:0] b;
  
  task generate_values();
    a = $random();
    b = $random();
  endtask
  
endclass