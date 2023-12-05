class counter_drv;
  
  // Transaction handle
  counter_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual counter_if.drv_mp drv_if;
  
  // Generator to driver mailbox
  mailbox gen2drv;
  
  // override constructor
  function new(
    virtual counter_if.drv_mp drv_if, // Get Virtual interface handle
	mailbox gen2drv               // Get mailbox handle
  );
    this.drv_if = drv_if;
	this.gen2drv = gen2drv;
  endfunction
  
  // Task to start Driver
  task start();
	gen2drv.get(trans_h);
	@(posedge drv_if.clk_i);
	drv_if.drv_cb.enable_i <= trans_h.enable_i;
	drv_if.drv_cb.load_i   <= trans_h.load_i;
	drv_if.drv_cb.data_i   <= trans_h.data_i;
	$display($time, "[DRV] : EN : %b, LOAD : %b, DATA : %b", 
	         trans_h.enable_i, trans_h.load_i, trans_h.data_i);
  endtask

endclass