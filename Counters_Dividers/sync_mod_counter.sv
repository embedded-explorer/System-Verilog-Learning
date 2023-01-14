//----------------------------------------------------------------------------
// Title       : Synchronous Mod 10 Up Counter
// File        : sync_mod_counter.sv
//----------------------------------------------------------------------------

module sync_mod_counter(
  input              clk_i  , // Clock input
  input              rst_n_i, // Active low synchronous reset
  output logic [3:0] data_o   // Counter output
);
  
  always_ff @(posedge clk_i) begin
    if(!rst_n_i) begin
      data_o <= 4'h0;
    end else begin
      if(data_o >= 9) begin
      // Clear when count reaches 9
        data_o <= 4'h0;
      end else begin
        data_o <= data_o + 1'b1;
      end
    end
  end
  
endmodule