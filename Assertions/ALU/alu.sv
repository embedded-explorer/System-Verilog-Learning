//----------------------------------------------------------------------------
// Title       : Concurrent Assertions for ALU
// Design      : ALU
// File        : alu.sv
//----------------------------------------------------------------------------
module alu(
  input            clk_i   ,
  input      [7:0] a_i     ,
  input      [7:0] b_i     ,
  input      [2:0] opcode_i,
  output reg [7:0] result_o
);

  always@(posedge clk_i)begin
    case(opcode_i)
      3'b000 : result_o <= a_i + b_i; // Addition
      3'b001 : result_o <= a_i - b_i; // Subtraction
      3'b010 : result_o <= ~a_i;      // Negation
      3'b011 : result_o <= a_i & b_i; // AND
      3'b100 : result_o <= a_i | b_i; // OR
      3'b101 : result_o <= a_i ^ b_i; // XOR
      3'b110 : result_o <= ~(a_i & b_i); // NAND
      3'b111 : result_o <= ~(a_i | b_i); // NOR
    endcase
  end

endmodule