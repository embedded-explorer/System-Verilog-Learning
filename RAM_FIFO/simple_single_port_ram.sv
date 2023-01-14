//----------------------------------------------------------------------------
// Title       : 128-Bit x 8-Bit Single Port RAM
// File        : simple_single_port_ram.sv
//----------------------------------------------------------------------------

module simple_single_port_ram(
  input              clk_i     , // Clock input
  input              rst_n_i   , // Active low reset
  input              wr_en_i   , // Write enable input
  input              rd_en_i   , // Read enable input
  input        [6:0] addr_i    , // Address bus
  input        [7:0] wr_data_i , // Data input port
  output logic [7:0] rd_data_o   // Data output port
);
  
  // Declare a 128-Bit x 8-Bit memory array
  logic [7:0] ram [127:0];

  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
      rd_data_o <= 8'h00;
      // Initialize all memory locations to 0
      for(int i=0; i<128; i++) begin
        ram[i] <= 8'h00;
      end
    end else begin
      // Write data when write is enabled
      if(wr_en_i) begin
        ram[addr_i] <= wr_data_i;
      end
      // Read data when read is enabled
      if(rd_en_i) begin
        rd_data_o  <= ram[addr_i];
      end
    end
  end
  
endmodule