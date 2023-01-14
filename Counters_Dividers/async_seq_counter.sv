//----------------------------------------------------------------------------
// Title       : Asynchronous Counter with 0,2,4,7 Sequence
// File        : async_seq_counter.sv
//----------------------------------------------------------------------------

module async_seq_counter(
  input              clk_i  , // Clock input
  input              rst_n_i, // Active low synchronous reset
  output logic [2:0] q_o      // Counter output
);
  
  always_comb begin
    q_o[0] = q_o[1] & q_o[2];
  end
  
  always_ff @(negedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i) q_o[1] <= 1'b0   ;
    else         q_o[1] <= ~q_o[1];
  end
  
  always_ff @(negedge q_o[1], negedge rst_n_i) begin
    if(!rst_n_i) q_o[2] <= 1'b0   ;
    else         q_o[2] <= ~q_o[2];
  end
  
endmodule