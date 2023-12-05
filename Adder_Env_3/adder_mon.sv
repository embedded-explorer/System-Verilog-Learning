class adder_mon;
  
  // Transaction handle
  adder_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual adder_if.mon_mp mon_if;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual adder_if.mon_mp mon_if, // Get Virtual interface handle
	mailbox mon2scb                 // Get mailbox handle
  );
    this.mon_if = mon_if;
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start Driver
  task start();
    trans_h = new();
	#2;
	trans_h.a_i = mon_if.a_i;   
	trans_h.b_i = mon_if.b_i;   
	trans_h.s_o = mon_if.s_o;
	mon2scb.put(trans_h);
	$display($time, "[MON] : A : %d, B : %d, S : %d", 
	         trans_h.a_i, trans_h.b_i, trans_h.s_o);
  endtask

endclass