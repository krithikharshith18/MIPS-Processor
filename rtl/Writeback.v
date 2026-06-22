module Writeback (
    input clk,
    input [4:0] MEMWB_Rs,
    input [4:0] MEMWB_Rt,
    input [31:0] MEMWB_Result,
    input [31:0] MEMWB_Result_Swap,
    input [31:0] MEMWB_Data,
    input Swap_Enable3,
    input MEMWB_MemToReg,
    output reg [31:0] WriteBackResult,
    output reg [31:0] WriteBackResult_Swap,
    
    output reg [4:0] Rt_Swap,
    output reg [4:0] Rs_Swap,
    
    output reg [31:0] D1,
    output reg [31:0] D2
);

always @ (*) begin
    if (MEMWB_MemToReg == 0) begin
        WriteBackResult = MEMWB_Result;
        WriteBackResult_Swap = MEMWB_Result_Swap;
        
        end
    else 
        WriteBackResult = MEMWB_Data;
end
///
always@(*) begin
D1 <= MEMWB_Result;
D2 <= MEMWB_Result_Swap;
end





endmodule