`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 22:44:13
// Design Name: 
// Module Name: Booth_Encoder_tb
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


module Booth_Encoder_tb();

    // input
    reg Y0;       // represent Y_{i-1}
    reg Y1;       // represent Y_{i}
    reg Y2;       // represent  Y_{i+1}
    
    // output
    wire X;       // represent X
    wire XX;      // represent 2X
    wire NEG;      // represent NEG
    
    // instantiate unit under test
    Booth_Encoder uut(Y0, Y1, Y2, X, XX, NEG);
    
    // generate stimuli
    initial
    begin
        Y0 = 1'b0;
        Y1 = 1'b0;
        Y2 = 1'b0;
    end
    
    always #1 Y0 = Y0 + 1;
    always #2 Y1 = Y1 + 1;
    always #4 Y2 = Y2 + 1;
    
    initial $monitor($time, Y0, Y1, Y2, X, XX, NEG);
    
    initial #10 $finish;
    
endmodule
