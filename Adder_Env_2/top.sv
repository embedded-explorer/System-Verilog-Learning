//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Top Level Testbench
// File        : top.sv
//---------------------------------------------------------------------------

`include "adder_if.sv"
`include "test.sv"

module top();
  
  // Instntiate interface
  adder_if intf();
  
  // Instantiate Design 
  adder dut(intf.dut_mp);
  
  // Create an object of test
  test test = new(intf);
  
  // Run the test
  initial begin
    test.run_test();
    #10 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
