//----------------------------------------------------------------------------
// Title       : 4-Bit Ripple Carry Adder
// File        : ripple_carry_adder.sv
//----------------------------------------------------------------------------

// Full Adder
module full_adder(
  input        a_i, // Input A
  input        b_i, // Input B
  input        c_i, // Carry Input
  output logic s_o, // Sum
  output logic c_o  // Carry Output
);

  always_comb begin
    {c_o, s_o} = a_i + b_i + c_i;
  end
  
endmodule

// Ripple Carry Adder using Full Adder
module ripple_carry_adder(
  input        [3:0] a_i,
  input        [3:0] b_i,
  input              c_i,
  output logic [3:0] s_o,
  output logic       c_o
);
  
  // Signal decleration for internal carry
  logic [2:0] c;
  
  // Instantiation of Full Adders
  full_adder FA_0(a_i[0], b_i[0], c_i , s_o[0], c[0]);
  full_adder FA_1(a_i[1], b_i[1], c[0], s_o[1], c[1]);
  full_adder FA_2(a_i[2], b_i[2], c[1], s_o[2], c[2]);
  full_adder FA_3(a_i[3], b_i[3], c[2], s_o[3], c_o );
  
endmodule