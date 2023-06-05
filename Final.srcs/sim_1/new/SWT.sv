`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 08:43:13 PM
// Design Name: 
// Module Name: SWT
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


module SWT();
    logic TCLK;
    logic TCLR;
    logic [13:0] TTM;
    
Stopwatch UUT (.CLK(TCLK), .CLR(TCLR), .TM(TTM));

always begin
TCLK = 1;
#5;
TCLK = 0;
#5;
end 

always begin
    #10 TCLR = 0;
    #10 TCLR = 0;
    #10 TCLR = 0;
    #10 TCLR = 0;
    #10 TCLR = 0;
    #10 TCLR = 1;
    #10 TCLR = 0;
    #10 TCLR = 0;
    #10 TCLR = 0;
end
    
endmodule
