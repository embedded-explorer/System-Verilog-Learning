//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Generator
// File        : generator.sv
//----------------------------------------------------------------------------

class generator;
  
  logic [3:0] multiplicand;
  logic [3:0] multiplier  ;
  
  // Generate random values for inputs
  task generate_values();
    multiplicand = $random();
    multiplier   = $random();
	$display($time,"ns [GEN] : P = %d, Q = %d", multiplicand, multiplier);
  endtask
  
endclass