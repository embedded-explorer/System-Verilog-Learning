//----------------------------------------------------------------------------
// Title       : D Latch Testbench
// File        : d_latch_tb.sv
//----------------------------------------------------------------------------

module d_latch_tb();

  logic en_i;
  logic d_i ;
  logic q_o ;
  logic qb_o;
  
  d_latch dut(.*);
  
  initial begin
    for(int i=3; i>=0; i--) begin
      {en_i, d_i} = i;
      #2;
    end
    #2 $finish;
  end

endmodule