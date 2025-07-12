`timescale 1ns/1ps

module tb_moore_1010_overlap;

    reg clk, reset, x;
    wire y;

    moore_1010_overlap uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\t x\t y");
        $monitor("%g\t %b\t %b", $time, x, y);

        // Initialization
        reset = 1; x = 0;
        #10 reset = 0;

        // Send input: 1 0 1 0 1 0 1 0 1 0
        repeat(2) @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;

        #20 $finish;
    end

endmodule
