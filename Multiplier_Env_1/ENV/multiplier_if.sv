//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition Verification
// Design      : Interface
// File        : multiplier_if.sv
//----------------------------------------------------------------------------

interface multiplier_if(input bit clock, input bit reset);

  // Declare the signals
  logic        start     ; // Start
  logic [ 3:0] data_in   ; // Input Data
  logic [ 7:0] result    ; // Product
  logic        done      ; // Done

  // Driver modport
  modport drv_mp(
    input  clock  ,
    input  reset  ,
    output start  ,
    output data_in
  );

  // Monitor modport
  modport mon_mp(
    input    clock   ,
    input    reset   ,
    input    start   ,
    input    data_in ,
    input    done    ,
    input    result
  );

  // DUT modport
  modport dut_mp(
    input  clock   ,
    input  reset   ,
    input  start   ,
    input  data_in ,
    output result  ,
    output done
  );

endinterface