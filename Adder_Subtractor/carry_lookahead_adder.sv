//----------------------------------------------------------------------------
// Title       : 4-Bit Carry Lookahead Adder
// File        : carry_lookahead_adder.sv
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

// Carry Lookahead Adder Using Full Adder
module carry_lookahead_adder(
  input        [3:0] a_i,
  input        [3:0] b_i,
  input              c_i,
  output logic [3:0] s_o,
  output logic       c_o
);
  
  // Internal signal declerations
  logic [5:0] c; // Intermediate Carry
  logic [3:0] p; // Propagate
  logic [3:0] g; // Generate
  
  // Generate, Gi = Ai * Bi
  always_comb begin
    g[0] = a_i[0] & b_i[0];
    g[1] = a_i[1] & b_i[1];
    g[2] = a_i[2] & b_i[2];
    g[3] = a_i[3] & b_i[3];
  end
  
  // Propagate, Pi = Ai + Bi
  always_comb begin
    p[0] = a_i[0] | b_i[0];
    p[1] = a_i[1] | b_i[1];
    p[2] = a_i[2] | b_i[2];
    p[3] = a_i[3] | b_i[3];
  end
  
  // Carry Generation, C(i+1) = Gi + Pi*Ci
  always_comb begin
    c[0] = c_i;
    c[1] = g[0] | (p[0] & c[0]);
    c[2] = g[1] | (p[1] & c[1]);
    c[3] = g[2] | (p[2] & c[2]);
    c[4] = g[3] | (p[3] & c[3]);
    c_o  = c[4];
  end
  
  // Instantiation of Full Adders
  full_adder FA_0(
    .a_i (a_i[0]), 
    .b_i (b_i[0]), 
    .c_i (c[0]  ), 
    .s_o (s_o[0]), 
    .c_o (      )
  );
  
  full_adder FA_1(
    .a_i (a_i[1]), 
    .b_i (b_i[1]), 
    .c_i (c[1]  ), 
    .s_o (s_o[1]), 
    .c_o (      )
  );

  full_adder FA_2(
    .a_i (a_i[2]), 
    .b_i (b_i[2]), 
    .c_i (c[2]  ), 
    .s_o (s_o[2]), 
    .c_o (      )
  );

  full_adder FA_3(
    .a_i (a_i[3]), 
    .b_i (b_i[3]), 
    .c_i (c[3]  ), 
    .s_o (s_o[3]), 
    .c_o (      )
  );
  
endmodule