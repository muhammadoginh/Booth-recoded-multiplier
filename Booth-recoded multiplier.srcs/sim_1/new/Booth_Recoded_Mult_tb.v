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
    reg clk;
    reg rstn;
    reg signed [15:0] x;         // multiplicand
    reg signed [15:0] y;         // multiplier
   
    // output
    wire signed [31:0] result;   // result = xy
    
    // instatntiate unit under test
    Booth_Recoded_Mult uut(clk,rstn,x,y,result);
    
    // generate stimuli
    initial
    begin
        clk = 0;
        rstn = 0;
        x = -33;
        y = -40;
        #10
        x = 50;
        y = -24;
        #10
        x = -22;
        y = -32;
        #10
        x = 350;
        y = -2;
    end
    
    always #2 clk = ~clk;
    always #5 rstn = 1;
    
    // monitor in console
    initial $monitor($time,clk, rstn, x, y, result);
    
    // finish the simulation
    initial #80 $finish;
endmodule
