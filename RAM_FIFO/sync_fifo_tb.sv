//----------------------------------------------------------------------------
// Title       : 16 x 8 Synchronous FIFO
// Design      : Synchronous FIFO Testbench
// File        : sync_fifo_tb.sv
//----------------------------------------------------------------------------

module sync_fifo_tb();
  
  logic          fifo_clk_i   ;
  logic          fifo_rst_n_i ;
  logic          fifo_wr_en_i ;
  logic    [7:0] fifo_data_i  ;
  logic          fifo_full_o  ;
  logic          fifo_rd_en_i ;
  logic    [7:0] fifo_data_o  ;
  logic          fifo_empty_o ;

  // Instantiation
  sync_fifo DUT(.*);

  // Clock generation
  initial begin
    fifo_clk_i = 1'b0;
    forever #5 fifo_clk_i = ~fifo_clk_i;
  end

  // Task for writing data
  task write_data(
    input [7:0]   data
  );
  begin
    @(posedge fifo_clk_i);
    fifo_wr_en_i <= 1'b1;
    fifo_data_i  <= data;
    @(posedge fifo_clk_i);
    fifo_wr_en_i <= 1'b0;
  end
  endtask
  
  // Task for reading data
  task read_data;
  begin
    @(posedge fifo_clk_i);
    fifo_rd_en_i <= 1'b1;
    @(posedge fifo_clk_i);
    fifo_rd_en_i <= 1'b0;
  end
  endtask
  
  // Initial Block for driving the inputs
  initial begin
    // Initialize all inputs
    fifo_rst_n_i  = 1'b1;
    fifo_wr_en_i  = 1'b0;
    fifo_rd_en_i  = 1'b0;
    fifo_data_i   = 8'h00;

    // Apply reset
    @(posedge fifo_clk_i)
    fifo_rst_n_i <= 1'b0;
    @(posedge fifo_clk_i)
    fifo_rst_n_i <= 1'b1;
    
    // Test Case - 1: Read from empty FIFO
    write_data(8'h64);
    read_data;
    read_data; // Underrun Condition
  
    // Test Case - 2: Write to full FIFO
    repeat (16)
      write_data({$random}%256);
      
    #20
    repeat(16)
      read_data;

    // Test Case - 3: Simultaneous Read Write
    write_data(8'h78);
      fork
        repeat (5) read_data;
        repeat (5) write_data({$random}%256);
      join
    read_data;
    
    #1200 $finish;
  end
  
endmodule