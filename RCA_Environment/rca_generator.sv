//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Generator
// File        : generator.sv
//----------------------------------------------------------------------------

class generator;
  
  // Declare handle for transaction object
  transaction trans;
  
  // Declare handle for generator to driver mailbox
  mailbox gen2drv;
  
  // Override constructor to get mailbox handle
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  // Task to generate and post transaction on mailbox
  task main();
    trans = new();                // Create transaction object
    assert(trans.randomize());    // Randomize transaction
    trans.display("[Generator]"); // Display transaction packet
    gen2drv.put(trans);           // Post transaction on mailbox
  endtask
    
endclass