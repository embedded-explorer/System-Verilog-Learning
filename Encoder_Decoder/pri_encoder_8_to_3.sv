//----------------------------------------------------------------------------
// Title       : 8 to 3 Priority Encoder
// File        : pri_encoder_8_to_3.sv
//----------------------------------------------------------------------------

module pri_encoder_8_to_3(
  input        [7:0] d_i , // Input
  output logic [2:0] y_o   // Output
);

  always_comb begin
    if(d_i[7]) begin
      y_o = 3'b111;
    end else if(d_i[6]) begin
      y_o = 3'b110;
    end else if(d_i[5]) begin
      y_o = 3'b101;
    end else if(d_i[4]) begin
      y_o = 3'b100;
    end else if(d_i[3]) begin
      y_o = 3'b011;
    end else if(d_i[2]) begin
      y_o = 3'b010;
    end else if(d_i[1]) begin
      y_o = 3'b001;
    end else if(d_i[0]) begin
      y_o = 3'b000;
    end else begin
      y_o = 3'bzzz;
    end
  end
  
endmodule