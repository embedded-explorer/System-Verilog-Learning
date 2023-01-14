//----------------------------------------------------------------------------
// Title       : 128-Bit x 8-Bit Synchronous Simple Dual Port RAM
// File        : simple_dual_port_ram_tb.sv
//----------------------------------------------------------------------------

module simple_dual_port_ram_tb();

  logic       clk_i     ;
  logic       rst_n_i   ;
  logic       wr_en_i   ;
  logic [6:0] wr_addr_i ;
  logic [7:0] wr_data_i ;
  logic       rd_en_i   ;
  logic [6:0] rd_addr_i ;
  logic [7:0] rd_data_o ;
  
  // Instantiate single port RAM
  simple_dual_port_ram dut(.*);
  
  // Clock Generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    // Initialize all inputs
    rst_n_i    = 1'b1;
    wr_en_i    = 1'b0;
    rd_en_i    = 1'b0;
    wr_addr_i  = 7'h0;
    rd_addr_i  = 7'h0;
    wr_data_i  = 8'h0;
    
    // Apply Reset
    rst_n_i <= 1'b0;
    #20 @(posedge clk_i);
    rst_n_i <= 1'b1;
    
    // Write to 0x45 to location 0x4
    @(posedge clk_i);
    wr_en_i   <= 1'b1;
    wr_addr_i <= 7'h4;
    wr_data_i <= 8'h45;
    
    // Simultaneous write and read testbench
    fork
      begin
        // Write to 0x22 to location 0x5
        @(posedge clk_i);
        wr_addr_i <= 7'h5;
        wr_data_i <= 8'h22;
      end
      begin
        // Read from location 0x4
        @(posedge clk_i);
        rd_en_i   <= 1'b1;
        rd_addr_i <= 7'h4;
      end
    join

    // Read from location 0x5
    @(posedge clk_i);
    wr_en_i   <= 1'b0;
    rd_addr_i <= 7'h5;
    
    #20 $finish;
  end
  
endmodule