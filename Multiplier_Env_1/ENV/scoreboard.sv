//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Scoreboard
// File        : scoreboard.sv
//----------------------------------------------------------------------------

class scoreboard;
  
  // Task to check the result against expected result
  // Get the stimulus from generator
  // Get the response from monitor
  task check(input logic [3:0] p, input logic [3:0] q, input logic [7:0] r);
    assert(r == p * q)
      $display($time, "ns [SCB] : PASS : R", r);
    else
      $display($time, "ns [SCB] : FAIL : R", r);
  endtask
  
endclass