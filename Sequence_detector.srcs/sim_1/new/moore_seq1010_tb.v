`timescale 1ns / 1ps

module seq1010_tb;
    
    reg clk, rst, btn;
    wire led;
    
    moore_seq1010 dut(clk,rst,btn,led);
    wire [2:0] state_tb = dut.state;
    always #5 clk = ~clk;
    
    initial begin
    
        clk = 0;
        rst = 1;
        btn = 0;
        
        #20 rst = 0;
        #10 btn = 1;
        #10 btn = 0;
        #10 btn = 1;
        #10 btn = 0;
        #10 btn = 1; 
        #10 btn = 0;
        #10 btn = 0;
        #10 btn = 0;
        #10 btn = 1;
        #10 btn = 0;
        #10 btn = 1;
        #10 btn = 0;
        
        #40 $stop;
    end
    
endmodule
