//----------------------------------------------------------------------------
// Title       : 8 to 3 Encoder
// File        : encoder_8_to_3.sv
//----------------------------------------------------------------------------

module encoder_8_to_3(
  input        [7:0] d_i , // Input
  output logic [2:0] y_o   // Output
);

  always_comb begin
    case(d_i)
      8'b00000001 : y_o = 3'b000;
      8'b00000010 : y_o = 3'b001;
      8'b00000100 : y_o = 3'b010;
      8'b00001000 : y_o = 3'b011;
      8'b00010000 : y_o = 3'b100;
      8'b00100000 : y_o = 3'b101;
      8'b01000000 : y_o = 3'b110;
      8'b10000000 : y_o = 3'b111;
      default     : y_o = 3'bzzz;
    endcase
  end
  
endmodule