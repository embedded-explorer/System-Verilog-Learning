//----------------------------------------------------------------------------
// Title       : Half Adder
// File        : half_adder.sv
//----------------------------------------------------------------------------

module half_adder(
  input        a_i, // Input A
  input        b_i, // Input B
  output logic s_o, // Sum
  output logic c_o  // Carry Output
);

  always_comb begin
    s_o = a_i ^ b_i; // Assign Sum
    c_o = a_i & b_i; // Assign Carry
  end
  
endmodule