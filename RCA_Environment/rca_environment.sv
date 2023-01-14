//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Environment
// File        : environment.sv
//----------------------------------------------------------------------------

// Include necessary files
`include "rca_generator.sv"
`include "rca_driver.sv"
`include "rca_monitor.sv"
`include "rca_scoreboard.sv"

class environment;
  
  // Declare handle for virtual interface
  virtual intf vif;
  
  // Declare handle for generator to driver mailbox
  mailbox gen2drv;
  
  // Declare handle for monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // Declare handles for components
  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;
  
  // Override constructor to get virtual interface handle
  // Create objects of all components and connect
  function new (virtual intf vif);
    this.vif = vif;
    gen2drv  = new();
    mon2scb  = new();
	gen      = new(gen2drv);
	drv      = new(gen2drv, vif);
	mon      = new(mon2scb, vif);
    scb      = new(mon2scb);
  endfunction
  
  // Task to run all components
  task test();
    repeat(10) begin
      gen.main();
      drv.main();
	  #1;
      mon.main();
      scb.main();
	end
  endtask
  
  task run;
    test();
    $finish;
  endtask
    
endclass