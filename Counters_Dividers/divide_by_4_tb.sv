//----------------------------------------------------------------------------
// Title       : Divide by 4 Testbench
// File        : divide_by_4_tb.sv
//----------------------------------------------------------------------------

module divide_by_4_tb();

  logic       clk_i  ;
  logic       rst_i  ;
  logic       clk_o  ;

  divide_by_4 dut(.*);
  
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    rst_i = 1'b0;
    
    // Apply Reset
	@(posedge clk_i);
    rst_i = 1'b1;
	@(posedge clk_i);
    rst_i = 1'b0;

  end
  
endmodule