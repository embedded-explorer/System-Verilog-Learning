//----------------------------------------------------------------------------
// Title       : Single Port RAM Verification Environment
// Design      : Environment
// File        : ram_env.sv
//----------------------------------------------------------------------------

`include "ram_trans.sv"
`include "ram_gen.sv"
`include "ram_drv.sv"
`include "ram_mon.sv"
`include "ram_scb.sv"

class ram_env;
  
  // Virtual interface Handles
  virtual ram_if.drv_mp drv_if;
  virtual ram_if.mon_mp mon_if;
  
  // Handles for TB components
  ram_gen gen_h;
  ram_drv drv_h;
  ram_mon mon_h;
  ram_scb scb_h;
  
  // Handles for mailboxes
  mailbox gen2drv;
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual ram_if.drv_mp drv_if, // Get Virtual interface handle
    virtual ram_if.mon_mp mon_if  // Get Virtual interface handle
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
	gen_h.start("write_read");
	drv_h.start("write_read");
	mon_h.start();
	scb_h.start("write_read");
  endtask
  
endclass