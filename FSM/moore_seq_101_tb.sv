//----------------------------------------------------------------------------
// Title       : Testbench for Moore FSM to detect 101 sequence
// File        : moore_seq_101_tb.sv
//----------------------------------------------------------------------------

module moore_seq_101_tb();

  logic clk_i    ;
  logic rst_n_i  ;
  logic data_i   ;
  logic seq_det_o;
  
  // Instntiation
  moore_seq_101 dut(.*);
  
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Assign inputs to known values
    rst_n_i = 1'b1;
    data_i  = 1'b0;
    
    // Apply Reset
    @(posedge clk_i);
    rst_n_i <= 1'b0;
    @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Drive inputs
    repeat(15) begin
      data_i <= {$random}%2; // Apply random bit
      @(posedge clk_i);
    end
    
    #20 $finish;
  end

endmodule