`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 08:58:00 PM
// Design Name: 
// Module Name: HL
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


module HL(
    input HLCLK,
    input HLCLR,
    input HLCT,
    input [15:0] SW,
    output [7:0] HLSEG,
    output [3:0] HLAN,
    output [3:0] LED
    );
    
    logic CD_SW;
    logic [13:0] TA_MBB;
    logic [13:0] M1F_M2A;
    logic [13:0] M2F_SS;
    logic [3:0] R1_F1;
    logic [3:0] R2_F2;
    logic [3:0] R3_F3;
    logic [3:0] R4_F4;
    logic [13:0] BTB_M1B;
    logic CC_M2S;
    

clk_div2 CD_1 (.clk(HLCLK), .sclk(CD_SW));   
Stopwatch SW_1 (.CLR(HLCLR), .CLK(CD_SW), .DNE(CC_M2S), .TM(TA_MBB));
MUX M_1 (.MA(BTB_M1B), .MB(TA_MBB), .MSEL(HLCT), .MF(M1F_M2A));
MUX M_2 (.MA(M1F_M2A), .MB(TA_MBB), .MSEL(CC_M2S), .MF(M2F_SS));
univ_sseg SS_1 (.clk(HLCLK), .cnt1(M2F_SS), .valid(1'b1), .ssegs(HLSEG), .disp_en(HLAN), .mod_sel(2'b10));
RNG RNG_1 (.GEN(HLCLR), .CLK(HLCLK), .NUM(R1_F1));
RNG RNG_2 (.GEN(HLCLR), .CLK(HLCLK), .NUM(R2_F2));
RNG RNG_3 (.GEN(HLCLR), .CLK(HLCLK), .NUM(R3_F3));
RNG RNG_4 (.GEN(HLCLR), .CLK(HLCLK), .NUM(R4_F4));
CCFSM FSM_1 (.ANUM(SW[15:12]), .GNUM(R1_F1), .FCLK(HLCLK), .LED(LED[0]));
CCFSM FSM_2 (.ANUM(SW[11:8]), .GNUM(R2_F2), .FCLK(HLCLK), .LED(LED[1]));
CCFSM FSM_3 (.ANUM(SW[7:4]), .GNUM(R3_F3), .FCLK(HLCLK), .LED(LED[2]));
CCFSM FSM_4 (.ANUM(SW[3:0]), .GNUM(R4_F4), .FCLK(HLCLK), .LED(LED[3]));
BCD_BIN BCTB_1 (.bcd3(SW[15:12]), .bcd2(SW[11:8]), .bcd1(SW[7:4]), .bcd0(SW[3:0]), .bin(BTB_M1B));
CC CC_1 (.G1(SW[15:12]), .A1(R1_F1), .G2(SW[11:8]), .A2(R2_F2), .G3(SW[7:4]), .A3(R3_F3), .G4(SW[3:0]), .A4(R4_F4), .COR(CC_M2S));

endmodule
