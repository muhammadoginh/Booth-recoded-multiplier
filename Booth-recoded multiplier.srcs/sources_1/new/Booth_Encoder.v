`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 07:27:59
// Design Name: 
// Module Name: Booth_Encoder
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


module Booth_Encoder(
    input Y0,       // represent Y_{i-1}
    input Y1,       // represent Y_{i}
    input Y2,       // represent  Y_{i+1}
    output reg X,       // represent X
    output reg XX,      // represent 2X
    output reg NEG      // represent NEG
    );
    
    // Booth Encoder using Behavioral level of abstraction
    always @ (*)
    begin
        X = Y0 ^ Y1;
        XX = (Y2)? (~Y1 & ~Y0) : (Y1 & Y0);
        NEG = Y2;
    end
    
endmodule
