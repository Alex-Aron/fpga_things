`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 09:41:28 AM
// Design Name: 
// Module Name: hex_to_seven_seg
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


module hex_to_seven_seg(
    input logic[3:0] in,
    output logic[6:0] a_to_g_n, // 7 segments ordered ABCDEFG _n cause active low
    output logic dp // dot on hex
    );
    always_comb begin
        dp = 1'b1; // turn it off
        case (in) 
            4'b0000: a_to_g_n = 7'b0000001; // 0 all but G /E
            4'b0001: a_to_g_n = 7'b1001111;
            4'b0010: a_to_g_n = 7'b0010010;
            4'b0011: a_to_g_n = 7'b0000110;
            4'b0100: a_to_g_n = 7'b1001100;
            4'b0101: a_to_g_n = 7'b0100100;
            4'b0110: a_to_g_n = 7'b0100000;
            4'b0111: a_to_g_n = 7'b0001111;
            4'b1000: a_to_g_n = '0;
            4'b1001: a_to_g_n = 7'b0000100;
            4'b1010: a_to_g_n = 7'b0001000;
            4'b1011: a_to_g_n = 7'b1100000;
            4'b1100: a_to_g_n = 7'b0110001;
            4'b1101: a_to_g_n = 7'b1000010;
            4'b1110: a_to_g_n = 7'b0110000;
            4'b1111: a_to_g_n = 7'b0111000;
        endcase
    end
endmodule
