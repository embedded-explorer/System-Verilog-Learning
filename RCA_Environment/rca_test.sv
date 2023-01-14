//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Test Case
// File        : rca_test.sv
//----------------------------------------------------------------------------

`include "rca_environment.sv"

program test(intf intf);

  environment env;
    
  initial begin
    env = new(intf);
    env.run();
  end
    
endprogram