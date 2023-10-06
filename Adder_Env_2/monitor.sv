//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Monitor
// File        : monitor.sv
//----------------------------------------------------------------------------

class monitor;
  
  virtual adder_if.mon_if mon_if;
  
  function new(virtual adder_if.mon_if intf);
    mon_if = intf;
  endfunction
  
  task display();
    #10
    $display($time, "A = %d, B = %d, Sum = %d", mon_if.a, mon_if.b, mon_if.s);
  endtask
  
endclass
