//----------------------------------------------------------------------------
// Title       : Half Adder Testbench
// File        : half_adder_tb.sv
//----------------------------------------------------------------------------

module half_adder_tb();

  logic a_i;
  logic b_i;
  logic s_o;
  logic c_o;

  // Instantiation
  half_adder dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    a_i = 1'b0;
    b_i = 1'b0;
    
    for(int i=0; i<4; i++) begin
      {a_i, b_i} = i;
      #10;
      if({c_o, s_o} == (a_i + b_i)) begin
        $display($time, " : A = %0b, B = %0b, Sum = %0b, Carry = %0b : PASS", a_i, b_i, s_o, c_o);
      end else begin
        $display($time, " : A = %0b, B = %0b, Sum = %0b, Carry = %0b : FAIL", a_i, b_i, s_o, c_o);
      end
    end
    #10 $finish;
  end
  
endmodule