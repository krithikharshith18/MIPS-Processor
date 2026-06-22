`timescale 1ns / 1ps


module Processor(
    input clk,
    input reset,
    output swap
    );
wire [31:0] D1;
wire [31:0] D2;


wire [4:0] Rt_Swap;    
wire [4:0] Rs_Swap; 



    
wire [4:0] EXMEM_Rs;    
wire [4:0] EXMEM_Rt; 
wire [4:0] MEMWB_Rs; 
wire [4:0] MEMWB_Rt; 
wire Swappy;
wire [31:0] WriteBackResult_Swap;  
wire [31:0] Result_Swap;
wire [31:0] EXMEM_Result_Swap;
wire [31:0] MEMWB_Result_Swap;
wire Swap_Enablee;    
wire Swap_Enable;
wire Swap_Enable1;
wire Swap_Enable2;
wire Swap_Enable3;
wire Swap_Enable4;

// IF Stage Initializations
wire JumpPC;
wire [27:0] Jump_Offset_Extended;
wire [31:0] Instruction_Code;

// ID Stage Initializations
wire [31:0] IFID_Instruction_Code;
wire [4:0] Rs;
wire [4:0] Rt;
wire [4:0] Rd;
wire [31:0] Sign_Extended_Offset;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire MemToReg;
wire B_Select;
wire Operation;
wire RdRt;

// RR Stage Initializations
wire [4:0] IDRR_Rs;
wire [4:0] IDRR_Rt;
wire [4:0] IDRR_Rd;
wire [31:0] IDRR_Sign_Extended_Offset;

wire IDRR_RegWrite;
wire IDRR_MemRead;
wire IDRR_MemWrite;
wire IDRR_MemToReg;
wire IDRR_B_Select;
wire IDRR_Operation;
wire IDRR_RdRt;

wire [31:0] Rs_Data;
wire [31:0] Rt_Data;

// EX Stage Initializations
wire RREX_RegWrite;
wire RREX_MemRead;
wire RREX_MemWrite;
wire RREX_MemToReg;
wire RREX_B_Select;
wire RREX_Operation;
wire RREX_RdRt;

wire [4:0] RREX_Rs;
wire [4:0] RREX_Rt;
wire [4:0] RREX_Rd;
wire [31:0] RREX_Sign_Extended_Offset;
wire [31:0] RREX_Rs_Data;
wire [31:0] RREX_Rt_Data;

wire [1:0] FRs;
wire [1:0] FRt;
wire [4:0] DestinationRegister;
wire [31:0] Result;

// MEM Stage Initializations
wire [31:0] EXMEM_Result;
wire [4:0] EXMEM_DestinationRegister;
wire EXMEM_RegWrite;
wire [31:0] EXMEM_Rt_Data;
wire EXMEM_MemRead;
wire EXMEM_MemWrite;
wire EXMEM_MemToReg;

wire [31:0] Data;

// WB Stage Initializations
wire [31:0] WriteBackResult;
wire [4:0] MEMWB_DestinationRegister;
wire MEMWB_RegWrite;
wire [31:0] MEMWB_Result;
wire [31:0] MEMWB_Data;
wire MEMWB_MemToReg;

Instruction_Fetch Instruction_Fetch_Unit(.clk(clk), .reset(reset), .JumpPC(JumpPC), 
.Jump_Offset_Extended(Jump_Offset_Extended), .Instruction_Code(Instruction_Code));

IFID IFID_Register(.clk(clk),.reset(reset), .Instruction_Code(Instruction_Code), .JumpPC(JumpPC),
 .IFID_Instruction_Code(IFID_Instruction_Code));

Instruction_Decode Instruction_Decoder_Unit(.Instruction_Code(IFID_Instruction_Code), 
.RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg(MemToReg), 
.B_Select(B_Select), .Operation(Operation), .RdRt(RdRt), .JumpPC(JumpPC), 
.Rs(Rs), .Rt(Rt), .Rd(Rd), .Jump_Offset_Extended(Jump_Offset_Extended), 
.Sign_Extended_Offset(Sign_Extended_Offset), .Swap_Enablee(Swap_Enablee));

IDRR IDRR_Register(.clk(clk), .reset(reset), .RegWrite(RegWrite), .MemRead(MemRead), 
.MemWrite(MemWrite), .MemToReg(MemToReg), .B_Select(B_Select), .Operation(Operation), 
.RdRt(RdRt), .Rs(Rs), .Rt(Rt), .Rd(Rd), .Sign_Extended_Offset(Sign_Extended_Offset), 
.IDRR_RegWrite(IDRR_RegWrite), .IDRR_MemRead(IDRR_MemRead), .IDRR_MemWrite(IDRR_MemWrite), .IDRR_MemToReg(IDRR_MemToReg), 
.IDRR_B_Select(IDRR_B_Select), .IDRR_Operation(IDRR_Operation), .IDRR_RdRt(IDRR_RdRt), 
.IDRR_Rs(IDRR_Rs), .IDRR_Rt(IDRR_Rt), .IDRR_Rd(IDRR_Rd), 
.IDRR_Sign_Extended_Offset(IDRR_Sign_Extended_Offset), .Swap_Enablee(Swap_Enablee), .Swappy(Swappy)); 

Register_File Register_File_Unit(.clk(clk), .reset(reset), .RegWrite(MEMWB_RegWrite), 
.Rs(IDRR_Rs), .Rt(IDRR_Rt), .Rd(MEMWB_DestinationRegister), .WriteData(WriteBackResult), .WriteData2(D2),
.Rs_Data(Rs_Data), .Rt_Data(Rt_Data), .Swap_Enable3(Swap_Enable3), .Rs_Swap(MEMWB_Rs), .Rt_Swap(MEMWB_Rt), .WriteData1(D1));

RREX RREX_Register(.clk(clk), .reset(reset), .Rs_Data(Rs_Data), .Rt_Data(Rt_Data), 
.IDRR_RegWrite(IDRR_RegWrite), .IDRR_MemRead(IDRR_MemRead), .IDRR_MemWrite(IDRR_MemWrite), 
.IDRR_MemToReg(IDRR_MemToReg), .IDRR_B_Select(IDRR_B_Select), .IDRR_Operation(IDRR_Operation), 
.IDRR_RdRt(IDRR_RdRt), .IDRR_Rs(IDRR_Rs), .IDRR_Rt(IDRR_Rt), .IDRR_Rd(IDRR_Rd), 
.IDRR_Sign_Extended_Offset(IDRR_Sign_Extended_Offset), 
.RREX_RegWrite(RREX_RegWrite), .RREX_MemRead(RREX_MemRead), .RREX_MemWrite(RREX_MemWrite), 
.RREX_MemToReg(RREX_MemToReg), .RREX_B_Select(RREX_B_Select), .RREX_Operation(RREX_Operation), 
.RREX_RdRt(RREX_RdRt), .RREX_Rs(RREX_Rs), .RREX_Rt(RREX_Rt), .RREX_Rd(RREX_Rd), 
.RREX_Sign_Extended_Offset(RREX_Sign_Extended_Offset),
.RREX_Rs_Data(RREX_Rs_Data), .RREX_Rt_Data(RREX_Rt_Data), .Swappy(Swappy), .Swap_Enable(Swap_Enable));

ALU_F ALU_With_Forwarding_Unit(.FRs(FRs), .FRt(FRt), .RREX_B_Select(RREX_B_Select),
.RREX_Operation(RREX_Operation), .RREX_Rt(RREX_Rt), .RREX_Rd(RREX_Rd), .RREX_RdRt(RREX_RdRt), .RREX_Rs_Data(RREX_Rs_Data),
.RREX_Rt_Data(RREX_Rt_Data), .RREX_Sign_Extended_Offset(RREX_Sign_Extended_Offset), 
.EXMEM_Result(EXMEM_Result), .WriteBackResult(WriteBackResult),
.DestinationRegister(DestinationRegister), .Result(Result),
.Swap_Enable(Swap_Enable),
.Result_Swap(Result_Swap)); 

Forwarding_Unit Forwarding_Unit(.EXMEM_DestinationRegister(EXMEM_DestinationRegister), .MEMWB_DestinationRegister(MEMWB_DestinationRegister),
.EXMEM_RegWrite(EXMEM_RegWrite), .MEMWB_RegWrite(MEMWB_RegWrite),
.RREX_Rs(RREX_Rs), .RREX_Rt(RREX_Rt), .FRs(FRs),
.FRt(FRt));

EXMEM EXMEM_Register(.clk(clk), .reset(reset), .Result(Result), 
.RREX_Rt_Data(RREX_Rt_Data), .RREX_MemRead(RREX_MemRead), 
.RREX_MemWrite(RREX_MemWrite), 
.RREX_MemToReg(RREX_MemToReg), .RREX_RegWrite(RREX_RegWrite),
.DestinationRegister(DestinationRegister), .EXMEM_DestinationRegister(EXMEM_DestinationRegister), 
.EXMEM_Result(EXMEM_Result), .EXMEM_Rt_Data(EXMEM_Rt_Data),
.EXMEM_MemRead(EXMEM_MemRead), 
.EXMEM_MemWrite(EXMEM_MemWrite), 
.EXMEM_MemToReg(EXMEM_MemToReg), .EXMEM_RegWrite(EXMEM_RegWrite), .Swap_Enable(Swap_Enable),
 .Result_Swap(Result_Swap),
 .EXMEM_Result_Swap(EXMEM_Result_Swap), .Swap_Enable2(Swap_Enable2),
 .RREX_Rs(RREX_Rs), .RREX_Rt(RREX_Rt), .EXMEM_Rs(EXMEM_Rs), .EXMEM_Rt(EXMEM_Rt));

Data_Memory Data_Memory_Unit(.reset(reset), .Address(EXMEM_Result), 
.WriteData(EXMEM_Rt_Data), .MemWrite(EXMEM_MemWrite), .MemRead(EXMEM_MemRead), 
.Data(Data));

MEMWB MEMWB_Register(.clk(clk), .reset(reset),
.EXMEM_Result(EXMEM_Result), .Data(Data),
.EXMEM_DestinationRegister(EXMEM_DestinationRegister),
.EXMEM_MemToReg(EXMEM_MemToReg),
.EXMEM_RegWrite(EXMEM_RegWrite),
.MEMWB_Result(MEMWB_Result),
.MEMWB_Data(MEMWB_Data),
.MEMWB_DestinationRegister(MEMWB_DestinationRegister),
.MEMWB_MemToReg(MEMWB_MemToReg),
.MEMWB_RegWrite(MEMWB_RegWrite),
.Swap_Enable2(Swap_Enable2),
.Swap_Enable3(Swap_Enable3),
.EXMEM_Result_Swap(EXMEM_Result_Swap),
.MEMWB_Result_Swap(MEMWB_Result_Swap),
.EXMEM_Rs(EXMEM_Rs), .EXMEM_Rt(EXMEM_Rt), .MEMWB_Rs(MEMWB_Rs), .MEMWB_Rt(MEMWB_Rt));

Writeback Writeback_Unit(.clk(clk),
.MEMWB_Rs(MEMWB_Rs), .MEMWB_Rt(MEMWB_Rt), .Rt_Swap(Rt_Swap), .Rs_Swap(Rs_Swap),
 .MEMWB_Result_Swap(MEMWB_Result_Swap), .MEMWB_Result(MEMWB_Result), .MEMWB_Data(MEMWB_Data), .MEMWB_MemToReg(MEMWB_MemToReg), .WriteBackResult(WriteBackResult), .WriteBackResult_Swap(WriteBackResult_Swap), .Swap_Enable3(Swap_Enable3), 
 .D1(D1), .D2(D2));


assign swap = D1;
endmodule
