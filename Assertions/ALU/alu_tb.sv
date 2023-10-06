//----------------------------------------------------------------------------
// Title       : Concurrent Assertions for ALU
// Design      : Testbench
// File        : alu_tb.sv
//----------------------------------------------------------------------------
module alu_tb();
  
  reg        clk_i   ;
  reg  [7:0] a_i     ;
  reg  [7:0] b_i     ;
  reg  [2:0] opcode_i;
  wire [7:0] result_o;
  
  integer i;
  
  // Instantiation of design
  alu dut(.*);
  
  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  // Initial block to drive inputs
  initial begin
    a_i = 8'h0; b_i = 8'h0; opcode_i = 8'h0;
    
    // Directed Inputs
    @(posedge clk_i);
    a_i <= 8'b0101_0010; b_i <= 8'b0010_1010;

    for(i=0; i<8; i=i+1)begin
      @(posedge clk_i);
      opcode_i <= i;
    end
    
    // Random Inputs
    repeat(20)begin
      @(posedge clk_i);
      opcode_i <= {$random()}%8;
      a_i      <= {$random()}%255;
      b_i      <= {$random()}%255;
    end
    
    #100 $finish;
  end
  
  // Initial block to monitor the signals
  initial begin
    $monitor($time, " A = %b, B = %b, Result = %b, Opcode = %b", a_i, b_i, result_o, opcode_i);
  end
  
  // Assertions
  // 1. Addition
  sequence seq1;
    (opcode_i == 3'h0);
  endsequence

  sequence seq2;
    (result_o == ($past(a_i) + $past(b_i)));
  endsequence

  ADD : 
  assert property(@(posedge clk_i) seq1 |=> seq2)
    $display("Addition is Passed");
  else
    $error("Addition is Failed");
    
  // 2. Subtraction
  sequence seq3;
    (opcode_i == 3'h1);
  endsequence

  sequence seq4;
    (result_o == ($past(a_i) - $past(b_i)));
  endsequence

  SUB : 
  assert property(@(posedge clk_i) seq3 |=> seq4)
    $display("Subtraction is Passed");
  else
    $error("Subtraction is Failed");

  // 3. Negation
  sequence seq5;
    (opcode_i == 3'h2);
  endsequence

  sequence seq6;
    (result_o == ~($past(a_i)));
  endsequence

  NEG : 
  assert property(@(posedge clk_i) seq5 |=> seq6)
    $display("Negation is Passed");
  else
    $error("Negation is Failed");

  // 4. Bitwise AND
  sequence seq7;
    (opcode_i == 3'h3);
  endsequence

  sequence seq8;
    (result_o == (($past(a_i)) & ($past(b_i))));
  endsequence

  AND : 
  assert property(@(posedge clk_i) seq7 |=> seq8)
    $display("Bitwise AND is Passed");
  else
    $error("Bitwise AND is Failed");
    
  // 5. Bitwise OR
  sequence seq9;
    (opcode_i == 3'h4);
  endsequence

  sequence seq10;
    (result_o == ($past(a_i)) | ($past(b_i)));
  endsequence

  OR : 
  assert property(@(posedge clk_i) seq9 |=> seq10)
    $display("Bitwise OR is Passed");
  else
    $error("Bitwise OR is Failed");
    
  // 6. Bitwise XOR
  sequence seq11;
    (opcode_i == 3'h5);
  endsequence

  sequence seq12;
    (result_o == ($past(a_i)) ^ ($past(b_i)));
  endsequence

  XOR : 
  assert property(@(posedge clk_i) seq11 |=> seq12)
    $display("Bitwise XOR is Passed");
  else
    $error("Bitwise XOR is Failed");

  // 7. Bitwise NAND
  sequence seq13;
    (opcode_i == 3'h6);
  endsequence

  sequence seq14;
    (result_o == ~(($past(a_i)) & ($past(b_i))));
  endsequence

  NAND : 
  assert property(@(posedge clk_i) seq13 |=> seq14)
    $display("Bitwise NAND is Passed");
  else
    $error("Bitwise NAND is Failed");

  // 8. Bitwise NOR
  sequence seq15;
    (opcode_i == 3'h7);
  endsequence

  sequence seq16;
    (result_o == ~(($past(a_i)) | ($past(b_i))));
  endsequence

  NOR : 
  assert property(@(posedge clk_i) seq15 |=> seq16)
    $display("Bitwise NOR is Passed");
  else
    $error("Bitwise NOR is Failed");

endmodule