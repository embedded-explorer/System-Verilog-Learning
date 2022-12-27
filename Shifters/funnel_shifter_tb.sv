//----------------------------------------------------------------------------
// Design      : 4-Bit Funnel Shifter Testbench
// File        : funnel_shifter_tb.sv
//----------------------------------------------------------------------------

module funnel_shifter_tb();

  logic [3:0] a_i  ;
  logic [1:0] amt_i;
  logic [2:0] mode_i;
  logic [3:0] y_o  ;
  
  // Instantiation
  funnel_shifter dut(.*);
  
  // Input Generation
  initial begin
    a_i    = 4'b1101;
    mode_i = 3'b000 ;
    amt_i  = 2'b00  ;
    
    // Test Case - 1 - Logical Right Shift
    mode_i = 3'b000 ;
    #10 $display("----------------- Logical Right Shift Operation -----------------");
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    
    // Test Case - 2 - Logical Left Shift
    mode_i = 3'b001 ;
    #10 $display("------------------ Logical Left Shift Operation -----------------");
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    
    // Test Case - 3 - Arithmetic Right Shift
    mode_i = 3'b010 ;
    #10 $display("--------------------- Arithmetic Right Shift --------------------");
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    
    // Test Case - 4 - Arithmetic Left Shift
    mode_i = 3'b011 ;
    #10 $display("--------------------- Arithmetic Left Shift ---------------------");
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    
    // Test Case - 5 - Rotate Right
    mode_i = 3'b100 ;
    #10 $display("--------------------- Rotate Right Operation --------------------");
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    
    // Test Case - 6 - Rotate Left
    mode_i = 3'b101 ;
    #10 $display("---------------------- Rotate Left Operation --------------------");
    a_i    = 4'b1101;
    for(int i=0; i<4; i++) begin
      amt_i = i;
      #10;
      $display($time, " : Input : %b, Shift Amount : %b, Output : %b", a_i, amt_i, y_o);
    end
    #10 $finish;
  end
  
endmodule