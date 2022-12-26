//----------------------------------------------------------------------------
// Title       : Full Adder
// File        : full_adder.sv
//----------------------------------------------------------------------------

module full_adder(
  input        a_i, // Input A
  input        b_i, // Input B
  input        c_i, // Carry Input
  output logic s_o, // Sum
  output logic c_o  // Carry Output
);
  
  // Assign carry and sum
  always_comb begin
    {c_o, s_o} = a_i + b_i + c_i;
  end
  
endmodule