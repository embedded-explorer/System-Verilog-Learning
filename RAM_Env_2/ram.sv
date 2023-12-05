//----------------------------------------------------------------------------
// Title       : Single Port RAM Verification Environment
// Design      : Design
// File        : ram.sv
//----------------------------------------------------------------------------

module ram(
  input         clk_i      , // Clock
  input         rst_n_i    , // Active low synchronous reset
  input         ram_cs_i   , // Chip select
  input         ram_we_i   , // Write enable
  input  [ 7:0] ram_addr_i , // Address bus
  inout  [31:0] ram_data_io  // Bidirectional data bus
);
  
  logic [31:0] memory [255:0]; // Memory array
  logic [31:0] rd_data       ; // read data
  
  // Assign read data when write enable is low
  assign ram_data_io = (!ram_we_i && ram_cs_i) ? rd_data : 32'hz;
  
  always_ff @(posedge clk_i)begin
    if(!rst_n_i)begin
	// Clear on reset
      rd_data <= 32'h0;
      for(int i=0; i< 256; i++)begin
        memory[i] <= 32'h0;
      end
    end else begin
	  if(ram_cs_i)begin
        if(ram_we_i)begin
	    // Write data when write enable is high
          memory[ram_addr_i] <= ram_data_io;
        end else begin
	    // Read data when write enable is low
          rd_data <= memory[ram_addr_i];
        end
      end
    end
  end

endmodule