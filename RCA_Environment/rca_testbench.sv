//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Top Level Testbench
// File        : rca_testbench.sv
//----------------------------------------------------------------------------

`include "rca_package.sv"
import rca_package::*;
`include "rca_interface.sv"
`include "rca_test.sv"
`include "rca_design.sv"

module top();
    
  intf intf();
    
  test test(intf);
        
  ripple_carry_adder duv(intf);
    
endmodule