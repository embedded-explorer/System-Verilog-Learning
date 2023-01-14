//----------------------------------------------------------------------------
// Title       : Ripple Carry Adder Verification Environment
// Design      : Package
// File        : rca_package.sv
//----------------------------------------------------------------------------

package rca_package;
  
  `define ADDER_WIDTH 4

  // Declare transaction clss
  class transaction;
  
    randc bit [`ADDER_WIDTH-1:0] a_i;
    randc bit [`ADDER_WIDTH-1:0] b_i;
    randc bit                    c_i;
          bit [`ADDER_WIDTH-1:0] s_o;
          bit                    c_o;
      
    function void display(string name);
      $display ("----------------------------");
      $display (" %s", name);
      $display ("----------------------------");
      $display ("A = %0d, B = %0d, C = %0d", a_i, b_i, c_i);
      $display ("Result = %d", {c_o, s_o});
      $display ("----------------------------");
    endfunction
      
  endclass

endpackage