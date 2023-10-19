//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Driver
// File        : driver.sv
//----------------------------------------------------------------------------

class driver;

  virtual multiplier_if.drv_mp drv_if;

  // Override the constructor to connect with interface
  function new(virtual multiplier_if.drv_mp intf);
    this.drv_if = intf;
  endfunction
  
  // Task to drive input signals of interface
  // Get the values from generator
  task drive(input logic[3:0] p, input logic[3:0] q);
    @(posedge drv_if.clock);
    drv_if.start <= 1'b1;
	@(posedge drv_if.clock);
	drv_if.start <= 1'b0;
	drv_if.data_in <= p;
	@(posedge drv_if.clock);
	drv_if.data_in <= q;
  endtask
  
endclass