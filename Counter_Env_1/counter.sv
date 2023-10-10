//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : 4-Bit Counter
// File        : counter.sv
//----------------------------------------------------------------------------

module counter(counter_if.dut_mp dut_if);
  
  assign dut_if.even_o = ~dut_if.count_o[0];
  
  always_ff @(posedge dut_if.clk_i, negedge dut_if.rst_n_i)begin
    if(!dut_if.rst_n_i)begin
	  dut_if.count_o <= 4'h0;
	end else begin
      if(dut_if.enable_i)begin
	    if(dut_if.load_i)begin
	      dut_if.count_o <= dut_if.data_i;
	    end else begin
	      dut_if.count_o <= dut_if.count_o + 1'b1;
	    end
      end
	end
  end

endmodule