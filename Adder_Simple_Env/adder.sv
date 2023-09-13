//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : 4-Bit Adder
// File        : adder.sv
//----------------------------------------------------------------------------

module adder(
  input  [3:0] a_i, // 4-Bit Input A
  input  [3:0] b_i, // 4-Bit Input B
  output [4:0] s_o  // 5-Bit Sum
);
  
  // Assign sum
  assign s_o = a_i + b_i;

endmodule
