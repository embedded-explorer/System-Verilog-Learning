//----------------------------------------------------------------------------
// Title       : 4-Bit Parallel in Serial Out Register
// File        : piso_tb.sv
//----------------------------------------------------------------------------

module piso_tb();

  logic       clk_i   ;
  logic       rst_n_i ;
  logic       load_i  ;
  logic [3:0] data_i  ;
  logic       busy_o  ;
  logic       data_o  ;
  
  // Instantiation
  piso dut(.*);
  
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
    
    // Load parallel data
    wait(!busy_o);
    @(posedge clk_i);
    load_i  <= 1'b1;
    data_i  <= 4'h6;
    @(posedge clk_i);
    load_i  <= 1'b0;
      
    #80 $finish;
  end

endmodule