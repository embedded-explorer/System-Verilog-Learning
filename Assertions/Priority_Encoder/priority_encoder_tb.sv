//----------------------------------------------------------------------------
// Title       : Priority Encoder Immediate Assertions
// Design      : Testbench
// File        : priority_encoder.sv
//----------------------------------------------------------------------------
module priority_encoder_tb();

  // Signal Decleration
  logic [3:0] i_i ;
  logic [1:0] y_o ;
  
  integer i;
  reg  [1:0] expected;
  
  // Instantiation
  priority_encoder dut(
    .i_i  (i_i ),
    .y_o  (y_o )
  );

  // Logic to drive inputs
  initial begin
    i_i = 4'h0;
	
	// Directed Inputs
	for(i=0; i<16; i=i+1)begin
	  i_i = i;
	  #10;
	end

	i_i = 4'b001x;
	#10;
	
	i_i = 4'b001z;
	#10
	
    #10 $finish;
  end
  
  // Logic to check output
  always_comb begin
    // Expected ouput
    casez(i_i)
	  4'b1??? : expected = 2'b11;
	  4'b01?? : expected = 2'b10;
	  4'b001? : expected = 2'b01;
	  4'b0001 : expected = 2'b00;
	  default : expected = 2'bzz;
	endcase
	
	// Immediate assertion
    // When input changes immediate assertion runs multiple times
    // adding #0 makes it differed immediate assertion
	assert #0(y_o == expected)
      $display("[PASS]: Input: %b, Ouput: %b, Expected: %b", i_i, y_o, expected);
    else
      $display("[FAIL]: Input: %b, Ouput: %b, Expected: %b", i_i, y_o, expected);
  end

endmodule