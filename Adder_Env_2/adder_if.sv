//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Interface
// File        : adder_if.sv
//---------------------------------------------------------------------------

interface adder_if();
  logic [3:0] a; // 4-Bit Input A
  logic [3:0] b; // 4-Bit Input B
  logic [4:0] s; // 5-Bit Sum
  
  // Modport for driver
  modport drv_mp(
    output a,
    output b
  );
  
  // Modport for monitor
  modport mon_mp(
    input a,
    input b,
    input s
  );
  
  // Modport for DUT
  modport dut_mp(
    input  a,
    input  b,
    output s
  );

endinterface
