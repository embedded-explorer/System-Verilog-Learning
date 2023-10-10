//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Environment
// File        : environment.sv
//----------------------------------------------------------------------------

`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

module environment(counter_if intf);
  
  // Instantiate TB components and make connections
  driver drv(intf.drv_mp);
  monitor mon(intf.mon_mp);
  scoreboard scb(intf.mon_mp);
  
endmodule
