//----------------------------------------------------------------------------
// Title       : Half Subtractor
// File        : half_subtractor.sv
//----------------------------------------------------------------------------

module half_subtractor(
  input        a_i, // Input A
  input        b_i, // Input B
  output logic d_o, // Difference
  output logic b_o  // Borrow
);

  always_comb begin
    d_o = a_i ^ b_i ; // Assign Difference
    b_o = ~a_i & b_i; // Assign Borrow
  end
  
endmodule