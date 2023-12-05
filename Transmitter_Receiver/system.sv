//----------------------------------------------------------------------------
// Title       : Transmitter Receiver
//----------------------------------------------------------------------------

module system(
  input               clock       , // Clock input
  input               reset       , // Active low synchronous reset
  input               start       , // Active high start input
  input        [10:0] address_bus , // Address Bus
  output logic        ready         // Active low ready output
);
  
  logic [ 9:0] address;
  logic        select ;
  logic [15:0] data   ;
  logic        ack1   ;
  logic        ack2   ;
  
  // Transmitter
  always_ff @(negedge clock) begin
    if(!reset) begin
      address <= 10'h0;
      select  <= 1'b0 ;
      data    <= 16'h0;
      ready   <= 1'b1 ;
    end else begin
      if(start) begin
        ready   <= 1'b1            ; // Ready is made high
        select  <= address_bus[10] ; // MSB of address_bus is select line
        address <= address_bus[9:0]; // Actual address
        data    <= data + 4'h4     ; // Dummy data
      end else if(ack1 | ack2) begin
      // When ack1 or ack2 is high ready is made low
        ready <= 1'b0;
      end else begin
      // Ready is held high
        ready <= 1'b1;
      end
    end
  end
  
  // Receiver 1
  always_ff @(negedge clock) begin
    if(!reset) begin
      ack1 <= 1'b1;
    end else begin
      if(!select) begin
        ack1 <= 1'b0;
      end else begin
        ack1 <= 1'b1;
      end
    end
  end
  
  // Receiver 2
  always_ff @(negedge clock) begin
    if(!reset) begin
      ack2 <= 1'b1;
    end else begin
      if(select) begin
        ack2 <= 1'b0;
      end else begin
        ack2 <= 1'b1;
      end
    end
  end
  
endmodule