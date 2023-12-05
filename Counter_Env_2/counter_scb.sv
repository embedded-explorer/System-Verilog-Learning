class counter_scb;
  
  // Transaction handle
  counter_trans trans_h;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;

  // override constructor
  function new(
	mailbox mon2scb                 // Get mailbox handle
  );
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start Driver
  task start();
    trans_h = new();
	mon2scb.get(trans_h);

	if(trans_h.enable_i)begin
	  if(trans_h.load_i)begin
	    assert(trans_h.count_o == trans_h.data_i)
		  $display($time, "[SCB] : Load Data Pass");
		else
		  $display($time, "[SCB] : Load Data Fail");
	  end else begin
	    assert(trans_h.count_o == trans_h.count_o)
		  $display($time, "[SCB] : Upcount Pass");
		else
		  $display($time, "[SCB] : Upcount Fail");
	  end
	end

  endtask

endclass