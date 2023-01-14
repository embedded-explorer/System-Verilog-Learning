//----------------------------------------------------------------------------
// Title       : 128-Bit x 8-Bit Single Port RAM with single data port
// Design      : Single Port RAM with single data port
// File        : single_port_ram.sv
//----------------------------------------------------------------------------

module single_port_ram(
  input             clk_i   , // Clock input
  input             rst_n_i , // Active low reset
  input             we_i    , // Write Enable input
  input       [6:0] addr_i  , // Address bus
  inout       [7:0] data_io   // Data input output port
);
  
  // Declare a 128-Bit x 8-Bit memory array
  logic [7:0] ram [127:0];
  
  // Read data when write is disabled
  assign data_io = (!we_i) ? ram[addr_i] : 8'hzz;
  
  always_ff @(posedge clk_i) begin
    if(!rst_n_i)begin
      // Initialize all memory locations to 0
      for(int i=0; i<128; i++) begin
        ram[i] <= 8'h00;
      end
    end else begin
      // Write data when write is enabled
      if(we_i) begin
        ram[addr_i] <= data_io;
      end
    end
  end
  
endmodule