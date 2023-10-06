//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Environment
// File        : environment.sv
//----------------------------------------------------------------------------

module environment();
  
  // Instantiate Interface
  adder_if adder_if();
  
  // Instantiate TB components and make connections
  driver drv(adder_if.drv_if);
  monitor mon(adder_if.mon_if);
  scoreboard scb(adder_if.mon_if);
  
endmodule
