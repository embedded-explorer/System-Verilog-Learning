//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Environment
// File        : environment.sv
//----------------------------------------------------------------------------

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  virtual adder_if intf;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  function new(virtual adder_if intf);
    intf = intf;
    gen = new();
    drv = new(intf);
	mon = new(intf);
	scb = new(intf);
  endfunction
  
  task run();
    repeat(5)begin
      gen.generate_values();
	  drv.drive(gen.a, gen.b);
	  mon.display();
	  scb.check();
    end
  endtask
  
endclass
