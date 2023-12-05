//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

// Driver to drive the packets
class driver;
  
  // Declare handle for transaction object
  transaction trans;
  
  // Declare handle for mailbox object
  mailbox gen2drv;
  
  // Declare handle for virtual interface
  virtual intf drv_if;
  
  // Override constructor to get mailbox and virtual interface handles  
  function new(mailbox gen2drv, virtual intf drv_if);
    this.gen2drv = gen2drv;
    this.drv_if  = drv_if;
  endfunction
  
  // Declare task to drive the inputs
  task run;
    // Create transaction object
    trans = new();
    // Get randomized packet from mailbox
    gen2drv.get(trans);
    if(trans.pky_type.name() == "A") begin
    // When packet type A is generated
      drv_if.header    = $random;
      drv_if.payload   = $random;
      drv_if.command   = 4'h0;
      drv_if.master_id = 2'b00;
      drv_if.parity    = 1'b1;
    end
    else if(trans.pky_type.name() == "B") begin
      drv_if.header    = 32'h0100;
      drv_if.payload   = $random;
      drv_if.command   = 4'b0010;
      drv_if.master_id = 2'b01;
      drv_if.parity    = 1'b0;
    end
    else if(trans.pky_type.name() == "C") begin
      drv_if.header    = 32'h0200;
      drv_if.payload   = 16'hAA;
      drv_if.command   = 4'h0100;
      drv_if.master_id = 2'b10;
      drv_if.parity    = 1'b1;
    end
	$display("----------------- Driver -----------------");
	$display(" Header    : %h", drv_if.header);
	$display(" Payload   : %h", drv_if.payload);
	$display(" Command   : %b", drv_if.command);
	$display(" Master ID : %b", drv_if.master_id);
	$display(" Parity    : %b", drv_if.parity);
	$display("------------------------------------------");
  endtask
    
endclass