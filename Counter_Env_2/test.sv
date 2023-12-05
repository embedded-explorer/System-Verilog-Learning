`include "counter_env.sv"

program test(
  counter_if.drv_mp drv_if,
  counter_if.mon_mp mon_if
);

  // Declare handle for environment object
  counter_env env_h;
  
  initial begin
    env_h = new(drv_if, mon_if);
	
	// Wait until reset is applied
	wait(drv_if.rst_i);
	wait(!drv_if.rst_i);
	env_h.start();
	#100 $finish;
  end

endprogram