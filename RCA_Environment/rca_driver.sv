//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Driver
// File        : driver.sv
//----------------------------------------------------------------------------

class driver;
  
  // Declare handle for transaction object
  transaction trans;
  
  // Declare virtual interface handle
  virtual intf vif;
  
  // Declare handle for generator to driver mailbox
  mailbox gen2drv;
  
  // Override constructor to get mailbox and virtual interface handle
  function new(mailbox gen2drv, virtual intf vif);
    this.gen2drv = gen2drv;
	this.vif     = vif    ;
  endfunction
  
  // Task to get transactions and drive duv signals
  task main;
    trans = new();             // Create transaction object
    gen2drv.get(trans);        // Get transaction from mailbox
    vif.a_i = trans.a_i;       // Drive inputs
    vif.b_i = trans.b_i;
	vif.c_i = trans.c_i;
    trans.display("[Driver]"); // Display the packet driven
  endtask
    
endclass