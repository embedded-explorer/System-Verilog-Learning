//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Monitor
// File        : monitor.sv
//----------------------------------------------------------------------------

module monitor(counter_if.mon_mp mon_if);
  
  // Display
  initial begin
    $monitor($time, "ns Reset:%b, Enable:%b, Load:%b, Data:%d, Count:%d, Even:%b",
	         mon_if.rst_n_i, mon_if.enable_i, mon_if.load_i, 
			 mon_if.data_i, mon_if.count_o, mon_if.even_o);
  end

endmodule
