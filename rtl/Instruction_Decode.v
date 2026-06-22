module Instruction_Decode(
    input [31:0] Instruction_Code,
    output [4:0] Rs,
    output [4:0] Rt,
    output [4:0] Rd,
    output [27:0] Jump_Offset_Extended,
    output [31:0] Sign_Extended_Offset,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output MemToReg,
    output B_Select,
    output Operation,
    output RdRt,
    output JumpPC,
    output Swap_Enablee
    );
    
    Sign_Extender SE1(.Offset(Instruction_Code[15:0]), 
    .Sign_Extended_Offset(Sign_Extended_Offset));

    Jump_Extender JE1(.Jump_Offset(Instruction_Code[25:0]), 
    .Jump_Offset_Extended(Jump_Offset_Extended));
    
    Control_Signal_Generator CSG1(.Instruction_Code(Instruction_Code), 
    .RegWrite(RegWrite), .MemRead(MemRead),.MemWrite(MemWrite), .MemToReg(MemToReg), 
    .B_Select(B_Select), .Operation(Operation), .RdRt(RdRt), .JumpPC(JumpPC), .Swap_Enablee(Swap_Enablee));

    assign Rs = Instruction_Code[25:21];
    assign Rt = Instruction_Code[20:16];
    assign Rd = Instruction_Code[15:11];
    
endmodule