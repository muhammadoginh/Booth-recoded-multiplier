`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/12 22:07:49
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input A,
    input B,
    input Cin,
    output reg Cout,
    output reg Sum
    );
    
    // Full adder using Behavioral level of abstraction
    always @ (*)
    begin
        Cout = (A & B) | (B & Cin) | (A & Cin);     // Continuous assignment, Cout is continuously updated based on the values of A, B, and Cin.
        Sum = A ^ B ^ Cin;                          // Continuous assignment, Sum is continuously updated based on the values of A, B, and Cin.
    end
    
endmodule
