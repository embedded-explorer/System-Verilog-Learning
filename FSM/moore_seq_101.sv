//----------------------------------------------------------------------------
// Title       : Moore FSM to detect 101 sequence
// File        : moore_seq_101.sv
//----------------------------------------------------------------------------

module moore_seq_101(
  input        clk_i     , // Clock input
  input        rst_n_i   , // Active high reset
  input        data_i    , // Serial data input
  output logic seq_det_o   // Sequence detected output
);
  
  // Declare data type for fsm encoding
  typedef enum logic [1:0]{
    S_S0 = 2'b00,
    S_S1 = 2'b01,
    S_S2 = 2'b10,
    S_S3 = 2'b11
  } fsm_state_t;
  
  // Declare FSM state registers
  fsm_state_t curr_state;
  fsm_state_t next_state;
  
  // Sequential State change logic
  always_ff @(posedge clk_i) begin
    if(!rst_n_i) begin
    // Upon reset
      curr_state <= S_S0      ; // Move to S0 state
    end else begin
      curr_state <= next_state; // synchroously assign next state
    end
  end
  
  // Combinational next state decoder
  always_comb begin
    case(curr_state)
    // Next state depends on current state and applied input
    
      S_S0 : begin
        if(data_i == 1'b1) begin
        // Move to S1 state, 1 is detected
          next_state = S_S1;
        end else begin
        // Stay in S0 state, 0 is detected
          next_state = S_S0;
        end
      end
      
      // S1 state indicates 1 is detected
      S_S1   : begin
        if(data_i == 1'b0) begin
        // Move to S2 state, 10 is detected
          next_state = S_S2;
        end else begin
        // Stay in S1 state, 11 is detected
          next_state = S_S1;
        end
      end
      
      // S2 state indicates 10 is detected
      S_S2   : begin
        if(data_i == 1'b1) begin
        // Move to S3 state, 101 is detected
          next_state = S_S3;
        end else begin
        // Move to S0 state, 100 is detected
          next_state = S_S0;
        end
      end
      
      // S3 state indicates 101 is detected
      S_S3   : begin
        if(data_i == 1'b1) begin
        // Move to S1 state, 101_1 is detected
          next_state = S_S1;
        end else begin
        // Move to S0 state, 10_10 is detected
          next_state = S_S2;
        end
      end
      
      default: begin
        next_state = S_S0;
      end
    endcase
  end
  
  // Combinational output logic
  always_comb begin
    // Output will be high in S3 state
    seq_det_o = (curr_state == S_S3);
  end
  
endmodule