//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : 4-Bit Adder
// File        : adder.sv
//---------------------------------------------------------------------------

module adder(adder_if.dut_mp intf);
  
  // Assign sum
  assign intf.s = intf.a + intf.b;

endmodule