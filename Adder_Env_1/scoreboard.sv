//----------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Scoreboard
// File        : scoreboard.sv
//----------------------------------------------------------------------------

module scoreboard(adder_if.mon_if mon_if);
  
  // Check the output against expected value
  always@(posedge mon_if.s)begin
    if(mon_if.s != (mon_if.a + mon_if.b))
      $fatal("[Error] : Unexpected Ouput");
  end

endmodule
