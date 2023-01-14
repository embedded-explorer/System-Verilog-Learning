//----------------------------------------------------------------------------
// Title       : D Latch
// File        : d_latch.sv
//----------------------------------------------------------------------------

module d_latch(
  input        en_i, // Enable input
  input        d_i , // D input
  output logic q_o , // Q output
  output logic qb_o  // Q bar output
);
  
  always_comb begin
    qb_o = ~q_o;
  end
  
  always_latch begin
    if(en_i)begin
      q_o = d_i; // Passes input to output
    end else begin
      q_o = q_o; // Holds the output
    end
  end
  
endmodule