`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 06:55:10 PM
// Design Name: 
// Module Name: BCD_BIN
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
// This code was taken from the internet. It converts the BCD into binary. Credit goes to 'Real Digital: Electrical and Computer Engineering Education'
// https://www.realdigital.org/doc/6dae6583570fd816d1d675b93578203d

module BCD_BIN (
    input [3:0] bcd3,
    input [3:0] bcd2,
    input [3:0] bcd1,
    input [3:0] bcd0,
    output reg [13:0] bin
);

    reg [3:0] decimal;
    
    always_comb begin
        decimal = (bcd3 * 1000) + (bcd2 * 100) + (bcd1 * 10) + bcd0;
        bin = $unsigned(decimal);
    end
    
    
endmodule