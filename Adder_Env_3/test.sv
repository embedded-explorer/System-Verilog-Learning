`include "adder_env.sv"

program test(
  adder_if.drv_mp drv_if,
  adder_if.mon_mp mon_if
);

  // Declare handle for environment object
  adder_env env_h;
  
  initial begin
    env_h = new(drv_if, mon_if);
	repeat(5)
	  env_h.start();
	#10 $finish;
  end

endprogram