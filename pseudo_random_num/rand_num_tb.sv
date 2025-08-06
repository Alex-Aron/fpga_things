`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:41:16 PM
// Design Name: 
// Module Name: rand_num_tb
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


module rand_num_tb #(
    parameter int WIDTH = 8
);
logic[3:0] an = 4'd0;
logic clk = 1'b0, rst, dp;
logic set = 1'b1;
logic[6:0] seg = 7'd0;
logic[WIDTH-1:0] in = '0;

rand_num #(.WIDTH(WIDTH)) UUT (
    .clk(clk),
    .rst(rst),
    .set(set),
    .seg(seg),
    .an(an),
    .dp(dp),
    .seed(in)
);

initial begin : clk_gen 
    forever #5 clk <= ~clk;
end

initial begin
    rst = 1'b1;
   // set = 1'b0;
    #10;
    rst = 1'b0;
    #5000;
    in = 8'd68;
    #100;
    
    set = 1'b1;
    #200;
    set = 1'b0;
    #2000000;
    $display("Simulation finished");
    $finish;
end

endmodule
