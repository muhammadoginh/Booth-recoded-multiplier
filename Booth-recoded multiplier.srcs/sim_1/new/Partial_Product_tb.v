`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 19:29:35
// Design Name: 
// Module Name: Partial_Product_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Partial_Product_tb();

        // input
        reg signed [15:0] X;
        reg one;    // represent X
        reg two;    // represent 2X
        reg sign;   // represent NEG
    
        // output
        wire signed [15:0] pp;
        
        // instantiate the unit under test
        Partial_Product uut(X, one, two, sign, pp);
        
        // generate stimuli
        // sign two one operation  Description
        //   0   0   0      0X
        //   0   0   1     +1X     X
        //   0   1   0     +2X     X shifted left by 1 bit
        //   1   1   0     -2X     X inverted, +1, shifted left by 1 bit
        //   1   0   1     -1X     X inverted, +1
        //   1   0   0     -0X
        initial
        begin
            X = 350;
            one = 1'b0;
            two = 1'b1;
            sign = 1'b1;
            #10
            sign = 1'b0;
            one = 1'b1;
            two = 1'b0;
            #10
            sign = 1'b1;
            one = 1'b1;
            two = 1'b0;
            #10
            sign = 1'b0;
            one = 1'b0;
            two = 1'b1;
        end
        
        // monitor the output in console
        initial $monitor($time, X, one, two, sign, pp);
        
        // finish the simulation
        initial #40 $finish;
endmodule
