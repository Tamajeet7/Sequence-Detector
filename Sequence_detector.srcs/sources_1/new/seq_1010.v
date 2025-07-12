`timescale 1ns / 1ps

module seq_1010(
    //global signals
    input  i_clock,
    input  i_reset,
    
    //btn
    input  i_btn,
    
    //led
    output o_led
    );
    
    //local parameters
    localparam [2:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    
    //wires
    reg [2:0] state, nextstate;
    
    always @(posedge i_clock) begin
        if (i_reset)
            state <= 3'b000;
        else
            state <= nextstate;
    end
    
    always @ (*)begin
        
        //storing the state
        nextstate = state;
        
        //FSM
        case(state)
        
            S0: nextstate <= i_btn ? S1 : S0;
            S1: nextstate <= i_btn ? S1 : S2;
            S2: nextstate <= i_btn ? S3 : S2;
            S3: nextstate <= i_btn ? S3 : S4;
            S4: nextstate <= i_btn ? S1 : S0;
        
        endcase
    end
    assign o_led = (state == S4);
endmodule
