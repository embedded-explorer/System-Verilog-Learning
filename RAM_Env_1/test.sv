`include "ram_env.sv"

program test(
  ram_if.drv_mp drv_if,
  ram_if.mon_mp mon_if
);

  // Declare handle for environment object
  ram_env env_h;
  
  initial begin
    // Wait until reset is asserted and deasserted
	wait(!drv_if.rst_n_i);
	wait(drv_if.rst_n_i);
	
    env_h = new(drv_if, mon_if);
	repeat(5)
	  env_h.start();
  end

endprogram