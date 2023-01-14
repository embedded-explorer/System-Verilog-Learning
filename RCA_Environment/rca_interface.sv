//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Interface
// File        : rca_interface.sv
//----------------------------------------------------------------------------

interface intf #(WIDTH = `ADDER_WIDTH)();

  logic [WIDTH-1:0] a_i;
  logic [WIDTH-1:0] b_i;
  logic             c_i;
  logic [WIDTH-1:0] s_o;
  logic             c_o;
  
  // Declare modport for design
  modport duv_mod(
    input  a_i,
    input  b_i,
    input  c_i,
    output s_o,
    output c_o
  );
    
endinterface