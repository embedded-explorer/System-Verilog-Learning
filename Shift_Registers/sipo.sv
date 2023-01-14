//----------------------------------------------------------------------------
// Title       : 4-Bit Serial in Parallel Out Shift Register
// File        : sipo.sv
//----------------------------------------------------------------------------

module sipo(
  input              clk_i   , // Clock input
  input              rst_n_i , // Active high reset
  input              data_i  , // Serial data input
  output logic       valid_o , // Valid output
  output logic [3:0] data_o    // Parallel data output
);
  
  logic [1:0] count;
  
  // Shift register
  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
    // Clear output upon reset
      data_o <= 4'h0;
    end else begin
      data_o <= {data_o, data_i};
    end
  end
  
  // Valid output generation logic
  always_ff @(posedge clk_i) begin
    if(!rst_n_i) begin
      count <= 2'b00;
    end else begin
      count  <= count + 1'b1;
      if(count == 2'b11) begin
        valid_o <= 1'b1;
      end else begin
        valid_o <= 1'b0;
      end
    end
  end
  
endmodule