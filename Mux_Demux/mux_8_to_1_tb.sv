//----------------------------------------------------------------------------
// Title       : 8 to 1 Multiplexer Testbench
// File        : mux_8_to_1_tb.sv
//----------------------------------------------------------------------------

module mux_8_to_1_tb();

  logic [7:0] d_i  ;
  logic [2:0] sel_i;
  logic       y_o  ;

  // Instantiation
  mux_8_to_1 dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 8'b10101010;
    sel_i = 1'b000;
    
    for(int i=0; i<8; i++) begin
      sel_i = i;
      #10;
      if(d_i[i] == y_o) begin
        $display($time, " : A = %0b, SEL = %b, Y = %0b : PASS", d_i, sel_i, y_o);
      end else begin
        $display($time, " : A = %0b, SEL = %b, Y = %0b : FAIL", d_i, sel_i, y_o);
      end
    end
    #10 $finish;
  end
  
endmodule