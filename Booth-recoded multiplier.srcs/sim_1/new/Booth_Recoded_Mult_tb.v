`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/18 09:50:33
// Design Name: 
// Module Name: Booth_Recoded_Mult_tb
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


module Booth_Recoded_Mult_tb();

    // input
    reg signed [15:0] x;         // multiplicand
    reg signed [15:0] y;         // multiplier
   
    // output
    wire signed [31:0] result;   // result = xy
    
    // instatntiate unit under test
    Booth_Recoded_Mult uut(x,y,result);
    
    // generate stimuli
    initial
    begin
        x = -33;
        y = -40;
        #20
        x = 50;
        y = -24;
        #20
        x = -22;
        y = -32;
        #20
        x = 350;
        y = -2;
    end
    
    // monitor in console
    initial $monitor($time, x, y, result);
    
    // finish the simulation
    initial #80 $finish;
endmodule
