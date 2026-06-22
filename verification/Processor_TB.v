`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 04:41:51
// Design Name: 
// Module Name: Processor_TB
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


module Processor_TB();

reg reset;
reg clk;

Processor UUT(.reset(reset), .clk(clk));

always #5 clk = ~clk;

initial begin
reset = 1;
clk = 0;
#2 reset = 0;
#3 reset = 1;
#200 $finish;
end

endmodule