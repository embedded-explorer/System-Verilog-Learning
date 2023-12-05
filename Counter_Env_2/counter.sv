module counter(
  input              clk_i,
  input              rst_i,
  input              enable_i,
  input              load_i,
  input        [3:0] data_i,
  output logic [3:0] count_o
);
  
  always_ff @(posedge clk_i)begin
    if(rst_i)begin
	  count_o <= 4'h0;
	end else begin
	  if(enable_i)begin
	    if(load_i)begin
		  count_o <= data_i;
		end else begin
		  count_o <= count_o + 1'b1;
		end
	  end
	end
  end

endmodule