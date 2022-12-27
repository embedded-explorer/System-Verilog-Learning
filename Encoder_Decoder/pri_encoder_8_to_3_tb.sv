//----------------------------------------------------------------------------
// Title       : 8 to 3 Priority Encoder Testbench
// File        : pri_encoder_8_to_3_tb.sv
//----------------------------------------------------------------------------

module pri_encoder_8_to_3_tb();

  logic [7:0] d_i;
  logic [2:0] y_o  ;

  // Instantiation
  pri_encoder_8_to_3 dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    d_i   = 8'h00;
    
    for(int i=0; i<8; i++) begin
      d_i[i] = 1'b1;
      #10;
      casex(d_i)
        8'b00000001 : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b0000001X : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b000001XX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b00001XXX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b0001XXXX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b001XXXXX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b01XXXXXX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        8'b1XXXXXXX : $display($time, " : IN = %b, OUT = %b : PASS", d_i, y_o);
        default     : $display($time, " : Undefined Input");
      endcase
    end
    #10 $finish;
  end
  
endmodule