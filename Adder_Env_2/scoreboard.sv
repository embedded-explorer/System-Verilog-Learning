//---------------------------------------------------------------------------
// Title       : 4-Bit Adder Simple Verification Environment
// Design      : Scoreboard
// File        : scoreboard.sv
//---------------------------------------------------------------------------

class scoreboard;
  
  virtual adder_if.mon_mp scb_if;
  
  // Task to check the result against expected result
  // Get the stimulus from generator
  // Get the response from monitor
  task check(input logic [3:0] a, input logic [3:0] b, input logic [4:0] s);
    assert(s == a + b)
      $display($time, "ns [SCB] : PASS : A = %d, B = %d, Sum = %d", a, b, s);
    else
      $display($time, "ns [SCB] : FAIL : A = %d, B = %d, Sum = %d", a, b, s);
  endtask
  
endclass
