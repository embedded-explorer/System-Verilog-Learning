//----------------------------------------------------------------------------
// Title       : D Flip Flop Testbench
// File        : d_ff_tb.sv
//----------------------------------------------------------------------------


// Active High reset D-FF Testbench
module d_ff_tb();

  logic clk_i;
  logic rst_i;
  logic d_i  ;
  logic q_o  ;
  logic qb_o ;
  
  d_ff dut(.*);
  
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Assign inputs to known values
    rst_i = 1'b0;
    d_i   = 1'b1;
    
    // Apply Reset
    #7
    rst_i = 1'b1;
    #15;
    rst_i = 1'b0;
    
    // Drive inputs
    for(int i=0; i<4; i++) begin
      d_i = i;
      // Change inputs after 2 clock cycles
      repeat(2)
        @(negedge clk_i);
    end
    #2 $finish;
  end

endmodule

/*
// Active Low reset D-FF Testbench
module d_ff_tb();

  logic clk_i  ;
  logic rst_n_i;
  logic d_i    ;
  logic q_o    ;
  logic qb_o   ;
  
  d_ff dut(.*);
  
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Assign inputs to known values
    rst_n_i = 1'b1;
    d_i     = 1'b1;
    
    // Apply Reset
    #7
    rst_n_i = 1'b0;
    #15;
    rst_n_i = 1'b1;
    
    // Drive inputs
    for(int i=0; i<4; i++) begin
      d_i = i;
      // Change inputs after 2 clock cycles
      repeat(2)
        @(negedge clk_i);
    end
    #2 $finish;
  end

endmodule
*/