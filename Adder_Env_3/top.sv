`include "adder_if.sv"
`include "test.sv"

module top();
  
  // Instantiate Interface
  adder_if intf();
  
  // Instantiate Design
  adder duv(
    .a_i (intf.a_i ),
	.b_i (intf.b_i ),
	.s_o (intf.s_o )
  );
  
  // Instantiate Test
  test test_h(intf.drv_mp, intf.mon_mp);
  
  // Dump VCD
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
