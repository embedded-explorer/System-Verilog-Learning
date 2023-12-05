//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

class transaction;
  
  rand logic [10:0] address_bus;
  rand logic        start      ;
  
  // Constraint start to be always 1
  constraint start_const{start == 1;};
  
endclass