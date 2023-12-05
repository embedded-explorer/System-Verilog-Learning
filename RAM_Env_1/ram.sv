module ram(
  input                clk_i      , // Clock
  input                rst_n_i    , // Active low synchronous reset
  input                ram_cs_i   , // Chip select
  input                ram_we_i   , // Write enable
  input         [ 7:0] ram_addr_i , // Address bus
  input         [31:0] ram_data_i , // Data input
  output  logic [31:0] ram_data_o   // Data output
);
  
  logic [31:0] memory [255:0]; // Memory array

  always_ff @(posedge clk_i)begin
    if(!rst_n_i)begin
	// Clear on reset
      ram_data_o <= 32'h0;
      for(int i=0; i< 256; i++)begin
        memory[i] <= 32'h0;
      end
    end else begin
	  if(ram_cs_i)begin
        if(ram_we_i)begin
	    // Write data when write enable is high
          memory[ram_addr_i] <= ram_data_i;
        end else begin
	    // Read data when write enable is low
          ram_data_o <= memory[ram_addr_i];
        end
      end
    end
  end

endmodule