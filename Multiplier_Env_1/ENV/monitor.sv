//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Monitor
// File        : monitor.sv
//----------------------------------------------------------------------------

class monitor;

  logic [7:0] result;
  
  virtual multiplier_if.mon_mp mon_if;
  
  // Override the constructor to connect with interface
  function new(virtual multiplier_if.mon_mp intf);
    this.mon_if = intf;
  endfunction
  
  // Task to sample the signals on interface
  task sample();
    wait(mon_if.done);
    @(posedge mon_if.clock);
	result = mon_if.result;
  endtask
  
endclass