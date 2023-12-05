class adder_scb;
  
  // Transaction handle
  adder_trans trans_h;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;

  // override constructor
  function new(
	mailbox mon2scb                 // Get mailbox handle
  );
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start scoreboard
  task start();
    trans_h = new();
	mon2scb.get(trans_h);
	assert(trans_h.s_o == trans_h.a_i + trans_h.b_i)
	  $display($time, "[SCB] : Test Pass");
	else
	  $display($time, "[SCB] : Test Fail");
	$display("--------------------------------------------------");
  endtask

endclass