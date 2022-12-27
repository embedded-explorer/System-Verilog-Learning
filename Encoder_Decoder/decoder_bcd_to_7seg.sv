//----------------------------------------------------------------------------
// Title       : BCD to Common Cathode 7-Segment Decoder
// File        : decoder_bcd_to_7seg.sv
//----------------------------------------------------------------------------

module decoder_bcd_to_7seg(
  input        [3:0] d_i , // Input
  output logic [6:0] y_o   // Output
);

  always_comb begin
    case(d_i)
      4'b0000 : y_o = 7'b1111110;
      4'b0001 : y_o = 7'b0110000;
      4'b0010 : y_o = 7'b1101101;
      4'b0011 : y_o = 7'b1111001;
      4'b0100 : y_o = 7'b1111001;
      4'b0101 : y_o = 7'b1011011;
      4'b0110 : y_o = 7'b1011111;
      4'b0111 : y_o = 7'b1110000;
      4'b1000 : y_o = 7'b1111111;
      4'b1001 : y_o = 7'b1111011;
      default : y_o = 7'bzzzzzzz;
    endcase
  end
  
endmodule