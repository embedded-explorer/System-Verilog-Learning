//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

class driver;

  // Declare handle for transaction object
  transaction trans;
  
  // Declare handle for mailbox handle
  mailbox mbox;
  
  // Declare handle for virtual interface
  virtual intf v_if;
  
  // Override constructor to get mailbox and interface handle
  function new(mailbox mbox, virtual intf v_if);
    this.mbox = mbox;
    this.v_if = v_if;
  endfunction
  
  // Define task to drive DUT signals
  task run();
    trans = new();             // Create transaction object
    mbox.get(trans);           // Get transaction from maibox
    wait(!v_if.ready);         // Wait until ready goes low
    @(negedge v_if.clock);     // Wait for 1 clock cycles
    v_if.start       = trans.start;       // Drive start signal
    v_if.address_bus = trans.address_bus; // Drive address
    $display($time, " [Driver] : Address : %0x", v_if.address_bus);
    @(negedge v_if.clock);     // Wait for 1 clock cycles
    v_if.start       = 1'b0;   // Clear start signal
  endtask
  
endclass