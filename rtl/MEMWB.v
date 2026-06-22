module MEMWB(
    input [4:0] EXMEM_Rs,
    input [4:0] EXMEM_Rt,
    input clk, 
    input reset,
    input Swap_Enable2,
    input [31:0] EXMEM_Result,
    input [31:0] EXMEM_Result_Swap,
    input [31:0] Data,
    input [4:0] EXMEM_DestinationRegister,
    input EXMEM_MemToReg,
    input EXMEM_RegWrite,
    output reg [31:0] MEMWB_Result,
    output reg [31:0] MEMWB_Result_Swap,
    output reg [31:0] MEMWB_Data,
    output reg [4:0] MEMWB_DestinationRegister,
    output reg MEMWB_MemToReg,
    output reg MEMWB_RegWrite,
    output reg Swap_Enable3,
    output reg [4:0] MEMWB_Rs,
    output reg [4:0] MEMWB_Rt
);

always@(negedge reset)
begin
    MEMWB_Result <= 0;
    MEMWB_Data <= 0;
    MEMWB_DestinationRegister <= 0;
    MEMWB_MemToReg <= 0;
    MEMWB_RegWrite <= 0;
    MEMWB_Result_Swap <= 0;
    Swap_Enable3 <= 0;
    MEMWB_Rs <= 0;
    MEMWB_Rt <= 0;
    
end

always@(posedge clk)
begin
    MEMWB_Result <= EXMEM_Result;
    MEMWB_Data <= Data;
    MEMWB_DestinationRegister <= EXMEM_DestinationRegister;
    MEMWB_MemToReg <= EXMEM_MemToReg;
    MEMWB_RegWrite <= EXMEM_RegWrite;
    MEMWB_Result_Swap <= EXMEM_Result_Swap;
    Swap_Enable3 <= Swap_Enable2;
    MEMWB_Rs <= EXMEM_Rs;
    MEMWB_Rt <= EXMEM_Rt;
end
endmodule
