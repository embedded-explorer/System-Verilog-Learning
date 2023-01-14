//----------------------------------------------------------------------------
// Title       : 4-Bit Serial In Serial Out Shift Register
// File        : siso_tb.sv
//----------------------------------------------------------------------------

module siso_tb();

  logic clk_i   ;
  logic rst_n_i ;
  logic dir_i   ;
  logic data_i  ;
  logic data_o  ;
  
  // Instantiation
  siso dut(.*);
  
  // Clock Generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Initialize all inputs
    rst_n_i = 1'b1;
    dir_i   = 1'b0;
    data_i  = 1'b0;

    // Apply Reset
    @(posedge clk_i);
    rst_n_i <= 1'b0;
    @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Shift Left Operation testing
    for(int i=0; i<4; i++) begin
      data_i <= i;
      @(posedge clk_i);
    end
    
    // Wait until all data is shifted
    data_i <= 1'b0;
    repeat(4)
      @(posedge clk_i);
      
    // Apply Reset
    @(posedge clk_i);
    rst_n_i <= 1'b0;
    @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Shift Right Operation testing
    dir_i <= 1'b1;
    for(int i=0; i<4; i++) begin
      data_i <= i;
      @(posedge clk_i);
    end
    
    // Wait until all data is shifted
    data_i <= 1'b0;
    repeat(4)
      @(posedge clk_i);
      
    #20 $finish;
  end

endmodule