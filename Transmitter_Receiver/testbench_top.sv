//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

// Include necessary files
`include "test_case.sv"
`include "interface.sv"

module testbench_top();

  bit clock;
  bit reset;
  
  // Create instance of interface
  intf intf(clock, reset);
  
  // Instntiate DUT
  system DUT(
    .clock       (clock), 
    .reset       (reset),
    .start       (intf.start),
    .address_bus (intf.address_bus),
    .ready       (intf.ready)
  );
  
  // Create instance of test case
  test_case test_case(intf);
  
  // Clock generation
  initial begin
    clock = 1'b0;
    forever #5 clock = ~clock;
  end
  
  // Initial block for driving inputs
  initial begin
    // Tie all inputs to known values
    reset       = 1'b1 ;
    
    // Apply reset
    @(negedge clock);
    reset <= 1'b0;
    @(negedge clock);
    reset <= 1'b1;

    #500 $finish;
  end

endmodule