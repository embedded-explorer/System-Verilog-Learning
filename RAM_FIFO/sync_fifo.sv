//----------------------------------------------------------------------------
// Title       : 16 x 8 Synchronous FIFO
// Design      : Synchronous FIFO
// File        : sync_fifo.sv
//----------------------------------------------------------------------------

module sync_fifo(
  // Clock and Reset
  input                 fifo_clk_i     , // Input Clock
  input                 fifo_rst_n_i   , // Active low input reset

  input                 fifo_wr_en_i   , // FIFO write enable
  input          [7:0]  fifo_data_i    , // FIFO write data
  output  logic         fifo_full_o    , // FIFO write full

  input                 fifo_rd_en_i   , // FIFO read enable
  output  logic  [7:0]  fifo_data_o    , // FIFO read data
  output  logic         fifo_empty_o     // FIFO read empty
);

  // Memory array decleration
  logic  [7:0] fifo [0:15] ; 

  logic  [4:0] wr_ptr     ; // Write pointer, 1 extra bit wide for full detection
  logic  [4:0] rd_ptr     ; // Read pointer, 1 extra bit wide for full detection

  logic  read_en  ; // Internal read enable
  logic  write_en ; // Internal write enable

//----------------------------------------------------------------------------
// Combinational Logic
//----------------------------------------------------------------------------

  // Read enable, when fifo is not empty and read enable is received form user
  assign read_en  = fifo_rd_en_i && !fifo_empty_o;

  // Write enable, when fifo is not full and write enable is received form user
  assign write_en = fifo_wr_en_i && !fifo_full_o ;

  // FIFO is empty when read pointer catches up with write pointer
  assign fifo_empty_o = (wr_ptr == rd_ptr);

  // FIFO is full when MSB of write and read pointer are not equal, but lower bits are equal
  assign fifo_full_o  = (wr_ptr == {~rd_ptr[4], rd_ptr[3:0]});

//----------------------------------------------------------------------------
// Sequential Logic
//----------------------------------------------------------------------------

  // FIFO write and pointer updation logic
  always_ff @(posedge fifo_clk_i) begin
    if(!fifo_rst_n_i) begin
      wr_ptr   <= 5'h0;
      rd_ptr   <= 5'h0;
      // Clear all locations
      for(int i=0; i<16; i++) begin
        fifo[i] <= 8'h0;
      end
    end else begin
      // Upon valid write enable
      if(write_en) begin
        wr_ptr            <= wr_ptr + 1'b1 ; // increment write pointer
        fifo[wr_ptr[3:0]] <= fifo_data_i   ; // write data to FIFO
      end
      // Upon valid read enable
      if(read_en) begin
        rd_ptr       <= rd_ptr + 1'b1      ; // increment read pointer
        fifo_data_o  <= fifo[rd_ptr[3:0]]  ; // read data from FIFO
      end
    end
  end

endmodule