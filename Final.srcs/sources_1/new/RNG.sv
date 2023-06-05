`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 05:44:17 PM
// Design Name: 
// Module Name: RNG
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


module RNG(
  input GEN,
  input CLK,
  output logic [3:0] NUM
);

  reg [3:0] random_num;
  reg [3:0] binary_num;

  always_ff @(posedge CLK) begin
    if (GEN) begin
      random_num = $random % 10; // Generate random number from 0 to 9
      NUM <= binary_num;
    end
  end

  always_comb begin
    case (random_num)
      0: binary_num = 4'b0000;
      1: binary_num = 4'b0001;
      2: binary_num = 4'b0010;
      3: binary_num = 4'b0011;
      4: binary_num = 4'b0100;
      5: binary_num = 4'b0101;
      6: binary_num = 4'b0110;
      7: binary_num = 4'b0111;
      8: binary_num = 4'b1000;
      9: binary_num = 4'b1001;
      10: binary_num = 4'b1001;
      default: binary_num = 4'b0000;
    endcase
  end

endmodule