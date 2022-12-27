//----------------------------------------------------------------------------
// Title       : 8 to 1 Multiplexer
// File        : mux_8_to_1.sv
//----------------------------------------------------------------------------

module mux_8_to_1(
  input        [7:0] d_i  , // Data Input 
  input        [2:0] sel_i, // Select Line
  output logic       y_o    // Data Output
);

  always_comb begin
    case(sel_i)
      3'b000 : y_o = d_i[0];
      3'b001 : y_o = d_i[1];
      3'b010 : y_o = d_i[2];
      3'b011 : y_o = d_i[3];
      3'b100 : y_o = d_i[4];
      3'b101 : y_o = d_i[5];
      3'b110 : y_o = d_i[6];
      3'b111 : y_o = d_i[7];
      default: y_o = 1'bz;
    endcase
  end
  
endmodule