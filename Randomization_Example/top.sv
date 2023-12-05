//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

// Include necessary files and import package
`include "packet_package.sv"
import packet_package::*;

`include "test.sv"
`include "interface.sv"

// Top Level Test Bench
module top();
  
  // Create interface instance
  intf intf();
  
  // Create test case instance
  test test(intf);
	
endmodule