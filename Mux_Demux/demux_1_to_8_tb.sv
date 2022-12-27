//----------------------------------------------------------------------------
// Title       : 1 to 8 Demultiplexer Testbench
// File        : demux_1_to_8_tb.sv
//----------------------------------------------------------------------------

module demux_1_to_8_tb();

  logic       d_i  ;
  logic [2:0] sel_i;
  logic [7:0] y_o  ;

  // Instantiation
  demux_1_to_8 dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 1'b1;
    sel_i = 1'b000;
    
    for(int i=0; i<8; i++) begin
      sel_i = i;
      #10;
      if(d_i == y_o[i]) begin
        $display($time, " : A = %0b, SEL = %b, Y = %b : PASS", d_i, sel_i, y_o);
      end else begin
        $display($time, " : A = %0b, SEL = %b, Y = %b : FAIL", d_i, sel_i, y_o);
      end
    end
    #10 $finish;
  end
  
endmodule