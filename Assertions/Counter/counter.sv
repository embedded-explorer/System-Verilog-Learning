//----------------------------------------------------------------------------
// Title       : 4-Bit Synchronous Counter Assertion Binding Example
// Design      : 4-Bit Synchronous Counter
// File        : counter.sv
//----------------------------------------------------------------------------

module counter(
  input  logic       clk_i     ,
  input  logic       rst_n_i   ,
  output logic [3:0] count_o   ,
  output logic       rollover_o
);

  assign rollover_o = &count_o;

  // Active low asynchronous reset
  always_ff@(posedge clk_i, negedge rst_n_i)begin
    if(!rst_n_i)begin
      count_o <= 4'h0;
    end else begin
      count_o <= count_o + 1'b1;
    end
  end

endmodule
