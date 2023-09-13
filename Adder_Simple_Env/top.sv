//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Top Level Testbench
// File        : top.sv
//----------------------------------------------------------------------------

module top();

  // Instantiate Environment
  environment env();
  
  // Instantiate Design 
  adder dut(
    .a_i(env.adder_if.a),
    .b_i(env.adder_if.b),
    .s_o(env.adder_if.s)
  );

endmodule
