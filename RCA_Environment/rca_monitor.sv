//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Monitor
// File        : monitor.sv
//----------------------------------------------------------------------------

class monitor;

  // Declare handle for transaction object
  transaction trans;
  
  // Declare virtual interface handle
  virtual intf vif;
  
  // Declare handle for monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // Override constructor to get mailbox and virtual interface handle
  function new(mailbox mon2scb, virtual intf vif);
    this.mon2scb = mon2scb;
    this.vif     = vif    ;
  endfunction
  
  // Task to monitor duv signals and post transaction
  task main();
    trans = new();              // Create transaction object
    trans.a_i = vif.a_i;        // Monitor DUV Signals
    trans.b_i = vif.b_i;
    trans.c_i = vif.c_i;
    trans.s_o = vif.s_o;
    trans.c_o = vif.c_o;
    mon2scb.put(trans);         // Post transaction to mailbox
    trans.display("[Monitor]"); // Display the packet formed
  endtask
  
endclass