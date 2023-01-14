//----------------------------------------------------------------------------
// Title       : Divide by 4
// File        : divide_by_4.sv
//----------------------------------------------------------------------------

module divide_by_4(
  input        clk_i,
  input        rst_i,
  output logic clk_o
);
  
  logic d;
  
  always_ff @(posedge clk_i, posedge rst_i) begin
    if(rst_i) begin
	  d <= 1'b0;
	end else begin
	  d <= ~d;
	end
  end
  
  always_ff @(posedge d, posedge rst_i) begin
    if(rst_i) begin
	  clk_o <= 1'b0;
	end else begin
	  clk_o <= ~clk_o;
	end
  end
  
endmodule
