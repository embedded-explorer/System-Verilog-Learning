//----------------------------------------------------------------------------
// Design      : 4-Bit Rotate Left Barrel Shifter
// File        : rol_barrel_shifter.sv
//----------------------------------------------------------------------------

module rol_barrel_shifter(
  input        [3:0] a_i  , // 4-Bit Input
  input        [1:0] amt_i, // Number of shifts
  output logic [3:0] y_o    // 4-Bit Output
);

  always_comb begin
    case(amt_i)
      2'b00   : y_o = a_i                 ; // No-Operation
      2'b01   : y_o = {a_i[2:0], a_i[  3]}; // ROL by 1
      2'b10   : y_o = {a_i[1:0], a_i[3:2]}; // ROL by 2
      2'b11   : y_o = {a_i[  0], a_i[3:1]}; // ROL by 3
      default : y_o = a_i                 ; // Default assignment
    endcase
  end
  
endmodule