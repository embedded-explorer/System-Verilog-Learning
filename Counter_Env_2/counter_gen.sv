class counter_gen;
  
  // Transaction handle
  counter_trans trans_h;
  
  // Generator to driver mailbox
  mailbox gen2drv;
  
  // override constructor
  function new(
	mailbox gen2drv   // Get mailbox handle
  );
	this.gen2drv = gen2drv;
  endfunction
  
  // Task to start Generator
  task start(string test_name);
    trans_h = new();             // Create transaction object
	
	if(test_name == "disable")begin
	  assert(trans_h.randomize() with {enable_i == 0;}); // Randomize transaction
	end
	else if(test_name == "load")begin
	  assert(trans_h.randomize() with {enable_i == 1; load_i == 1;});
	end
	else if(test_name == "up_count")begin
	  assert(trans_h.randomize() with {enable_i == 1; load_i == 0;});
	end
	
	gen2drv.put(trans_h);        // Post the transation to driver
	$display($time, "[GEN] : EN : %b, LOAD : %b, DATA : %b", 
	         trans_h.enable_i, trans_h.load_i, trans_h.data_i);
  endtask

endclass
