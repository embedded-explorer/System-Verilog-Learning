class ram_drv;
  
  // Transaction handle
  ram_trans trans_h;
  
  // Virtual interface handle to connect with DUV
  virtual ram_if.drv_mp drv_if;
  
  // Generator to driver mailbox
  mailbox gen2drv;
  
  // override constructor
  function new(
    virtual ram_if.drv_mp drv_if, // Get Virtual interface handle
	mailbox gen2drv               // Get mailbox handle
  );
    this.drv_if = drv_if;
	this.gen2drv = gen2drv;
  endfunction
  
  // Task to start Driver
  task start(string test_name);
	gen2drv.get(trans_h);
	
	if(test_name == "write_read")begin
	  @(posedge drv_if.clk_i); // Drive the transaction
	  drv_if.drv_cb.ram_cs_i    <= trans_h.ram_cs_i;
	  drv_if.drv_cb.ram_we_i    <= trans_h.ram_we_i;
	  drv_if.drv_cb.ram_addr_i  <= trans_h.ram_addr_i;
	  drv_if.drv_cb.ram_data_i  <= trans_h.ram_data_i;
	  $display($time, "[DRV] : WE : %b, ADDR : %h, DATA : %h", 
	         trans_h.ram_we_i, trans_h.ram_addr_i, trans_h.ram_data_i);
			 
	  @(posedge drv_if.clk_i); // Drive the transaction
	  trans_h.ram_we_i = 1'b0;
	  drv_if.drv_cb.ram_we_i    <= trans_h.ram_we_i;
	  $display($time, "[DRV] : WE : %b, ADDR : %h, DATA : %h", 
	         trans_h.ram_we_i, trans_h.ram_addr_i, trans_h.ram_data_i);
			 
	end else begin
	  @(posedge drv_if.clk_i); // Drive the transaction
	  drv_if.drv_cb.ram_cs_i    <= trans_h.ram_cs_i;
	  drv_if.drv_cb.ram_we_i    <= trans_h.ram_we_i;
	  drv_if.drv_cb.ram_addr_i  <= trans_h.ram_addr_i;
	  drv_if.drv_cb.ram_data_i  <= trans_h.ram_data_i;
	  $display($time, "[DRV] : WE : %b, ADDR : %h, DATA : %h", 
	         trans_h.ram_we_i, trans_h.ram_addr_i, trans_h.ram_data_i);
	end
	
	
	@(posedge drv_if.clk_i);
	drv_if.drv_cb.ram_cs_i    <= 1'b0;

  endtask

endclass