//----------------------------------------------------------------------------
// Title       : BCD to Common Cathode 7-Segment Decoder Testbench
// File        : decoder_bcd_to_7seg_tb.sv
//----------------------------------------------------------------------------

module decoder_bcd_to_7seg_tb();

  logic [3:0] d_i;
  logic [6:0] y_o  ;

  // Instantiation
  decoder_bcd_to_7seg dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 3'b000;
    
    for(int i=0; i<10; i++) begin
      d_i = i;
      #10;
      case(d_i)
        4'b0000 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0001 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0010 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0011 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0100 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0101 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0110 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b0111 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b1000 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        4'b1001 : $display($time, " : IN = %d, OUT = %b : PASS", d_i, y_o);
        default : $display($time, " : Undefined Input");
      endcase
    end
    #10 $finish;
  end
  
endmodule