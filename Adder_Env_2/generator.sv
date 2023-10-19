//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Generator
// File        : generator.sv
//---------------------------------------------------------------------------

class generator;
  
  logic [3:0] a;
  logic [3:0] b;
  
  // Task to generate random values for A and B
  task generate_values();
    a = $random();
    b = $random();
    $display($time, "ns [GEN] : A = %d, B = %d", a, b);
  endtask
  
endclass