//----------------------------------------------------------------------------
// Title       : Priority Encoder Immediate Assertions
// Design      : priority_encoder
// File        : priority_encoder.sv
//----------------------------------------------------------------------------
module priority_encoder(
  input        [3:0] i_i,
  output logic [1:0] y_o     
);

  always_comb begin
    casez(i_i)
	  4'b0001: y_o = 2'b00;
	  4'b001?: y_o = 2'b01;
	  4'b01??: y_o = 2'b10;
	  4'b1???: y_o = 2'b11;
	  default: y_o = 2'bzz;
	endcase
  end

endmodule