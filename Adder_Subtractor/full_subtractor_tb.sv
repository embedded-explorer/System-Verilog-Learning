//----------------------------------------------------------------------------
// Title       : Full Subtractor Testbench
// File        : full_subtractor_tb.sv
//----------------------------------------------------------------------------

module full_subtractor_tb();

  logic a_i  ;
  logic b_i  ;
  logic bor_i;
  logic dif_o;
  logic bor_o;

  // Instantiation
  full_subtractor dut(.*); // System Verilog Implicit Instantiation
  
  // Input Generation
  initial begin
    a_i   = 1'b0;
    b_i   = 1'b0;
    bor_i = 1'b0;
    
    for(int i=0; i<8; i++) begin
      {a_i, b_i, bor_i} = i;
      #10;
      if({bor_o, dif_o} == (a_i - b_i - bor_i)) begin
        $display($time, " : A = %0b, B = %0b, B-I = %0b, D = %0b, B-O = %0b : PASS", a_i, b_i, bor_i, dif_o, bor_o);
      end else begin
        $display($time, " : A = %0b, B = %0b, B-I = %0b, D = %0b, B-O = %0b : FAIL", a_i, b_i, bor_i, dif_o, bor_o);
      end
    end
    #10 $finish;
  end
  
endmodule