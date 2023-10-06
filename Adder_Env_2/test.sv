//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Test Case
// File        : test.sv
//----------------------------------------------------------------------------

`include "environment.sv"

class test;

  // Instantiate Environment
  environment env;
  
  virtual adder_if intf;
  
  function new(virtual adder_if intf);
    intf = intf;
    env  = new(intf);
  endfunction
  
  task run_test();
    env.run();
  endtask

endclass
