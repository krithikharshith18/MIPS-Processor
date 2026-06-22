module IFID(
    input clk,
    input reset,
    input [31:0] Instruction_Code,
    input JumpPC,
    output reg [31:0] IFID_Instruction_Code
    );
    
always @ (posedge clk) begin
    if (JumpPC == 1)
        IFID_Instruction_Code <= 32'b0;
    else
        IFID_Instruction_Code <= Instruction_Code;
end

always @ (negedge reset) begin
    IFID_Instruction_Code <= 0;
end
    
endmodule