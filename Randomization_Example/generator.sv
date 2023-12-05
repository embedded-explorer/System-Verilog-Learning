//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

// Generator to generate randomized packet
class generator;
  
  // Declare handle for transaction object
  transaction trans;
 
  // Declare handle for mailbox object
  mailbox gen2drv;
  
  // Override constructor to get mailbox handle
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  // Define task to generate random packets
  // Get test case name as input string  
  task run(string test_name);
    if(test_name == "a") begin
    // When test case a is selected
    // Generate random packet with packet type A
    // Create transaction object, randomize and put the packet on mailbox
      trans = new();
      assert(trans.randomize() with {pky_type == A;});
      gen2drv.put(trans);
      $display("Generator : Test Case A");
    end
    else if(test_name == "b")begin
      trans = new();
      assert(trans.randomize() with {pky_type == B;});
      gen2drv.put(trans);
      $display("Generator : Test Case B");
    end
    else if(test_name == "c")begin
      trans = new();
      assert(trans.randomize() with {pky_type == C;});
      gen2drv.put(trans);
      $display("Generator : Test Case C");
    end
	#10;
  endtask
    
endclass