//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Monitor
// File        : monitor.sv
//---------------------------------------------------------------------------

class monitor;

  logic [4:0] s;
  
  virtual adder_if.mon_mp mon_if;
  
  // Override the constructor to connect with interface
  function new(virtual adder_if.mon_mp intf);
    mon_if = intf;
  endfunction
  
  // Task to sample the signals on interface
  task display();
    #1
	s = mon_if.s;
    $display($time, "ns [MON] : A = %d, B = %d, Sum = %d", mon_if.a, mon_if.b, mon_if.s);
  endtask
  
endclass
