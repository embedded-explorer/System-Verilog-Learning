//----------------------------------------------------------------------------
// Title       : Single Port RAM Verification Environment
// Design      : Top Level Testbench
// File        : top.sv
//----------------------------------------------------------------------------

`include "ram_if.sv"
`include "test.sv"

module top();
  logic clk_i  ; // Clock
  logic rst_n_i; // Asynchronous Reset
  
  // Instantiate Interface
  ram_if intf(clk_i, rst_n_i);
  
  // Instantiate Design
  ram duv(
    .clk_i       (clk_i           ),
	.rst_n_i     (rst_n_i         ),
	.ram_cs_i    (intf.ram_cs_i   ),
	.ram_we_i    (intf.ram_we_i   ),
	.ram_addr_i  (intf.ram_addr_i ),
	.ram_data_io (intf.ram_data_io)
  );
  
  // Instantiate Test
  test test_h(intf.drv_mp, intf.mon_mp);

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
