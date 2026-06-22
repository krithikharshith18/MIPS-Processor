module Control_Signal_Generator(
    input [31:0] Instruction_Code,
    output reg RegWrite,
    
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg B_Select,
    output reg Operation,
    output reg RdRt,
    output reg JumpPC,
    output reg Swap_Enablee
);

wire [5:0] Opcode = Instruction_Code[31:26];
wire [5:0] Function = Instruction_Code[5:0];
// IF RdRt 1,choose Rd as destination
always@(*)
begin
// ADD and AND
    if (Opcode == 000000) begin
    case (Function)
    6'b100100 : Operation = 0;
    6'b100000 : Operation = 1;
    default : Operation = 0;
    endcase
    end


   case(Opcode)
    //ADD and AND
    6'b000000 : begin
                B_Select = 0;
                JumpPC = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                RdRt = 1;
                Swap_Enablee = 0;
     
     
              end
              
     //B_Select =0 for register and 1 for Immediate         
    // ADDI
    6'b001000 : begin
                B_Select = 1;
                JumpPC = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                RdRt = 0;
                Operation = 1;
                Swap_Enablee = 0;
                end
    
    // SWAP
     6'b100011 : begin
                B_Select = 0;
                JumpPC = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                RdRt = 0;
                Operation = 0;
                Swap_Enablee = 1;
                end
    // JUMP
    6'b000010 : begin
                B_Select = 0;
                JumpPC = 1;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                RdRt = 0;
                Operation = 1;
                Swap_Enablee = 0;
                end

     default :  begin
                B_Select = 0;
                JumpPC = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                RdRt = 0;
                Operation = 0;
                Swap_Enablee = 0;
                end
    endcase
end
endmodule

