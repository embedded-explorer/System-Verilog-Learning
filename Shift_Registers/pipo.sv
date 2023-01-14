//----------------------------------------------------------------------------
// Title       : 4-Bit Parallel in Parallel Out Shift Register
// File        : pipo.sv
//----------------------------------------------------------------------------

module pipo(
  input              clk_i   , // Clock input
  input              rst_n_i , // Active high reset
  input              load_i  , // Load input
  input        [3:0] data_i  , // Parallel data input
  output logic [3:0] data_o    // Parallel data output
);

  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
    // Clear output upon reset
      data_o <= 4'h0;
    end else begin
      if(load_i) begin
        data_o <= data_i;
      end
    end
  end
  
endmodule