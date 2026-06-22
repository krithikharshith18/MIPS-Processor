module Instruction_Fetch(
    input clk,
    input reset, 
    input JumpPC,
    input [27:0] Jump_Offset_Extended,
    output [31:0] Instruction_Code
);

reg [31:0] PC;

Instruction_Memory IM1(.PC(PC), .reset(reset),
 .Instruction_Code(Instruction_Code));

always @ (negedge reset)
begin
    PC <= 0;
end

always @ (posedge clk)
begin
    PC <= JumpPC ? {Jump_Offset_Extended, PC[3:0]} : PC + 4; 
end
endmodule