//----------------------------------------------------------------------------
// Title       : 4-Bit Ripple Carry Adder Testbench
// File        : ripple_carry_adder_tb.sv
//----------------------------------------------------------------------------

module ripple_carry_adder_tb();

  logic [3:0] a_i;
  logic [3:0] b_i;
  logic       c_i;
  logic [3:0] s_o;
  logic       c_o;

  // Instantiation
  ripple_carry_adder dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    a_i = 4'h0;
    b_i = 4'h0;
    c_i = 1'b0;
    
    for(int i=0; i<512; i++) begin
      {a_i, b_i, c_i} = {i};
      #10;
      if({c_o, s_o} == (a_i + b_i + c_i)) begin
        $display($time, " : A = %0d, B = %0d, C-I = %0d, Result = %0d : PASS", a_i, b_i, c_i, {c_o, s_o});
      end else begin
        $display($time, " : A = %0d, B = %0d, C-I = %0d, Result = %0d : FAIL", a_i, b_i, c_i, {c_o, s_o});
      end
    end
    #10 $finish;
  end
  
endmodule