//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Score Board
// File        : scoreboard.sv
//----------------------------------------------------------------------------

class scoreboard;

  // Declare handle for transaction object
  transaction trans;
  
  // Declare handle for monitor to scoreboard mailbox
  mailbox mon2scb;
  
  // Override constructor to get mailbox handle
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    trans = new();
    mon2scb.get(trans);
    if((trans.c_i + trans.b_i + trans.a_i) == {trans.c_o, trans.s_o})
	// Check whether result obtained matches with expected result
      $display("Result is Expected : Test Pass");
    else
      $display("Result is Wrong : Test Fail");
    trans.display("Scoreboard");
  endtask
    
endclass