`timescale 1ns/1ps

module tb_mealy_1010_nonoverlap;

    reg clk, reset, x;
    wire y;

    mealy_1010_nonoverlap uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\t x\t y");
        $monitor("%g\t %b\t %b", $time, x, y);

        reset = 1; x = 0;
        #10 reset = 0;

        repeat(2) @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0; // detection
        @(posedge clk); x = 1;
        @(posedge clk); x = 0; // should NOT detect due to non-overlapping
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;
        @(posedge clk); x = 1;
        @(posedge clk); x = 0;

        #20 $finish;
    end

endmodule
