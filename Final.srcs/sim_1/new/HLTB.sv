`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 09:07:06 PM
// Design Name: 
// Module Name: HLTB
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


module HLTB();
    logic HTCLK;
    logic HTCLR;
    logic [7:0] HTSEG;
    logic [3:0] HTAN;
    logic [3:0] HTLED;
    logic [15:0] HTSW;
    logic HTCT;
    
HL UUT (.HLCLK(HTCLK), .HLCLR(HTCLR), .HLSEG(HTSEG), .HLAN(HTAN), .SW(HTSW), .LED(HTLED), .HLCT(HTCT));

always begin
HTCLK = 1;
#5;
HTCLK = 0;
#5;
end 

always begin
    #10 HTCLR = 1;
        HTCT = 0;
        HTSW = 16'b1001000010000001;
    #10 HTCLR = 0;
        HTCT = 0;
        HTSW = 16'b1001000010000000;
    #10 HTCLR = 0;
        HTCT = 0;
        HTSW = 16'b0000000000000000;
   
end

endmodule
