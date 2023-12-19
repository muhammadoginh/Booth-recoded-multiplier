`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/14 12:25:26
// Design Name: 
// Module Name: Booth_Recoded_Mult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: both multiplicand and multiplier are 16-bit signed Two's complement
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Booth_Recoded_Mult(
    input clk,
    input rstn,
    input signed [15:0] x_org,         // multiplicand
    input signed [15:0] y_org,         // multiplier
    output reg signed [31:0] result_org    // result = xy
    );
    
    wire [7:0] one;
    wire [7:0] two;
    wire [7:0] sign;
    
    wire signed [15:0] temp_pp1, temp_pp2, temp_pp3, temp_pp4, temp_pp5, temp_pp6, temp_pp7, temp_pp8;
    reg signed [31:0] partial_adder1, partial_adder2, partial_adder3, partial_adder4, partial_adder5, partial_adder6, partial_adder7;
    
    
    reg [15:0] x;
    reg [15:0] y;
    reg [31:0] result;
    
    
    // input registers
    always @ (posedge clk or negedge rstn) begin
        if (~rstn) begin
            x <= 16'b0;
            y <= 16'b0;
        end
        else begin
            x <= x_org;
            y <= y_org;
        end
    end

    
    // booth encoder apply to multiplier
    Booth_Encoder encode1(
        .Y0(1'b0),      // this value serve as LSB
        .Y1(y[0]),      // represent Y_{i}
        .Y2(y[1]),      // represent  Y_{i+1}
        .X(one[0]),     // represent X
        .XX(two[0]),    // represent 2X
        .NEG(sign[0])   // represent NEG);
    );
    Booth_Encoder encode2(y[1], y[2], y[3], one[1], two[1], sign[1]);
    Booth_Encoder encode3(y[3], y[4], y[5], one[2], two[2], sign[2]);
    Booth_Encoder encode4(y[5], y[6], y[7], one[3], two[3], sign[3]);
    Booth_Encoder encode5(y[7], y[8], y[9], one[4], two[4], sign[4]);
    Booth_Encoder encode6(y[9], y[10], y[11], one[5], two[5], sign[5]);
    Booth_Encoder encode7(y[11], y[12], y[13], one[6], two[6], sign[6]);
    Booth_Encoder encode8(y[13], y[14], y[15], one[7], two[7], sign[7]);
    
    // partial product generator (summand)
    // because we compress the size of multiplier become a half of it so that we just have 8 partial product generation
    // partial product 1
    Partial_Product PP0(clk, x, one[0], two[0], sign[0], temp_pp1);
    
    // partial product 2
    Partial_Product PP1(clk, x, one[1], two[1], sign[1], temp_pp2);
    
    // partial product 3
    Partial_Product PP2(clk, x, one[2], two[2], sign[2], temp_pp3);
    
    // partial product 4
    Partial_Product PP3(clk, x, one[3], two[3], sign[3], temp_pp4);
    
    // partial product 5
    Partial_Product PP4(clk, x, one[4], two[4], sign[4], temp_pp5);
    
    // partial product 6
    Partial_Product PP5(clk, x, one[5], two[5], sign[5], temp_pp6);
    
    // partial product 7
    Partial_Product PP6(clk, x, one[6], two[6], sign[6], temp_pp7);
    
    // partial product 8
    Partial_Product PP7(clk, x, one[7], two[7], sign[7], temp_pp8); 
    
    
    // this was intended for first stage pipeline
    reg signed [15:0] temp_pp1_d, temp_pp2_d, temp_pp3_d, temp_pp4_d, temp_pp5_d, temp_pp6_d, temp_pp7_d, temp_pp8_d;
    
    always @ (posedge clk or negedge rstn) begin
        if (~rstn) begin
            temp_pp1_d <= 16'b0;
            temp_pp2_d <= 16'b0;
            temp_pp3_d <= 16'b0;
            temp_pp4_d <= 16'b0;
            temp_pp5_d <= 16'b0;
            temp_pp6_d <= 16'b0;
            temp_pp7_d <= 16'b0;
            temp_pp8_d <= 16'b0;
        end
        else begin
            temp_pp1_d <= temp_pp1;
            temp_pp2_d <= temp_pp2;
            temp_pp3_d <= temp_pp3;
            temp_pp4_d <= temp_pp4;
            temp_pp5_d <= temp_pp5;
            temp_pp6_d <= temp_pp6;
            temp_pp7_d <= temp_pp7;
            temp_pp8_d <= temp_pp8;
        end
    end
    
    
    // Final Adder
    //    assign partial_adder1 = $signed({temp_pp1, $signed(16'b0)}) >>> 2;
    //    assign partial_adder2 = $signed(partial_adder1 + {temp_pp2, $signed(16'b0)}) >>> 2;
    //    assign partial_adder3 = $signed(partial_adder2 + {temp_pp3, $signed(16'b0)}) >>> 2;
    //    assign partial_adder4 = $signed(partial_adder3 + {temp_pp4, $signed(16'b0)}) >>> 2;
    //    assign partial_adder5 = $signed(partial_adder4 + {temp_pp5, $signed(16'b0)}) >>> 2;
    //    assign partial_adder6 = $signed(partial_adder5 + {temp_pp6, $signed(16'b0)}) >>> 2;
    //    assign partial_adder7 = $signed(partial_adder6 + {temp_pp7, $signed(16'b0)}) >>> 2;
        
    //    assign result = partial_adder7 >>> 2;
    
    // this was intended for second stage pipeline
    always @ (posedge clk or negedge rstn) begin
        if (~rstn) begin
            partial_adder1 <= 32'b0;
            partial_adder2 <= 32'b0;
            partial_adder3 <= 32'b0;
            partial_adder4 <= 32'b0;
            partial_adder5 <= 32'b0;
            partial_adder6 <= 32'b0;
            partial_adder7 <= 32'b0;
            
            result <= partial_adder7 >>> 2; // serve as partial product at the same time
        end
        else begin
            partial_adder1 <= $signed({temp_pp1, $signed(16'b0)}) >>> 2;
            partial_adder2 <= $signed(partial_adder1 + {temp_pp2, $signed(16'b0)}) >>> 2;
            partial_adder3 <= $signed(partial_adder2 + {temp_pp3, $signed(16'b0)}) >>> 2;
            partial_adder4 <= $signed(partial_adder3 + {temp_pp4, $signed(16'b0)}) >>> 2;
            partial_adder5 <= $signed(partial_adder4 + {temp_pp5, $signed(16'b0)}) >>> 2;
            partial_adder6 <= $signed(partial_adder5 + {temp_pp6, $signed(16'b0)}) >>> 2;
            partial_adder7 <= $signed(partial_adder6 + {temp_pp7, $signed(16'b0)}) >>> 2;
            
            result <= partial_adder7 >>> 2; // serve as partial product at the same time
        end
    end
    
    
    // output registers
    always @ (posedge clk or negedge rstn) begin
        if (~rstn) begin
            result_org <= 32'b0;
        end
        else begin
            result_org <= result;
        end
    end
    
    
    
endmodule
