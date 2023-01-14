//----------------------------------------------------------------------------
// Title       : Divide by 2
// File        : divide_by_2.sv
//----------------------------------------------------------------------------

module divide_by_2(
  input        clk_i,
  input        rst_i,
  output logic clk_o
);
  
  always_ff @(posedge clk_i) begin
    if(rst_i) begin
	  clk_o <= 1'b0  ;
	end else begin
	  clk_o <= ~clk_o;
	end
  end
  
endmodule
