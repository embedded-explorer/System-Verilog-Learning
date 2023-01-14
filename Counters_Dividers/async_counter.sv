//----------------------------------------------------------------------------
// Title       : 4-Bit Asynchronous Counter
// File        : async_counter.sv
//----------------------------------------------------------------------------

module async_counter(
  input              clk_i  , // Clock input
  input              rst_n_i, // Active low synchronous reset
  output logic [3:0] q_o      // Counter output
);
  
  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i) q_o[0] <= 1'b0   ;
    else         q_o[0] <= ~q_o[0];
  end
  
  always_ff @(posedge ~q_o[0], negedge rst_n_i) begin
    if(!rst_n_i) q_o[1] <= 1'b0   ;
    else         q_o[1] <= ~q_o[1];
  end
  
  always_ff @(posedge ~q_o[1], negedge rst_n_i) begin
    if(!rst_n_i) q_o[2] <= 1'b0   ;
    else         q_o[2] <= ~q_o[2];
  end
  
  always_ff @(posedge ~q_o[2], negedge rst_n_i) begin
    if(!rst_n_i) q_o[3] <= 1'b0   ;
    else         q_o[3] <= ~q_o[3];
  end
  
endmodule