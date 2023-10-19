//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Test
// File        : test.sv
//----------------------------------------------------------------------------

`include "environment.sv"

class test;

  // Declare handle for environment
  environment env;
  
  virtual multiplier_if intf;
  
  // Override the constructor to create object of Environment
  // Pass the interface handle to Environment
  function new(virtual multiplier_if intf);
    this.intf = intf;
    env  = new(intf);
  endfunction
  
  // Task to run the environment
  task run_test();
    env.run();
  endtask

endclass