//----------------------------------------------------------------------------
// Title       : 4-Bit Serial in Parallel Out Shift Register
// File        : sipo_tb.sv
//----------------------------------------------------------------------------

module sipo_tb();

  logic       clk_i   ;
  logic       rst_n_i ;
  logic       data_i  ;
  logic       valid_o ;
  logic [3:0] data_o  ;
  
  // Instantiation
  sipo dut(.*);
  
  // Clock Generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Initialize all inputs
    rst_n_i = 1'b1;
    data_i  = 1'b0;

    // Apply Reset
    @(posedge clk_i);
    rst_n_i <= 1'b0;
    @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Load data serially
    for(int i=0; i<4; i++) begin
      data_i <= i;
      @(posedge clk_i);
    end
      
    #20 $finish;
  end

endmodule