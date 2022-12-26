//----------------------------------------------------------------------------
// Title       : Full Subtractor
// File        : full_subtractor.sv
//----------------------------------------------------------------------------

module full_subtractor(
  input        a_i  , // Input A
  input        b_i  , // Input B
  input        bor_i, // Borrow Input
  output logic dif_o, // Difference Output
  output logic bor_o  // Borrow Output
);

  always_comb begin
    dif_o = a_i ^ b_i ^ bor_i                            ; // Assign Difference
    bor_o = (~a_i & b_i) | (~a_i & bor_i) | (b_i & bor_i); // Assign Borrow
  end
  
endmodule