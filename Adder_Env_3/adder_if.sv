interface adder_if;

  logic [3:0] a_i;
  logic [3:0] b_i;
  logic [4:0] s_o;
  
  // Modport for driver
  modport drv_mp(
    output a_i,
	output b_i
  );
  
  // Modport for monitor
  modport mon_mp(
    input a_i,
	input b_i,
	input s_o
  );
  
endinterface
