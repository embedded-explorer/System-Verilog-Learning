//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Top Level Testbench
// File        : testbench.sv
//----------------------------------------------------------------------------

`include "multiplier_if.sv"
`include "test.sv"

module testbench();

  // Declare clock and reset
  logic clock;
  logic reset;
  
  // Instantiate Interface
  multiplier_if intf(clock, reset);
  
  // Instantiate Design
  multiplier dut(intf.dut_mp);
  
  // Create an object of test
  test test = new(intf);
  
  // Generate 100MHz Clock
  initial begin
    clock = 1'b0;
    forever #5 clock = ~clock;
  end
  
  // Generate reset
  initial begin
    reset   = 0;
    
    @(posedge clock);
    reset <= 1'b1;
    repeat(2)
      @(posedge clock);
    reset <= 1'b0;
  end
  
  // Run the test
  initial begin
    test.run_test();
    #10 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench.intf);
  end

endmodule