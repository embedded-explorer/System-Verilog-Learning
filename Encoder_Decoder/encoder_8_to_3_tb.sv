//----------------------------------------------------------------------------
// Title       : 8 to 3 Encoder Testbench
// File        : encoder_8_to_3_tb.sv
//----------------------------------------------------------------------------

module decoder_3_to_8_tb();

  logic [7:0] d_i;
  logic [2:0] y_o  ;

  // Instantiation
  encoder_8_to_3 dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 8'h00;
    
    for(int i=0; i<8; i++) begin
      d_i = (8'h1 << i);
      #10;
      case(d_i)
        8'b00000001 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00000010 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00000100 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00001000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00010000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00100000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b01000000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b10000000 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        default     : $display($time, " : Undefined Input");
      endcase
    end
    #10 $finish;
  end
  
endmodule