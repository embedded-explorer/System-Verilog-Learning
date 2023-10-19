//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Test Case
// File        : test.sv
//---------------------------------------------------------------------------

`include "environment.sv"

class test;

  // Declare handle for environment
  environment env;
  
  virtual adder_if intf;
  
  // Override the constructor to create object of Environment
  // Pass the interface handle to Environment
  function new(virtual adder_if intf);
    intf = intf;
    env  = new(intf);
  endfunction
  
  // Task to run the environment
  task run_test();
    env.run();
  endtask

endclass
