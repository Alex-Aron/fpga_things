`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 11:54:09 AM
// Design Name: 
// Module Name: mux
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


module display_mux (
        input logic[3:0] bcd3, bcd2, bcd1, bcd0,
        input logic clk,
        output logic[6:0] out,
        output logic[3:0] an,
        output logic dp
    );
    logic[1:0] digit_sel = '0;
    logic[3:0] curr_digit;

    always_ff @(posedge clk) begin
        digit_sel <= digit_sel + 1;
    end

    always_comb begin
        case (digit_sel)
            2'b00: begin
                an = 4'b1110;
                curr_digit = bcd0;
            end 
            2'b01:  begin
                an = 4'b1101;
                curr_digit = bcd1;
            end
            2'b10: begin
                an = 4'b1110;
                curr_digit = bcd0;
            end
            2'b11: begin
                an = 4'b1101;
                curr_digit = bcd1;
            end
        endcase
    end

    hex_to_seven_seg dispaly(
        .in(curr_digit),
        .a_to_g_n(out),
        .dp(dp)
    );
endmodule
