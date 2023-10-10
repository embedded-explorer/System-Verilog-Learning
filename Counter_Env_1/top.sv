//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Top Level Testbench
// File        : top.sv
//----------------------------------------------------------------------------

`include "counter_if.sv"
`include "environment.sv"

module top();
  logic clk_i  ; // Clock
  logic rst_n_i; // Asynchronous Reset
  
  // Instantiate Interface
  counter_if intf(clk_i, rst_n_i);
  
  // Instatiate Environment
  environment env(intf);
  
  // Instantiate Design 
  counter dut(intf.dut_mp);
  
  // Generate clock
  initial begin
    clk_i = 0;
	forever #5 clk_i = ~clk_i;
  end
  
  // Generate Reset
  initial begin
    rst_n_i = 0;
	#35 rst_n_i = 1; // Remove reset
  end
  
  // Dump VCD
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
