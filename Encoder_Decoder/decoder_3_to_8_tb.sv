//----------------------------------------------------------------------------
// Title       : 3 to 8 Decoder Testbench
// File        : decoder_3_to_8_tb.sv
//----------------------------------------------------------------------------

module decoder_3_to_8_tb();

  logic [2:0] d_i;
  logic [7:0] y_o  ;

  // Instantiation
  decoder_3_to_8 dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 3'b000;
    
    for(int i=0; i<8; i++) begin
      d_i = i;
      #10;
      case(d_i)
        3'b000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b001 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b010 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b011 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b100 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b101 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b110 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        3'b111 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        default: $display($time, " : Undefined Input");
      endcase
    end
    #10 $finish;
  end
  
endmodule