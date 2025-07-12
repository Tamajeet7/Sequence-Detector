`timescale 1ns / 1ps

module seq_1010_tb;

reg clk, rst, din;
wire dout;

always
    #5 clk = ~clk;
    
initial begin

    clk = 0;
    rst = 1;
    din = 0;
    
    #25 rst = 0;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    
    #40 $stop;
    
end

//Instantiation
seq_1010 dut(.i_clock(clk),.i_reset(rst),.i_btn(din),.o_led(dout));

endmodule
