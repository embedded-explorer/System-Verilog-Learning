//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

// Interface
interface intf;

  bit [31:0] header;
  bit [15:0] payload;
  bit [3:0]          command;
  bit [1:0]          master_id;
  bit                parity;
  bit                ack;
    
endinterface