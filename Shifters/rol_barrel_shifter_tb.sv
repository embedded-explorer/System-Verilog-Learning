//----------------------------------------------------------------------------
// Design      : 4-Bit Rotate Left Barrel Shifter Testbench
// File        : rol_barrel_shifter_tb.sv
//----------------------------------------------------------------------------

module rol_barrel_shifter_tb();

  logic [3:0] a_i  ;
  logic [1:0] amt_i;
  logic [3:0] y_o  ;
  
  // Instantiation
  rol_barrel_shifter dut(.*);

  // Input Generation
  initial begin
    a_i   = 4'b1011;
    amt_i = 2'b00  ;
    
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    #10 $finish;
  end
  
endmodule