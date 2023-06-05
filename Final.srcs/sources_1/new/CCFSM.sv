`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 06:17:38 PM
// Design Name: 
// Module Name: CCFSM
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


module CCFSM(
    input [3:0] ANUM,
    input [3:0] GNUM,
    input FCLK,
    output logic LED
    );
    
typedef enum {STB0, STB1, STB2, STB3, STB4, STF} STATES;
STATES PS, NS;

always_ff@(posedge FCLK) 
    begin 
        PS <= NS;
    end 
    
always_comb begin
    case(PS)  
        STB0: begin
            LED = 0;
            if (ANUM[0] == GNUM[0]) begin
                NS = STB1;
            end 
            else begin
                NS = STB0;
            end
        end
        STB1: begin
            LED = 0;
            if (ANUM[1] == GNUM[1]) begin
                NS = STB2;
            end
            else begin
                NS = STB0;
            end
        end
        STB2: begin
            LED = 0;
            if (ANUM[2] == GNUM[2]) begin
                NS = STB3;
            end 
            else begin
                NS = STB0;
            end
        end
        STB3: begin
            LED = 0;
            if (ANUM[3] == GNUM[3]) begin
                NS = STF;
            end 
            else begin
                NS = STB0;
            end
        end
        STF: begin
            LED = 1;
            NS = STB0;
        end
        default NS = STB0;
    endcase 
end         
    
endmodule
