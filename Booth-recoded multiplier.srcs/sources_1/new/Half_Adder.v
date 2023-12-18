`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/12 21:54:14
// Design Name: 
// Module Name: Half_Adder
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


module Half_Adder(
    input A,
    input B,
    output reg Cout,
    output reg Sum
    );
    
    // Half adder using Behavioral level of abstraction
    always @ (A or B)
    begin
        Cout = A & B;   // Continuous assignment, Cout is continuously updated based on the values of A and B.
        Sum = A ^ B;    // Continuous assignment, Sum is continuously updated based on the values of A and B.
    end
    
endmodule
