//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

class generator;

  // Declare handle for transaction object
  transaction trans;
  
  // Declare handle for mailbox handle
  mailbox mbox;
  
  // Override constructor to get mailbox handle
  function new(mailbox mbox);
    this.mbox = mbox;
  endfunction
  
  // Define task to generate random packets
  task run();
    trans = new();             // Create transaction object
    assert(trans.randomize()); // Randomize transaction
    mbox.put(trans);           // Post the transaction to mailbox
    $display($time, " [Generator] : Address : %0x", trans.address_bus);
  endtask
  
endclass