//----------------------------------------------------------------------------
// Title       : D Flip Flop
// File        : d_ff.sv
//----------------------------------------------------------------------------

// Synchronous Active High Reset D-FF
module d_ff(
  input        clk_i , // Clock input
  input        rst_i , // Active high reset
  input        d_i   , // D input
  output logic q_o   , // Q output
  output logic qb_o    // Q bar output
);
  
  always_comb begin
    qb_o = ~q_o;
  end
  
  always_ff @(posedge clk_i) begin
    if(rst_i)begin
      q_o <= 1'b0; // Reset
    end else begin
      q_o <= d_i ; // Sample input
    end
  end
  
endmodule


/*
// Asynchronous Active High Reset D-FF
module d_ff(
  input        clk_i , // Clock input
  input        rst_i , // Active high reset
  input        d_i   , // D input
  output logic q_o   , // Q output
  output logic qb_o    // Q bar output
);
  
  always_comb begin
    qb_o = ~q_o;
  end
  
  always_ff @(posedge clk_i, posedge rst_i) begin
    if(rst_i)begin
      q_o <= 1'b0; // Reset
    end else begin
      q_o <= d_i ; // Sample input
    end
  end
  
endmodule
*/

/*
// Synchronous Active Low Reset D-FF
module d_ff(
  input        clk_i   , // Clock input
  input        rst_n_i , // Active low reset
  input        d_i     , // D input
  output logic q_o     , // Q output
  output logic qb_o      // Q bar output
);
  
  always_comb begin
    qb_o = ~q_o;
  end
  
  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
      q_o <= 1'b0; // Reset
    end else begin
      q_o <= d_i ; // Sample input
    end
  end
  
endmodule
*/

/*
// Asynchronous Active Low Reset D-FF
module d_ff(
  input        clk_i   , // Clock input
  input        rst_n_i , // Active low reset
  input        d_i     , // D input
  output logic q_o     , // Q output
  output logic qb_o      // Q bar output
);
  
  always_comb begin
    qb_o = ~q_o;
  end
  
  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i)begin
      q_o <= 1'b0; // Reset
    end else begin
      q_o <= d_i ; // Sample input
    end
  end
  
endmodule
*/