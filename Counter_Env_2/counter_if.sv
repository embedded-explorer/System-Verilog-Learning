interface counter_if(input clk_i, input rst_i);

  logic       enable_i;
  logic       load_i;
  logic [3:0] data_i;
  logic [3:0] count_o;
  
  // Clocking block for driver
  clocking drv_cb @(posedge clk_i);
    default input #1 output #1;
	output enable_i;
	output load_i;
	output data_i;
  endclocking
  
  // Clocking block for monitor
  clocking mon_cb @(posedge clk_i);
    default input #1 output #1;
	input enable_i;
	input load_i;
	input data_i;
	input count_o;
  endclocking
  
  // Modport for driver
  modport drv_mp(
    clocking drv_cb,
	input clk_i,
	input rst_i
  );
  
  // Modport for monitor
  modport mon_mp(
    clocking mon_cb,
	input clk_i,
	input rst_i
  );
  
endinterface
