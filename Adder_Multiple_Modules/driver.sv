//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Driver
// File        : driver.sv
//----------------------------------------------------------------------------

module driver(adder_if.drv_if drv_if);
  
  // Task to generate directed inputs
  task run;
    #10 drv_if.a = 4'd10; drv_if.b = 4'd5;
    #10 drv_if.a = 4'd6; drv_if.b = 4'd4;
  endtask
  
  // Invoke run task
  initial run;

endmodule
