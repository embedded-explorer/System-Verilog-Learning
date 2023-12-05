//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

class monitor;

  // Declare handle for virtual interface
  virtual intf v_if;
  
  // Override constructor to get mailbox and interface handle
  function new(virtual intf v_if);
    this.v_if = v_if;
  endfunction
  
  // Define task to monitor DUT signals
  task run();
    wait(v_if.start); // Wait until start goes high
    $display($time, " [Monitor] : Address : %0x", v_if.address_bus);
    wait(!v_if.start); // Wait until start goes low
  endtask
  
endclass