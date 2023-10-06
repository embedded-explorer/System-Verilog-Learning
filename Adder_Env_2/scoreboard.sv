//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Scoreboard
// File        : scoreboard.sv
//----------------------------------------------------------------------------

class scoreboard;
  
  virtual adder_if.mon_if scb_if;
  
  function new(virtual adder_if.mon_if intf);
    scb_if = intf;
  endfunction
  
  task check();
    assert(scb_if.s == scb_if.a + scb_if.b)
    else
      $display("Output Mismatch");
  endtask
  
endclass
