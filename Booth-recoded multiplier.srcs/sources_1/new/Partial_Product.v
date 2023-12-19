`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 13:18:46
// Design Name: 
// Module Name: Partial_Product
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
 

module Partial_Product(
    input clk,
    input signed [15:0] X,
    input one,        // represent X
    input two,        // represent 2X
    input sign,       // represent NEG
    output reg signed [15:0] pp
);

    // sign two one operation  Description
    //   0   0   0      0X
    //   0   0   1     +1X     X
    //   0   1   0     +2X     X shifted left by 1 bit
    //   1   1   0     -2X     X inverted, +1, shifted left by 1 bit
    //   1   0   1     -1X     X inverted, +1
    //   1   0   0     -0X
    
    always @(posedge clk) begin
        case ({sign, two, one})
            3'b000: pp = {16'b0};
            3'b001: pp = {X};
            3'b010: pp = {X} << 1;
            3'b110: pp = {(~X + 1)} << 1;
            3'b101: pp = {(~X + 1)};
            3'b100: pp = {16'b0};
            default: pp = {16'b0};
        endcase
    end

endmodule

