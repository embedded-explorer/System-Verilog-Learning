//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Monitor
// File        : monitor.sv
//----------------------------------------------------------------------------

module monitor(adder_if.mon_if mon_if);
  
  // Display
  always@(mon_if.a, mon_if.b)begin
    $strobe($time, "ns: A = %d, B = %d, Sum = %d", mon_if.a, mon_if.b, mon_if.s);
  end

endmodule
