//----------------------------------------------------------------------------
// Title       : 4-Bit Synchronous Counter Assertion Binding Example
// Design      : 4-Bit Synchronous Counter Assertion File
// File        : counter_assertions.sv
//----------------------------------------------------------------------------

module counter_assertions(
  input       clk_i     ,
  input       rst_n_i   ,
  input [3:0] count_i   ,
  input       rollover_i
);

  property normal_counting; 
    disable iff(!rst_n_i)
    (count_i < 15 |-> !rollover_i);
  endproperty

  property rollover;
    disable iff(!rst_n_i)
    (count_i == 15 |-> rollover_i);
  endproperty

  assert property(@(posedge clk_i) normal_counting)
    $display($time, "ns Counter : Normal Operation Pass");
  else
    $display($time, "ns Counter : Normal Operation Fail");

    assert property(@(posedge clk_i) rollover)
    $display($time, "ns Counter : Rollover Condition Pass");
  else
    $display($time, "ns Counter : Rollover Condition Fail");

endmodule
