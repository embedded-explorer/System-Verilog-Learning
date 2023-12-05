interface ram_if(input clk_i, input rst_n_i);

  logic        ram_cs_i   ; // Chip Select
  logic        ram_we_i   ; // Write Enable
  logic [ 7:0] ram_addr_i ; // Address bus
  logic [31:0] ram_data_i ; // Data input
  logic [31:0] ram_data_o ; // Data output
  
  // Clocking block for driver
  clocking drv_cb @(posedge clk_i);
    default input #1 output #1;
    output ram_cs_i;
	output ram_we_i;
	output ram_addr_i;
	output ram_data_i;
  endclocking
  
  // Clocking block for monitor
  clocking mon_cb @(posedge clk_i);
    default input #1 output #1;
    input ram_cs_i;
	input ram_we_i;
	input ram_addr_i;
	input ram_data_o;
  endclocking
  
  // Modport for driver
  modport drv_mp(
    clocking drv_cb,
	input    clk_i,
	input    rst_n_i
  );
  
  // Modport for monitor
  modport mon_mp(
    clocking mon_cb,
	input    clk_i,
	input    rst_n_i
  );
  
endinterface
