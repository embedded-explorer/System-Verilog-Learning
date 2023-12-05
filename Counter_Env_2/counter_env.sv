`include "counter_trans.sv"
`include "counter_gen.sv"
`include "counter_drv.sv"
`include "counter_mon.sv"
`include "counter_scb.sv"

class counter_env;
  
  // Virtual interface Handles
  virtual counter_if.drv_mp drv_if;
  virtual counter_if.mon_mp mon_if;
  
  // Handles for TB components
  counter_gen gen_h;
  counter_drv drv_h;
  counter_mon mon_h;
  counter_scb scb_h;
  
  // Handles for mailboxes
  mailbox gen2drv;
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual counter_if.drv_mp drv_if, // Get Virtual interface handle
    virtual counter_if.mon_mp mon_if  // Get Virtual interface handle
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
	gen_h.start("up_count");
	drv_h.start();
	repeat(10) begin
	  mon_h.start();
	  scb_h.start();
	end
  endtask
  
endclass