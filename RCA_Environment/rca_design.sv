//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Ripple Carry Adder Design
// File        : rca_design.sv
//----------------------------------------------------------------------------

// Ripple Carry Adder using Full Adders
module ripple_carry_adder #(WIDTH = `ADDER_WIDTH)(intf.duv_mod intf);

  // Signal decleration for internal carry
  logic [WIDTH:0] c;
  
  // Assign carry in and carry out
  always_comb begin
    c[0]     = intf.c_i;
    intf.c_o = c[WIDTH];
  end
  
  // Instantiation of Full Adders
  genvar i;
  generate
    for(i=0; i<WIDTH; i++) begin
      full_adder fa(
        .a_i (intf.a_i[i]),
        .b_i (intf.b_i[i]),
        .c_i (c[i]       ),
        .s_o (intf.s_o[i]),
        .c_o (c[i+1]     )
      );
    end
  endgenerate
  
endmodule

// Single Bit Full Adder
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