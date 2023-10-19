//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Environment
// File        : environment.sv
//---------------------------------------------------------------------------

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  // Declare handles for TB components and interface
  virtual adder_if intf;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  // Override the constructor to create objects of TB components
  // Pass the interface handles for driver and monitor
  function new(virtual adder_if intf);
    intf = intf;
    gen = new();
    drv = new(intf);
    mon = new(intf);
    scb = new();
  endfunction
  
  // Task to call the sub tasks of TB components
  task run();
    repeat(5)begin
      gen.generate_values();
      drv.drive(gen.a, gen.b);
      mon.display();
      scb.check(gen.a, gen.b, mon.s);
    end
  endtask
  
endclass
