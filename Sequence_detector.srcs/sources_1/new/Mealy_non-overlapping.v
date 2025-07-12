module mealy_1010_nonoverlap (
    input clk,
    input reset,
    input x,
    output reg y
);

    localparam S0 = 2'b00,
               S1 = 2'b01,
               S2 = 2'b10,
               S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        y = 0;
        case (state)
            S0: next_state = (x == 1) ? S1 : S0;
            S1: next_state = (x == 0) ? S2 : S0;
            S2: next_state = (x == 1) ? S3 : S0;
            S3: begin
                if (x == 0) begin
                    y = 1;            // pattern detected
                    next_state = S0;  // non-overlapping: reset
                end else begin
                    next_state = S0;
                end
            end
            default: next_state = S0;
        endcase
    end

endmodule
