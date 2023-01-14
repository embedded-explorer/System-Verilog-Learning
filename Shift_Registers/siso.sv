//----------------------------------------------------------------------------
// Title       : 4-Bit Serial In Serial Out Shift Register
// File        : siso.sv
//----------------------------------------------------------------------------

module siso(
  input        clk_i   , // Clock input
  input        rst_n_i , // Active high reset
  input        data_i  , // Serial data input
  input        dir_i   , // Direction 1-Right, 0-Left
  output logic data_o    // Serial data output
);

  logic [3:0] shift_reg;
  
  // Assign the output based on direction
  always_comb begin
    data_o = dir_i ? shift_reg[0] : shift_reg[3];
  end
  
  // Perform shift operation based on direction
  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
      shift_reg <= 4'h0; // Reset
    end else begin
      if(dir_i) begin
      // Right shift
        shift_reg <= {data_i, shift_reg[3:1]};
      end else begin
      // Left shift
        shift_reg <= {shift_reg[2:0], data_i};
      end
    end
  end
  
endmodule