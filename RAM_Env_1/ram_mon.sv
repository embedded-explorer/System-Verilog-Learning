class ram_mon;
  
  // Transaction handle
  ram_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual ram_if.mon_mp mon_if;
  
  // Monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // override constructor
  function new(
    virtual ram_if.mon_mp mon_if, // Get Virtual interface handle
	mailbox mon2scb               // Get mailbox handle
  );
    this.mon_if = mon_if;
	this.mon2scb = mon2scb;
  endfunction
  
  // Task to start Driver
  task start();
    trans_h = new();
	@(posedge mon_if.clk_i); // Sample output
	trans_h.ram_cs_i   = mon_if.mon_cb.ram_cs_i;   
	trans_h.ram_we_i   = mon_if.mon_cb.ram_we_i;   
	trans_h.ram_addr_i = mon_if.mon_cb.ram_addr_i;
	trans_h.ram_data_o = mon_if.mon_cb.ram_data_o;
	mon2scb.put(trans_h);
	$display($time, "[MON] : WE : %b, ADDR : %h, DATA : %h", 
	         trans_h.ram_we_i, trans_h.ram_addr_i, trans_h.ram_data_o);
  endtask

endclass