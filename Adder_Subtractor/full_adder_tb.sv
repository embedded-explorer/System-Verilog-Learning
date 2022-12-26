//----------------------------------------------------------------------------
// Title       : Full Adder Testbench
// File        : full_adder_tb.sv
//----------------------------------------------------------------------------

module full_adder_tb();

  logic a_i;
  logic b_i;
  logic c_i;
  logic s_o;
  logic c_o;

  // Instantiation
  full_adder dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    a_i = 1'b0;
    b_i = 1'b0;
    c_i = 1'b0;
    
    for(int i=0; i<8; i++) begin
      {a_i, b_i, c_i} = i;
      #10;
      if({c_o, s_o} == (a_i + b_i + c_i)) begin
        $display($time, " : A = %0b, B = %0b, C-I = %0b, S = %0b, C-O = %0b : PASS", a_i, b_i, c_i, s_o, c_o);
      end else begin
        $display($time, " : A = %0b, B = %0b, C-I = %0b, S = %0b, C-O = %0b : FAIL", a_i, b_i, c_i, s_o, c_o);
      end
    end
    #10 $finish;
  end
  
endmodule