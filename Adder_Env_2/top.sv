//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Top Level Testbench
// File        : top.sv
//----------------------------------------------------------------------------

`include "adder_if.sv"
`include "test.sv"

module top();

  adder_if intf();
  
  // Instantiate Design 
  adder dut(
    .a_i(intf.a),
    .b_i(intf.b),
    .s_o(intf.s)
  );
  
  test test = new(intf);
  
  initial begin
    test.run_test();
    #100 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
