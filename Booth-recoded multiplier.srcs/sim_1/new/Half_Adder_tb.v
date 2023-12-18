`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 22:54:54
// Design Name: 
// Module Name: Half_Adder_tb
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


module Half_Adder_tb();

    // input
    reg A;
    reg B;

    // output
    wire Cout;
    wire Sum;
    
    // instantiate unit under test
    Half_Adder uut(A, B, Cout, Sum);
    
    // model the stimuli
    initial
    begin
        A = 1'b0;
        B = 1'b0;
    end
    
    always #2 A = A + 1;
    always #1 B = B + 1;
    
    initial $monitor($time, A, B, Cout, Sum);
    
    initial #5 $finish;
    
endmodule
