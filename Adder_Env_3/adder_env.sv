`include "adder_trans.sv"
`include "adder_gen.sv"
`include "adder_drv.sv"
`include "adder_mon.sv"
`include "adder_scb.sv"

class adder_env;
  
  // Virtual interface Handles
  virtual adder_if.drv_mp drv_if;
  virtual adder_if.mon_mp mon_if;
  
  // Handles for TB components
  adder_gen gen_h;
  adder_drv drv_h;
  adder_mon mon_h;
  adder_scb scb_h;
  
  // Handles for mailboxes
  mailbox gen2drv;
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual adder_if.drv_mp drv_if, // Get Virtual interface handle
    virtual adder_if.mon_mp mon_if  // Get Virtual interface handle
  );
    this.drv_if = drv_if;
	this.mon_if = mon_if;
	gen2drv = new();                // Create object for mailbox
	mon2scb = new();
	gen_h   = new(gen2drv);         // Create object for generator
	drv_h   = new(drv_if, gen2drv); // Create object for driver
	mon_h   = new(mon_if, mon2scb);
	scb_h   = new(mon2scb);
  endfunction
  
  // Task to start TB components
  task start();
	gen_h.start();
	drv_h.start();
	mon_h.start();
	scb_h.start();
  endtask
  
endclass