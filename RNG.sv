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
  input wire CLK,         // System clock input
  input wire GEN,           // Button input signal
  output reg [3:0] RN_1,     // 1st digit in binary
  output reg [3:0] RN_2,     // 2nd digit in binary
  output reg [3:0] RN_3,     // 3rd digit in binary
  output reg [3:0] RN_4      // 4th digit in binary
);

reg GEN_prev;               // Previous state of GEN button
reg [31:0] count;           // Counter to keep track of nanoseconds

always @(posedge CLK) begin
  if (GEN == 1 && GEN_prev == 0) begin
    // Button pressed, start counting
    count <= 0;
  end else if (GEN == 0 && GEN_prev == 1) begin
    // Button released, store the count value
    RN_1 <= (count[31:28] == 4'd10) ? 4'd6 :
            (count[31:28] == 4'd11) ? 4'd1 :
            (count[31:28] == 4'd12) ? 4'd5 :
            (count[31:28] == 4'd13) ? 4'd9 :
            (count[31:28] == 4'd14) ? 4'd3 :
            (count[31:28] == 4'd15) ? 4'd8 :
            count[31:28];  // 1st digit in binary

    RN_2 <= (count[27:24] == 4'd10) ? 4'd6 :
            (count[27:24] == 4'd11) ? 4'd1 :
            (count[27:24] == 4'd12) ? 4'd5 :
            (count[27:24] == 4'd13) ? 4'd9 :
            (count[27:24] == 4'd14) ? 4'd3 :
            (count[27:24] == 4'd15) ? 4'd8 :
            count[27:24];  // 2nd digit in binary

    RN_3 <= (count[23:20] == 4'd10) ? 4'd6 :
            (count[23:20] == 4'd11) ? 4'd1 :
            (count[23:20] == 4'd12) ? 4'd5 :
            (count[23:20] == 4'd13) ? 4'd9 :
            (count[23:20] == 4'd14) ? 4'd3 :
            (count[23:20] == 4'd15) ? 4'd8 :
            count[23:20];  // 3rd digit in binary

    RN_4 <= (count[19:16] == 4'd10) ? 4'd6 :
            (count[19:16] == 4'd11) ? 4'd1 :
            (count[19:16] == 4'd12) ? 4'd5 :
            (count[19:16] == 4'd13) ? 4'd9 :
            (count[19:16] == 4'd14) ? 4'd3 :
            (count[19:16] == 4'd15) ? 4'd8 :
            count[19:16];  // 4th digit in binary
  end

  if (GEN == 1) begin
    // Button is held down, increment the count
    count <= count + 1;
  end

  GEN_prev <= GEN;
end

endmodule