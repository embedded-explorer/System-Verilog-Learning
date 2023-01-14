//----------------------------------------------------------------------------
// Title       : 4-Bit Parallel in Parallel Out Shift Register
// File        : pipo_tb.sv
//----------------------------------------------------------------------------

module pipo_tb();

  logic       clk_i   ;
  logic       rst_n_i ;
  logic       load_i  ;
  logic [3:0] data_i  ;
  logic [3:0] data_o  ;
  
  // Instantiation
  pipo dut(.*);
  
  // Clock Generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Initialize all inputs
    rst_n_i = 1'b1;
    load_i  = 1'b0;
    data_i  = 4'h0;

    // Apply Reset
    @(posedge clk_i);
    rst_n_i <= 1'b0;
    @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Apply inputs
    @(posedge clk_i);
    load_i <= 1'b1;
    data_i <= 4'h7;
    @(posedge clk_i);
    load_i <= 1'b0;
    
    @(posedge clk_i);
    load_i <= 1'b1;
    data_i <= 4'h7;
    @(posedge clk_i);
    load_i <= 1'b0;
      
    #20 $finish;
  end

endmodule