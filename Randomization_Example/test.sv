//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

`include "generator.sv"
`include "driver.sv"

// Test Case
program test(intf intf);
  
  // Declare handle for mailbox object  
  mailbox gen2drv = new();
  
  // Create generator object  
  generator gen = new(gen2drv);
  
  // Create driver object  
  driver drv = new(gen2drv, intf);
  
  // Run the test case
  initial begin
  // Running test cases
    gen.run("a");
    drv.run();
	gen.run("b");
    drv.run();
	gen.run("c");
    drv.run();
  end
  
  // Terminate test case after 100ns  
  initial begin
    #100 $finish;
  end
    
endprogram