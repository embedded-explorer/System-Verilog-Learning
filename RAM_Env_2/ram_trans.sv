//----------------------------------------------------------------------------
// Title       : Single Port RAM Verification Environment
// Design      : Transaction
// File        : ram_trans.sv
//----------------------------------------------------------------------------

class ram_trans;
  
  randc logic        ram_cs_i   ; // Chip Select
  randc logic        ram_we_i   ; // Write Enable
  randc logic [ 7:0] ram_addr_i ; // Address bus
  randc logic [31:0] ram_data_i ; // Data input to DUV
        logic [31:0] ram_data_o ; // Data output from DUV
  
  // Chip Select should be always 1 for read and write operations
  constraint chip_select{ ram_cs_i == 1;};

endclass