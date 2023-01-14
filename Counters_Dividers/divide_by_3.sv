//----------------------------------------------------------------------------
// Title       : Divide by 3
// File        : divide_by_3.sv
//----------------------------------------------------------------------------

module divide_by_3(
  input              clk_i  , // Clock input
  input              rst_n_i, // Active low synchronous reset
  output logic       q_o      // Output
);
  
  logic [1:0] q  ;
  logic       q_n;
  
  // Assign output
  always_comb begin
    q_o = q[1] | q_n;
  end
  
  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i) begin
      q <= 2'b00;
    end else begin
      q[0] <= ~q[0] & ~q[1];
      q[1] <= q[0]         ;
    end
  end
  
  always_ff @(negedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i) begin
      q_n <= 1'b0;
    end else begin
      q_n <= q[1];
    end
  end
  
endmodule