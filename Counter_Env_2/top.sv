`include "counter_if.sv"
`include "test.sv"

module top();

  logic clk_i;
  logic rst_i;
  
  // Instantiate Interface
  counter_if intf(clk_i, rst_i);
  
  // Instantiate Design
  counter duv(
    .clk_i    (clk_i        ),
    .rst_i    (rst_i        ),
    .enable_i (intf.enable_i),
    .load_i   (intf.load_i  ),
    .data_i   (intf.data_i  ),
    .count_o  (intf.count_o )
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
    rst_i = 0;
	@(posedge clk_i);
	rst_i <= 1;
	repeat(2)
	  @(posedge clk_i);
	rst_i <= 0;
  end
  
  // Dump VCD
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
