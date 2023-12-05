class adder_gen;
  
  // Transaction handle
  adder_trans trans_h;
  
  // Generator to driver mailbox
  mailbox gen2drv;
  
  // override constructor
  function new(
	mailbox gen2drv   // Get mailbox handle
  );
	this.gen2drv = gen2drv;
  endfunction
  
  // Task to start Generator
  task start();
    trans_h = new();             // Create transaction object
	assert(trans_h.randomize()); // Randomize transaction
	gen2drv.put(trans_h);        // Post the transation to driver
	$display("--------------------------------------------------");
	$display($time, "[GEN] : A : %d, B : %d", 
	         trans_h.a_i, trans_h.b_i);
  endtask

endclass
