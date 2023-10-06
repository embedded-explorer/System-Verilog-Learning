//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Driver
// File        : driver.sv
//----------------------------------------------------------------------------

class driver;

  virtual adder_if.drv_if drv_if;
  
  function new(virtual adder_if.drv_if intf);
    drv_if = intf;
  endfunction
  
  task drive(logic [3:0] a, logic [3:0] b);
    drv_if.a = a;
    drv_if.b = b;
  endtask
  
endclass