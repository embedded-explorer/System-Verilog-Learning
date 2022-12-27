//----------------------------------------------------------------------------
// Design      : 4-Bit Funnel Shifter
// File        : funnel_shifter.sv
//----------------------------------------------------------------------------

module funnel_shifter(
  input        [3:0] a_i   , // 4-Bit Input
  input        [1:0] amt_i , // Number of shifts
  input        [2:0] mode_i, // Selects mode of shift
  output logic [3:0] y_o     // 4-Bit Output
);
  
  // Intermediate signal declerations
  logic [6:0] z     ; // Z
  logic [4:0] mux_o ; // Output of stage 1 MUX
  logic [1:0] exor_o; // Output of EX-OR gates
  
  // Formation of (2N-1) bit wide Z using A
  always_comb begin
    casex(mode_i)
      3'b000   : z = {3'b0, a_i}                 ; // Logical Right Shift
      3'b001   : z = {a_i, 3'b0}                 ; // Logical Left Shift
      3'b010   : z = {{3{a_i[3]}}, a_i}          ; // Arithmetic Right Shift
      3'b011   : z = {a_i, 3'b0}                 ; // Arithmetic Left Shift
      3'b1X0   : z = {a_i[2:0], a_i}             ; // Rotate Right
      3'b1X1   : z = {a_i[3:1], a_i[0], a_i[3:1]}; // Rotate Left
      default  : z = {3'b0, a_i}                 ; // Default Assignment
    endcase
  end
  
  // Implementation of EX-OR logic
  always_comb begin
    exor_o[0] = amt_i[0] ^ mode_i[0];
    exor_o[1] = amt_i[1] ^ mode_i[0];
  end
  
  // Implementation of stage 1 Multiplexers
  always_comb begin
    mux_o[0] = (exor_o[1]) ? z[2] : z[0] ;
    mux_o[1] = (exor_o[1]) ? z[3] : z[1] ;
    mux_o[2] = (exor_o[1]) ? z[4] : z[2] ;
    mux_o[3] = (exor_o[1]) ? z[5] : z[3] ;
    mux_o[4] = (exor_o[1]) ? z[6] : z[4] ;
  end
  
  // Implementation of stage 2 Multiplexers
  always_comb begin
    y_o[0] = (exor_o[0]) ? mux_o[1] : mux_o[0] ;
    y_o[1] = (exor_o[0]) ? mux_o[2] : mux_o[1] ;
    y_o[2] = (exor_o[0]) ? mux_o[3] : mux_o[2] ;
    y_o[3] = (exor_o[0]) ? mux_o[4] : mux_o[3] ;
  end
  
endmodule