//----------------------------------------------------------------------------
// Title       : 4-Bit Synchronous Counter
// File        : sync_counter.sv
//----------------------------------------------------------------------------

module sync_counter(
  input              clk_i  , // Clock input
  input              rst_n_i, // Active low synchronous reset
  output logic [3:0] q_o      // Counter output
);
  
  logic [3:0] d;
  
  // Assign inputs
  always_comb begin
    d[0] = ~q_o[0];
    d[1] = q_o[0] ^ q_o[1];
    d[2] = (~q_o[2] & q_o[1] & q_o[0])   |
           (q_o[2] & (~q_o[0] | ~q_o[1]));
    d[3] = (~q_o[3] & q_o[2] & q_o[1] & q_o[0])    |
           (q_o[3] & (~q_o[2] | ~q_o[1] | ~q_o[0]));
  end
  
  always_ff @(posedge clk_i) begin
    if(!rst_n_i) begin
      q_o <= 4'h0;
    end else begin
      q_o[0] <= d[0];
      q_o[1] <= d[1];
      q_o[2] <= d[2];
      q_o[3] <= d[3];
    end
  end
  
endmodule