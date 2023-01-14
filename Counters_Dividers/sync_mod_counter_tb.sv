//----------------------------------------------------------------------------
// Title       : Synchronous Mod 10 Up Counter Counter Testbench
// File        : sync_mod_counter_tb.sv
//----------------------------------------------------------------------------

module sync_mod_counter_tb();

  logic       clk_i  ;
  logic       rst_n_i;
  logic [3:0] data_o ;

  sync_mod_counter dut(.*);
  
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    rst_n_i = 1'b1;
    
    // Apply Reset
    #10 rst_n_i = 1'b0;
    #10 rst_n_i = 1'b1;    

  end
  
endmodule