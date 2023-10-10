//----------------------------------------------------------------------------
// Title       : 4-Bit Counter Simple Verification Environment
// Design      : Scoreboard
// File        : scoreboard.sv
//----------------------------------------------------------------------------

module scoreboard(counter_if.mon_mp scb_if);
  
  // Assertion for checking EVEN Output
  sequence even;
	((scb_if.count_o % 2) == !scb_if.even_o);
  endsequence

  property even_check;
    disable iff(!scb_if.rst_n_i)
	@(posedge scb_if.clk_i)
	even;
  endproperty
  
  EVEN_CHECK:
  assert property(@(posedge scb_if.clk_i) even_check)
    $display("EVEN_CHECK PASS");
  else
    $fatal(0, "EVEN_CHECK FAIL");
    
  // Normal counting assertion
  sequence normal_enable;
    (!scb_if.load_i && scb_if.enable_i);
  endsequence

  property normal_check;
    disable iff(!scb_if.rst_n_i)
	@(posedge scb_if.clk_i)
    normal_enable |=> (scb_if.count_o == (($past(scb_if.count_o) + 1)%16));
  endproperty
  
  NORMAL_CHECK:
    assert property(@(posedge scb_if.clk_i) normal_check)
      $display("NORMAL_CHECK PASS");
    else
      $fatal(0, "NORMAL_CHECK FAIL");
    
  // Load assertion
  sequence load_enable;
    (scb_if.load_i && scb_if.enable_i);
  endsequence

  property load_check;
    disable iff(!scb_if.rst_n_i)
	@(posedge scb_if.clk_i)
    load_enable |-> (scb_if.count_o == scb_if.load_i);
  endproperty
  
  LOAD_CHECK:
      assert property(@(posedge scb_if.clk_i) load_check)
      $display("LOAD_CHECK PASS");
    else
      $fatal(0, "LOAD_CHECK FAIL");

endmodule
