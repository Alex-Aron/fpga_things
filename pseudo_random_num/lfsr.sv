`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 01:55:42 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr #(parameter WIDTH=8)
    (
        input logic clk, rst, set,
        input logic[WIDTH-1:0] load_in,
        output logic[WIDTH-1:0] rnd

    );
    logic feedback;
    generate 
        if (WIDTH == 4) begin
            assign feedback = rnd[3] ^ rnd[2];
        end else if (WIDTH == 8) begin 
            assign feedback = rnd[7] ^ rnd[5] ^ rnd[4] ^ rnd[3];
            // 2^n -1. 3 bits
            // 3C
            // 0011 1100
            // feedback = 0 ^ 1 ^ 1 ^ 1 = 1 
            // 0111 1001
            // 79
        end else if (WIDTH == 16) begin
            assign feedback = rnd[15] ^ rnd[13] ^ rnd[12] ^ rnd[10];
        end else begin
            initial begin $error("Enter a width of 4, 8, or 16"); end
        end
    endgenerate

    always_ff @(posedge clk or posedge rst) begin
        if (set) begin
           rnd <= load_in;
        end else if (rst) begin
            rnd <= '1;
        end else begin
            rnd <= {rnd[WIDTH-2:0], feedback};
        end
    end

endmodule
