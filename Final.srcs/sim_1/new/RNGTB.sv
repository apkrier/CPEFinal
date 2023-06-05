`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 05:51:24 PM
// Design Name: 
// Module Name: RNGTB
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


module RNGTB();
    logic TGEN;
    logic TCLK;
    logic [3:0] TNUM;
    
RNG UUT (.GEN(TGEN), .CLK(TCLK), .NUM(TNUM));

always begin
TCLK = 1;
#5;
TCLK = 0;
#5;
end 

always begin
    #10 TGEN = 1;
    #10 TGEN = 0;
    #10 TGEN = 0;
    #10 TGEN = 0;
    #10 TGEN = 1;
    #10 TGEN = 0;

end

endmodule
