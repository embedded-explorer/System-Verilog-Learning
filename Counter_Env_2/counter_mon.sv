class counter_mon;
  
  // Transaction handle
  counter_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual counter_if.mon_mp mon_if;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual counter_if.mon_mp mon_if, // Get Virtual interface handle
	mailbox mon2scb                   // Get mailbox handle
  );
    this.mon_if = mon_if;
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start Monitor
  task start();
    trans_h = new();
	@(posedge mon_if.clk_i);
	trans_h.enable_i = mon_if.mon_cb.enable_i;   
	trans_h.load_i   = mon_if.mon_cb.load_i;   
	trans_h.data_i   = mon_if.mon_cb.data_i;
	trans_h.count_o  = mon_if.mon_cb.count_o;
	mon2scb.put(trans_h);
	$display($time, "[MON] : EN : %b, LOAD : %b, DATA : %b, COUNT : %b", 
	         trans_h.enable_i, trans_h.load_i, trans_h.data_i, trans_h.count_o);
  endtask

endclass