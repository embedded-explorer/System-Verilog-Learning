//----------------------------------------------------------------------------
// Title       : 4-Bit Parallel in Serial Out Register
// File        : piso.sv
//----------------------------------------------------------------------------

module piso(
  input              clk_i   , // Clock input
  input              rst_n_i , // Active high reset
  input              load_i  , // Load input
  input        [3:0] data_i  , // Parallel data input
  output logic       busy_o  , // Busy output
  output logic       data_o    // Serial data output
);

  logic [3:0] shift_reg;
  
  // Assign output
  always_comb begin
    data_o = shift_reg[0];
  end
  
  // Shift register
  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
      shift_reg <= 4'h0; // Reset
    end else begin
      if(load_i) begin
      // Load parallel data
        shift_reg <= data_i;
      end else begin
      // Shift data
        shift_reg <= {1'b0, shift_reg[3:1]};
      end
    end
  end
  
  // Busy generation logic
  always_ff @(posedge clk_i) begin
    if(!rst_n_i) begin
      busy_o <= 1'b0;
    end else begin
      if(load_i) begin
        busy_o <= 1'b1;
      end else if(shift_reg == 0) begin
        busy_o <= 1'b0;
      end
    end
  end
  
endmodule