`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 22:58:43
// Design Name: 
// Module Name: Wallace_Tree_Reduction
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


module Wallace_Tree_Reduction(
    input [15:0] PP1,
    input [15:0] PP2,
    input [15:0] PP3,
    input [15:0] PP4,
    input [15:0] PP5,
    input [15:0] PP6,
    input [15:0] PP7,
    input [15:0] PP8,
    input [15:0] PP9,
    input [15:0] PP10,
    input [15:0] PP11,
    input [15:0] PP12,
    input [15:0] PP13,
    input [15:0] PP15,
    input [15:0] PP16,
    output [30:0] PPR1,
    output [30:0] PPR2
    );
    
    wire [6:0] CarryStage1, SumStage1;
    
    // This array block will uses carry-save array
    // wallace tree reduction using dadda, d_{k+1} = Floor((3/2)*d_k) d_0 = 2
    // d_1 = 3, d_2 = 4, d_3 = 6, d_4 = 9, d_5 = 13, d_6 = 19 (>16, stop at d_5)
    // stage 1, d_5 = 13
    Half_Adder HA1(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA1(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA2(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA3(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA4(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA5(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA2(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA6(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA7(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA8(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA3(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Half_Adder HA4(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    
    // stage 2, d_4 = 9
    Half_Adder HA5(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA9(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA10(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA11(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA12(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA13(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA14(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA15(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA16(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA17(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA18(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA19(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA20(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA21(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA6(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA22(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA23(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA24(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA25(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA26(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA27(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA28(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA29(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA30(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA31(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA32(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA7(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA33(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA34(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA35(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA36(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA37(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA38(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA39(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA40(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA41(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA8(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA42(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA43(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA44(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA45(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA46(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA47(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA48(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    
    // stage 3, d_3 = 6
    Half_Adder HA9(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA49(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA50(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA51(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA52(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA53(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA54(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA55(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA56(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA57(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA58(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA59(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA60(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA61(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA62(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA63(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA64(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA65(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA66(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA67(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA68(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA10(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA69(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA70(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA71(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA72(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA73(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA74(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA75(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA76(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA77(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA78(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA79(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA80(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA81(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA82(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA83(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA84(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA85(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA86(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA11(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA87(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA88(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA89(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA90(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA91(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA92(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA93(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA94(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA95(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA96(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA97(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA98(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA99(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA100(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA101(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA102(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    
    // stage 4, d_2 = 4
    Half_Adder HA12(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA103(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA104(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA105(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA106(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA107(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA108(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA109(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA110(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA111(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA112(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA113(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA114(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA115(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA116(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA117(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA118(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA119(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA120(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA121(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA122(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA123(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA124(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA125(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA126(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Half_Adder HA13(PP1[13], PP2[12], CarryStage1[0], SumStage1[0]);
    Full_Adder FA127(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA128(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA129(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA130(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA131(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA132(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA133(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA134(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA135(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA136(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA137(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA138(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA139(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA140(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA141(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA142(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA143(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA144(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA145(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA146(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA147(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    Full_Adder FA148(PP1[14], PP2[13], PP3[12], CarryStage1[1], SumStage1[1]);
    
    
endmodule
