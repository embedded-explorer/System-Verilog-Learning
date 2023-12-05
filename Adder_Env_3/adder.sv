module adder(
  input  [3:0] a_i,
  input  [3:0] b_i,
  output [4:0] s_o
);
  
  assign s_o = a_i + b_i;

endmodule