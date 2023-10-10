//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Driver
// File        : driver.sv
//----------------------------------------------------------------------------

module driver(counter_if.drv_mp drv_if);
  
  // Task to generate directed inputs
  task run();
    // Initialize all the inputs
	drv_if.enable_i = 0;
	drv_if.load_i   = 0;
	drv_if.data_i   = 0;
	
    // Wait until reset is applied
    wait(!drv_if.rst_n_i); // Wait for reset to go low
    wait(drv_if.rst_n_i); // Wait for reset to go high
	
	// Let counter up count normally for 16 cycles
	@(posedge drv_if.clk_i);
	drv_if.enable_i <= 1'b1;
	repeat(16)
	  @(posedge drv_if.clk_i);
	  
	// Disable the Counter for 4 clock cycles
	@(posedge drv_if.clk_i);
	drv_if.enable_i <= 1'b0;
	repeat(4)
	  @(posedge drv_if.clk_i);
	  
	// Load parallel data and allow up counting
	@(posedge drv_if.clk_i);
	drv_if.enable_i <= 1'b1;
	drv_if.load_i   <= 1'b1;
	drv_if.data_i   <= 4'h7;
	@(posedge drv_if.clk_i);
	drv_if.load_i   <= 1'b0;
	repeat(10)
	  @(posedge drv_if.clk_i);
	  
	$finish;
	
  endtask
  
  // Invoke run task
  initial run;

endmodule
