`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 02:18:10 PM
// Design Name: 
// Module Name: rand_num
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


module rand_num #(parameter WIDTH = 8)
    (
        input logic clk, rst, set, 
        input logic[WIDTH-1:0] seed,
        output logic[6:0] seg,
        output logic[3:0] an,
        output logic dp
    );
    //logic[3:0] bcd3, bcd2, bcd1, bcd0;
    logic[WIDTH-1:0] rndom;
    logic [25:0] clkdiv = 26'd0;

    //Clock divider logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            clkdiv <= 26'd0;
        end else begin
            clkdiv <= clkdiv + 1;
        end
    end
    lfsr #(.WIDTH(WIDTH)) prng(
        .clk(clkdiv[25]),
        .rst(rst),
        .set(set),
        .load_in(seed),
        .rnd(rndom)
    );
/*
    assign bcd0 = bcd[3:0];
    generate
        if (WIDTH == 4) begin
            assign bcd1 = '0;
            assign bcd2 = '0;
            assign bcd3 = '0;
        end else if (WIDTH == 8) begin
            assign bcd1 = bcd[7:4];
            assign bcd2 = {2'b00, bcd[9], bcd[8]};
            assign bcd3 = '0;
        end else if (WIDTH == 16) begin
            assign bcd1 = bcd[7:4];
            assign bcd2 = bcd[11:8];
            assign bcd3 = bcd[15:12];
        end else begin 
            initial begin $error("Pick 8, 16, or 4 for the width"); end
        end 
    endgenerate*/

    display_mux display(
        .clk(clkdiv[17]),
        .bcd0(rndom[3:0]),
        .bcd1(rndom[7:4]),
        .bcd2(4'd1),
        .bcd3(4'd1),
        .out(seg),
        .an(an),
        .dp(dp)
    );
    assign rnd = rndom;


endmodule
