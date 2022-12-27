//----------------------------------------------------------------------------
// Title       : 1 to 8 Demultiplexer
// File        : demux_1_to_8.sv
//----------------------------------------------------------------------------

module demux_1_to_8(
  input              d_i  , // Data Input
  input        [2:0] sel_i, // Select Line
  output logic [7:0] y_o    // Data Output
);

  always_comb begin
    y_o = 8'h00; // Default Assignment
    case(sel_i)
      3'b000 : y_o[0] = d_i;
      3'b001 : y_o[1] = d_i;
      3'b010 : y_o[2] = d_i;
      3'b011 : y_o[3] = d_i;
      3'b100 : y_o[4] = d_i;
      3'b101 : y_o[5] = d_i;
      3'b110 : y_o[6] = d_i;
      3'b111 : y_o[7] = d_i;
    endcase
  end
  
endmodule