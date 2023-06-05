`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 07:17:40 PM
// Design Name: 
// Module Name: CC
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


module CC(
    input [3:0] G1,
    input [3:0] A1,
    input [3:0] G2,
    input [3:0] A2,
    input [3:0] G3,
    input [3:0] A3,
    input [3:0] G4,
    input [3:0] A4,
    output COR
    );
    
    assign COR = (G1 == A1) && (G2 == A2) && (G3 == A3) && (G4 == A4);    

endmodule
