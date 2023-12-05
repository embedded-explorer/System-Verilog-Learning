//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

// Include necessary files
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

program test_case(intf intf);
  
  // Create mailbox object
  mailbox mbox = new();
  
  // Create generator object
  generator gen = new(mbox);;
  
  // Create driver object
  driver drv = new(mbox, intf);;
  
  // Craete monitor object
  monitor mon = new(intf);;
  
  initial begin
    wait(!intf.reset); // Wait until reset is applied
    wait(intf.reset) ; // Wait until reset is removed 
    
    repeat(10) begin
      gen.run();
      fork
        drv.run();
        mon.run();
      join
    end
    
  end

endprogram