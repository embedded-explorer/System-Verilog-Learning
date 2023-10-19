//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Environment
// File        : environment.sv
//----------------------------------------------------------------------------

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  // Declare handles for TB components and interface
  virtual multiplier_if intf;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  // Override the constructor to create objects of TB components
  // Pass the interface handles for driver and monitor
  function new(virtual multiplier_if intf);
    this.intf = intf;
    gen = new();
    drv = new(intf);
    mon = new(intf);
    scb = new();
  endfunction
  
  // Task to call the sub tasks of TB components
  task run();
    wait(intf.reset);
    wait(!intf.reset);
    repeat(5)begin
      gen.generate_values();
      drv.drive(gen.multiplicand, gen.multiplier);
      mon.sample();
      scb.check(gen.multiplicand, gen.multiplier, mon.result);
    end
  endtask
  
endclass