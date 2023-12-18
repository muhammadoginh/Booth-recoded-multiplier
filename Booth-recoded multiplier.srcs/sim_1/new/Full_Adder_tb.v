`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 23:00:57
// Design Name: 
// Module Name: Full_Adder_tb
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


module Full_Adder_tb();

    // input
    reg A;
    reg B;
    reg Cin;
    
    // output
    wire Cout;
    wire Sum;
    
    // instantiate unit under test
    Full_Adder uut(A, B, Cin, Cout, Sum);
    
    // model the stimuli
    initial
    begin
        A = 0;
        B = 0;
        Cin = 0;
    end
    
    always #4 A = A + 1;
    always #2 B = B + 1;
    always #1 Cin = Cin + 1;

    
    initial $monitor($time, A, B, Cin, Cout, Sum);
    
    initial #10 $finish;
    
endmodule
