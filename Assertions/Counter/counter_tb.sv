//----------------------------------------------------------------------------
// Title       : 4-Bit Synchronous Counter Assertion Binding Example
// Design      : 4-Bit Synchronous Counter Testbench
// File        : counter_tb.sv
//----------------------------------------------------------------------------

`include "counter_assertions.sv"

module counter_tb();
  
  logic       clk     ;
  logic       rst_n   ;
  logic [3:0] count   ;
  logic       rollover;

  counter dut(
    .clk_i      (clk     ),
    .rst_n_i    (rst_n   ),
    .count_o    (count   ),
    .rollover_o (rollover)
  );
  
  counter_assertions assertions(
    .clk_i      (clk     ),
    .rst_n_i    (rst_n   ),
    .count_i    (count   ),
    .rollover_i (rollover)
  );

  // Assertion binding
  bind counter: dut counter_assertions assertions();

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 0;
    #30 rst_n = 1;
    #200 $finish();
  end

  initial begin
    $monitor($time, "ns Reset:%b, Count:%d, Rollover:%b", rst_n, count, rollover);
  end

endmodule
