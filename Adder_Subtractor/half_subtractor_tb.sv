//----------------------------------------------------------------------------
// Title       : Half Subtractor Testbench
// File        : half_subtractor_tb.sv
//----------------------------------------------------------------------------

module half_subtractor_tb();

  logic a_i;
  logic b_i;
  logic d_o;
  logic b_o;

  // Instantiation
  half_subtractor dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    a_i = 1'b0;
    b_i = 1'b0;
    
    for(int i=0; i<4; i++) begin
      {a_i, b_i} = i;
      #10;
      if({b_o, d_o} == (a_i - b_i)) begin
        $display($time, " : A = %0b, B = %0b, Diff = %0b, Borrow = %0b : PASS", a_i, b_i, d_o, b_o);
      end else begin
        $display($time, " : A = %0b, B = %0b, Diff = %0b, Borrow = %0b : FAIL", a_i, b_i, d_o, b_o);
      end
    end
    #10 $finish;
  end
  
endmodule