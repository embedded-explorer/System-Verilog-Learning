class adder_drv;
  
  // Transaction handle
  adder_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual adder_if.drv_mp drv_if;
  
  // Generator to driver mailbox
  mailbox gen2drv;
  
  // override constructor
  function new(
    virtual adder_if.drv_mp drv_if, // Get Virtual interface handle
	mailbox gen2drv                 // Get mailbox handle
  );
    this.drv_if = drv_if;
	this.gen2drv = gen2drv;
  endfunction
  
  // Task to start Driver
  task start();
	gen2drv.get(trans_h);
	drv_if.a_i = trans_h.a_i;
	drv_if.b_i = trans_h.b_i;
	$display($time, "[DRV] : A : %d, B : %d", 
	         trans_h.a_i, trans_h.b_i);
  endtask

endclass