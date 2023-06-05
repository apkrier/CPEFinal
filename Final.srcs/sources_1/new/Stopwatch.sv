`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 08:37:57 PM
// Design Name: 
// Module Name: Stopwatch
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

// This module is an accumulator that counts the time passed in seconds. If the combo is guessed correctly, the time stops

module Stopwatch(
    input CLK,
    input CLR,
    input DNE,
    output logic [13:0] TM
    );
    
always_ff @ (posedge CLK)
    begin
        if (CLR)
            TM = 0;
        else if (DNE)
            TM = TM;
        else if (!CLR)
            TM = TM + 1;
        
    end
        
    
endmodule
