//----------------------------------------------------------------------------
// Title       : Randomization Example
//----------------------------------------------------------------------------

package packet_package;
  
  // Enumerate type
  typedef enum {A, B, C} pkt;
    
  // Transaction class with parameter
  class transaction;
    rand pkt               pky_type ; // Enumerated Packet Type
    rand bit [31:0] header   ; // Random parametrized header
    rand bit [15:0] payload  ; // Random parametrized payload
         bit [3:0]         command  ; // 4-Bit Command
         bit [1:0]         master_id; // 2-Bit Master ID
         bit               parity   ; // 1-Bit Parity
         bit               ack      ; // 1-Bit Ack
    
    // Apply constraint on LSB of header to be always 0  
    constraint lsb {header[0] == 0;};
    
    // Apply constraint on MSB of payload to be always 1
    constraint msb {payload[15] == 1;};
  endclass
    
endpackage