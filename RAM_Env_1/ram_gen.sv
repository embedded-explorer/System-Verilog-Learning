class ram_gen;
  
  // Transaction handle
  ram_trans trans_h;
  
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
	
	if(test_name == "write_read")begin
	  assert(trans_h.randomize() with {ram_we_i == 1;}); // Randomize transaction
	end else begin
	  assert(trans_h.randomize());
	end
	
	gen2drv.put(trans_h);        // Post the transation to driver
	$display("----------------------------------------------------------------------");
	$display($time, "[GEN] : WE : %b, ADDR : %h, DATA : %h", 
	         trans_h.ram_we_i, trans_h.ram_addr_i, trans_h.ram_data_i);
  endtask

endclass
