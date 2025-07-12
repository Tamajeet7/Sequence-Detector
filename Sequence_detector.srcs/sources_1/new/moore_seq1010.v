`timescale 1ns / 1ps

module moore_seq1010(
    input clk,
    input rst,
    input btn,
    output led
    );
    
    localparam [2:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    
    reg [2:0] state, next_state;
    
    always @ (posedge clk) 
        begin
            if(rst)
                state <= 3'b000;
            else
                state <= next_state;
        end
    
    always @ (*) begin 
        
        next_state = state;
        
        case(state)
            
            S0 : next_state <= btn ? S1 : S0;
            S1 : next_state <= btn ? S1 : S2;
            S2 : next_state <= btn ? S3 : S2;
            S3 : next_state <= btn ? S3 : S4;
            //S4 : next_state <= btn ? S1 : S0; //Non-overlapping
            S4 : next_state <= btn ? S3 : S0; //Overlapping
        endcase
        
    end
    
    assign led = (state == S4) ? 1 : 0;
 
endmodule
