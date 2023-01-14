//----------------------------------------------------------------------------
// Title       : Divide by 3 Testbench
// File        : divide_by_3_tb.sv
//----------------------------------------------------------------------------

module divide_by_3_tb();

  logic       clk_i  ;
  logic       rst_n_i;
  logic       q_o    ;

  divide_by_3 dut(.*);
  
  // 300MHz input clock, period = 3.33ns
  initial begin
    clk_i = 0;
    forever #(3.33/2) clk_i = ~clk_i;
  end
  
  initial begin
    rst_n_i = 1'b1;
    
    // Apply Reset
    #10 rst_n_i = 1'b0;
    #10 rst_n_i = 1'b1;

  end
  
endmodule