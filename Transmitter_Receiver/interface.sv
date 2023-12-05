//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

interface intf(input bit clock, input bit reset);

  logic        start       ; // Active high start input
  logic [10:0] address_bus ; // Address Bus
  logic        ready       ; // Active low ready output

endinterface