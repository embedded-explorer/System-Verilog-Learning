//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Interface
// File        : counter_if.sv
//----------------------------------------------------------------------------

interface counter_if(input clk_i, input rst_n_i);

  logic       enable_i; // Enable
  logic       load_i  ; // Load parallel data
  logic [3:0] data_i  ; // Parallel data input
  logic [3:0] count_o ; // Count output
  logic       even_o  ; // Indicates count is even
  
  // Modport for driver
  modport drv_mp(
    input  clk_i   ,
	input  rst_n_i ,
    output enable_i,
    output load_i  ,
	output data_i  
  );
  
  // Modport for monitor
  modport mon_mp(
    input clk_i   ,
	input rst_n_i ,
    input enable_i,
    input load_i  ,
    input data_i  ,
	input count_o ,
	input even_o
  );
  
  // Modport for DUT
  modport dut_mp(
    input  clk_i   ,
	input  rst_n_i ,
    input  enable_i,
    input  load_i  ,
    input  data_i  ,
	output count_o ,
	output even_o
  );

endinterface
