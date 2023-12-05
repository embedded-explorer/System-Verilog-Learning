//----------------------------------------------------------------------------
// Title       : Single Port RAM Verification Environment
// Design      : Scoreboard
// File        : ram_scb.sv
//----------------------------------------------------------------------------


class ram_scb;
  
  // Transaction handle
  ram_trans trans_h;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // override constructor
  function new(
	mailbox mon2scb               // Get mailbox handle
  );
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start Scoreboard
  task start(string test_case);
    trans_h = new();
	mon2scb.get(trans_h);
	
	if(test_case == "write_read")begin
	  if(trans_h.ram_data_i == trans_h.ram_data_o)
	    $display($time,"[SCB] : Test Pass");
	  else
	    $display($time,"[SCB] : Test Pass");
	end

  endtask

endclass