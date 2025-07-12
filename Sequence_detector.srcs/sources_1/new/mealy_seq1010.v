`timescale 1ns / 1ps

module mealy_seq1010(
    input clk,
    input rst,
    input btn,
    output reg led
    );
    
    localparam [2:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    
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
            S2 : next_state <= btn ? S3 : S0;
            S3 : next_state <= btn ? S1 : S0; //non-overlapping
            //S3 : next_state <= btn ? S1 : S2; //overlapping
        endcase
        
    end
    
    always @ (posedge clk) begin
        
        if(rst)
            led <= 1'b0;
        else begin 
            if ( ~btn & (state == S3))
                led <= 1'b1;
            else
                led <= 1'b0;
            end
    end    
endmodule
