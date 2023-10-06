//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Interface
// File        : adder_if.sv
//----------------------------------------------------------------------------

interface adder_if();
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] s;
  
  // Modport for driver
  modport drv_if(
    output a,
    output b
  );
  
  // Modport for monitor
  modport mon_if(
    input a,
    input b,
    input s
  );

endinterface
