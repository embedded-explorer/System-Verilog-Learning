//----------------------------------------------------------------------------
// Design      : 4-Bit Rotate Right Barrel Shifter
// File        : ror_barrel_shifter.sv
//----------------------------------------------------------------------------

module ror_barrel_shifter(
  input        [3:0] a_i  , // 4-Bit Input
  input        [1:0] amt_i, // Number of shifts
  output logic [3:0] y_o    // 4-Bit Output
);

  always_comb begin
    case(amt_i)
      2'b00   : y_o = a_i                 ; // No-Operation
      2'b01   : y_o = {a_i[  0], a_i[3:1]}; // ROR by 1
      2'b10   : y_o = {a_i[1:0], a_i[3:2]}; // ROR by 2
      2'b11   : y_o = {a_i[2:0], a_i[  3]}; // ROR by 3
      default : y_o = a_i                 ; // Default assignment
    endcase
  end
  
endmodule